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


@interface CPTCoreDataService ()

@property (nonatomic, strong) NSManagedObjectContext *coreDataContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end


@implementation CPTCoreDataService

- (void)saveToDatabaseCoinsList:(NSArray<NSDictionary *> *)coinsList
				   withOutput:(nonnull id<CPTCoreDataServiceOutputProtocol>)output
{
	for (NSDictionary *coin in coinsList) {
		@autoreleasepool
		{
			NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Coin"];
			fetchRequest.predicate = [NSPredicate predicateWithFormat:@"name ==[c] %@", [coin objectForKey:@"name"]];
			NSError *error = nil;
			NSArray *result = [self.coreDataContext executeFetchRequest:fetchRequest error:&error];

			if (!(result.count == 0) || error)
			{
				continue;
			}

			Coin *newCoin = [NSEntityDescription insertNewObjectForEntityForName:@"Coin"
														  inManagedObjectContext:self.coreDataContext];
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

- (NSManagedObjectContext *)coreDataContext
{
	if (_coreDataContext)
	{
		return _coreDataContext;
	}

	UIApplication *application = [UIApplication sharedApplication];
	__block NSManagedObjectContext *context;
	dispatch_sync(dispatch_get_main_queue(), ^{
		NSPersistentContainer *container = ((AppDelegate *)(application.delegate)).persistentContainer;
		context = container.viewContext;
	});

	_coreDataContext = context;
	return _coreDataContext;
}

@end
