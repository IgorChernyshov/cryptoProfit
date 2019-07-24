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
#import "CPTUserSettings.h"


@interface CPTAddCurrencyPresenter ()

@property (nonatomic, strong) id<CPTNetworkServiceInputProtocol> networkService;

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
	}
	return self;
}


#pragma mark - Навигация

- (void)backButtonWasPressed
{
	[self.view.navigationController popViewControllerAnimated:YES];
}

- (void)saveButtonWasPressed
{
	[self.view.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Обработчик событий TextField

- (void)userChangedCoinNameToName:(NSString *)name
{
	[CPTCoreDataService loadCoinsListWithFilter:name output:self];
}

- (void)filteringFinishedWithCoinsList:(NSArray<Coin *> *)coinsList
{
	NSMutableArray *coinsNames = [NSMutableArray new];
	for (Coin* coin in coinsList) {
		[coinsNames addObject:coin.name];
	}
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.view showCoinsListWithCoinsNames:[coinsNames copy]];
	});
}


#pragma mark - CPTAddCurrencyPresenterProtocol

- (void)viewAppearedOnScreen
{
	if (![self coinsListUpdateIsNeeded])
	{
		return;
	}
	[self.view loadingStarted];
	[self.networkService requestCurrencyList];
}

- (BOOL)coinsListUpdateIsNeeded
{
	if ([CPTUserSettings coinsListWasUpdatedAfterLaunch])
	{
		return NO;
	}
	return YES;
}


#pragma mark - CPTCoreDataServiceOutputProtocol

- (void)coinsListWasSaved
{
	[CPTUserSettings coinsListHasBeenUpdated];
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.view loadingFinished];
	});
}

@end
