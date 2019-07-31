//
//  CPTMainScreenPresenter.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 16/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit.UINavigationController;
#import "CPTMainScreenPresenter.h"
#import "CPTMainScreenViewProtocol.h"
#import "CPTCoreDataService.h"
#import "CPTNetworkService.h"
#import "Coin+CoreDataClass.h"
#import "CPTCoinViewModel.h"
#import "CPTAddCurrencyFactory.h"
#import "CPTOptionsFactory.h"


@interface CPTMainScreenPresenter ()

@property (nonatomic, strong) id<CPTNetworkServiceInputProtocol> networkService;
@property (nonatomic, strong) id<CPTCoreDataServiceProtocol> coreDataService;

@end

@implementation CPTMainScreenPresenter

@synthesize view;


#pragma mark - Initializer

- (instancetype)init
{
	self = [super init];
	if (self)
	{
		_coreDataService = [CPTCoreDataService new];
		_networkService = [CPTNetworkService new];
		_networkService.mainScreenPresenter = self;
	}
	return self;
}


#pragma mark - CPTMainScreenPresenterProtocol

- (void)viewWillAppearOnScreen
{
	[self.coreDataService getUsersCoinsListWithOutput:self];
}

- (void)successfullyLoadedUsersCoinsList:(NSArray<Coin *> *)coinsList
{
	NSMutableArray<CPTCoinViewModel *> *coins = [NSMutableArray new];
	for (Coin* coin in coinsList)
	{
		CPTCoinViewModel *coinViewModel = [CPTCoinViewModel new];
		coinViewModel.name = coin.name;
		coinViewModel.shortName = coin.shortName;
		coinViewModel.quantity = [NSNumber numberWithFloat:coin.quantity];
		[self.networkService requestCoinPriceWithShortName:coin.shortName];
		[coins addObject:coinViewModel];
	}
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.view showCoinsListWithCoinsNames:[coins copy]];
	});
}

- (void)receivedPrice:(NSNumber *)price forCoinWithShortName:(NSString *)shortName
{
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.view updateCoinWithShortName:shortName setPrice:price];
	});
}


#pragma mark - Навигация

- (void)addCurrencyButtonWasPressed
{
	[self.view.navigationController pushViewController:[CPTAddCurrencyFactory build] animated:YES];
}

- (void)optionsButtonWasPressed
{
	[self.view.navigationController pushViewController:[CPTOptionsFactory build] animated:YES];
}

@end
