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
#import "Coin+CoreDataClass.h"
#import "CPTUserSettingsService.h"


@interface CPTCoreDataService ()

@property (nonatomic, strong) NSManagedObjectContext *coreDataContext;

@end


@implementation CPTCoreDataService

#pragma mark - Initializer

- (instancetype)init
{
	self = [super init];
	if (self)
	{
		dispatch_async(dispatch_get_main_queue(), ^{
			self->_coreDataContext = [self coreDataContext];
		});
	}
	return self;
}

- (void)saveCoinsList:(NSArray<NSDictionary *> *)coinsList
{
	NSError *error = nil;
	for (NSDictionary *coin in coinsList)
	{
		// Check if coin already exists
		NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Coin"];
		fetchRequest.predicate = [NSPredicate predicateWithFormat:@"name ==[c] %@", coin[@"name"]];
		NSArray *result = [self.coreDataContext executeFetchRequest:fetchRequest error:&error];
		if (result.count > 0)
		{
			continue;
		}
		// Save coin if it doesn't exist
		Coin *newCoin = [NSEntityDescription insertNewObjectForEntityForName:@"Coin"
													  inManagedObjectContext:[self coreDataContext]];
		newCoin.name = coin[@"name"];
		newCoin.shortName = coin[@"shortName"];
		[newCoin.managedObjectContext save:&error];
	}
}

- (void)loadCoinsListWithOutput:(nonnull id<CPTCoreDataServiceOutputProtocol>)output
{
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Coin"];
	NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
	fetchRequest.sortDescriptors = @[sortDescriptor];
	NSError *error = nil;
	NSArray *result = [self.coreDataContext executeFetchRequest:fetchRequest error:&error];
	[output loadedCoinsList:result];
}

- (void)saveUsersCoinWithName:(NSString *)name
					 quantity:(NSNumber *)quantity
					   output:(nonnull id<CPTCoreDataServiceOutputProtocol>)output
{
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Coin"];
	fetchRequest.predicate = [NSPredicate predicateWithFormat:@"name ==[c] %@", name];
	NSError *error = nil;
	NSArray<Coin *> *result = [self.coreDataContext executeFetchRequest:fetchRequest error:&error];
	if (result.count == 1)
	{
		[self updateCoinInCoreDataWithCoin:[result firstObject] quantity:quantity];
		[output usersCoinSavedSuccessfully];
	}
}

- (void)getUsersCoinsListWithOutput:(nonnull id<CPTCoreDataServiceOutputProtocol>)output
{
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Coin"];
	fetchRequest.predicate = [NSPredicate predicateWithFormat:@"quantity != 0"];
	NSError *error = nil;
	NSArray *result = [self.coreDataContext executeFetchRequest:fetchRequest error:&error];
	[output successfullyLoadedUsersCoinsList:result];
}


#pragma mark - Хелперы

- (NSManagedObjectContext *)coreDataContext
{
	if (_coreDataContext)
	{
		return _coreDataContext;
	}
	UIApplication *application = [UIApplication sharedApplication];
	NSPersistentContainer *container = ((AppDelegate *)(application.delegate)).persistentContainer;
	_coreDataContext = container.viewContext;
	return _coreDataContext;
}

- (void)updateCoinInCoreDataWithCoin:(Coin *)coin quantity:(NSNumber *)quantity
{
	coin.quantity = quantity.floatValue;

	NSError *error = nil;
	if ([coin.managedObjectContext save:&error])
	{
		return;
	}
	NSLog(@"Не удалось сохранить объект %@", error.localizedDescription);
}

@end
