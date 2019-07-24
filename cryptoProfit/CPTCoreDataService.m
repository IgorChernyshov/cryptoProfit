//
//  CPTCoreDataService.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 19/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import CoreData;
@import UIKit;
#import "AppDelegate.h"
#import "CPTCoreDataService.h"
#import "CPTAddCurrencyPresenterProtocol.h"
#import "Coin+CoreDataClass.h"
#import "CPTUserSettings.h"


@implementation CPTCoreDataService

+ (void)saveToDatabaseCoinsList:(NSArray<NSDictionary *> *)coinsList
					 withOutput:(nonnull id<CPTCoreDataServiceOutputProtocol>)output
{
	__block NSManagedObjectContext *context;
	dispatch_sync(dispatch_get_main_queue(), ^{
		context = [CPTCoreDataService coreDataContext];
	});
	for (NSDictionary *coin in coinsList) {
		@autoreleasepool
		{
			NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Coin"];
			fetchRequest.predicate = [NSPredicate predicateWithFormat:@"name ==[c] %@", [coin objectForKey:@"name"]];
			NSError *error = nil;
			NSArray *result = [context executeFetchRequest:fetchRequest error:&error];
			if (!(result.count == 0) || error)
			{
				continue;
			}

			Coin *newCoin = [NSEntityDescription insertNewObjectForEntityForName:@"Coin"
														  inManagedObjectContext:[CPTCoreDataService coreDataContext]];
			newCoin.name = [coin objectForKey:@"name"];
			newCoin.shortName = [coin objectForKey:@"shortName"];
			newCoin.quantity = 0.f;
			newCoin.value = 0.f;
			newCoin.delta = 0.f;

			[newCoin.managedObjectContext save:&error];
		}
	}
	[output coinsListWasSaved];
}

+ (void)loadCoinsListWithFilter:(NSString *)filter
						 output:(nonnull id<CPTCoreDataServiceOutputProtocol>)output
{
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Coin"];
	if (filter.length > 0)
	{
		fetchRequest.predicate = [NSPredicate predicateWithFormat:@"name CONTAINS[cd] %@ OR shortName CONTAINS[cd] %@", filter, filter];
	}
	NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
	fetchRequest.sortDescriptors = @[sortDescriptor];
	dispatch_async(dispatch_get_main_queue(), ^{
		NSManagedObjectContext *context = [CPTCoreDataService coreDataContext];
		dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
			NSError *error = nil;
			NSArray *result = [context executeFetchRequest:fetchRequest error:&error];
			[output filteringFinishedWithCoinsList:result];
		});
	});
}

+ (NSManagedObjectContext *)coreDataContext
{
	UIApplication *application = [UIApplication sharedApplication];
	NSManagedObjectContext *context;
	NSPersistentContainer *container = ((AppDelegate *)(application.delegate)).persistentContainer;
	context = container.viewContext;
	return context;
}

@end
