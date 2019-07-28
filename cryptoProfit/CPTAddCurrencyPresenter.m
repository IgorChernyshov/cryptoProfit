//
//  CPTAddCurrencyPresenter.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 17/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit.UINavigationController;
#import "CPTAddCurrencyPresenter.h"
#import "CPTNetworkServiceProtocol.h"
#import "CPTAddCurrencyViewProtocol.h"
#import "CPTNetworkService.h"
#import "CPTCoreDataService.h"
#import "Coin+CoreDataClass.h"
#import "CPTUserSettingsService.h"
#import "CPTTextField.h"


@interface CPTAddCurrencyPresenter ()

@property (nonatomic, strong) id<CPTNetworkServiceInputProtocol> networkService;
@property (nonatomic, strong) id<CPTCoreDataServiceProtocol> coreDataService;

@end


@implementation CPTAddCurrencyPresenter

@synthesize view;


#pragma mark - Инициализатор

- (instancetype)init
{
	self = [super init];
	if (self)
	{
		_networkService = [CPTNetworkService new];
		_networkService.addCurrencyPresenter = self;
		_coreDataService = [CPTCoreDataService new];
	}
	return self;
}


#pragma mark - Навигация

- (void)backButtonWasPressed
{
	[self.view.navigationController popViewControllerAnimated:YES];
}

- (void)saveButtonWasPressedWithCoinName:(NSString *)name
								quantity:(NSNumber *)quantity
{
	[self.view loadingStarted];
	[self.coreDataService saveUsersCoinWithName:name
									   quantity:quantity
										 output:self];
}


#pragma mark - Обработчик событий TextField

- (void)userIsSearchingForCoinName:(NSString *)name inArrayOfNames:(NSArray<NSString *> *)names;
{
	if (name.length == 0)
	{
		[self.view showFilteredCoinsListWithCoinsNames:names];
		return;
	}
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", name];
	NSArray<NSString *> *filteredCoinsNames = [names filteredArrayUsingPredicate:predicate];
	[self.view showFilteredCoinsListWithCoinsNames:filteredCoinsNames];
}

- (void)loadedCoinsList:(NSArray<Coin *> *)coinsList
{
	NSMutableArray *coinsNames = [NSMutableArray new];
	for (Coin* coin in coinsList)
	{
		[coinsNames addObject:coin.name];
	}
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.view loadingFinishedWithCoinsNames:[coinsNames copy]];
	});
}


#pragma mark - CPTAddCurrencyPresenterProtocol

- (void)viewAppearedOnScreen
{
	if (![self coinsListUpdateIsNeeded])
	{
		[self.coreDataService loadCoinsListWithOutput:self];
		return;
	}
	[self.view loadingStarted];
	[self.networkService requestCurrencyList];
}

- (BOOL)coinsListUpdateIsNeeded
{
	if ([CPTUserSettingsService coinsListWasUpdatedAfterLaunch])
	{
		return NO;
	}
	return YES;
}

- (void)parsedCoinsListWithNames:(NSArray<NSString *> *)names
{
	[CPTUserSettingsService coinsListHasBeenUpdated];
	names = [names sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.view loadingFinishedWithCoinsNames:names];
	});
}


#pragma mark - CPTCoreDataServiceOutputProtocol

- (void)usersCoinSavedSuccessfully
{
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.view.navigationController popViewControllerAnimated:YES];
	});
}

@end
