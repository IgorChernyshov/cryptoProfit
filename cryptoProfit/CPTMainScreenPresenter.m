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
#import "Coin+CoreDataClass.h"
#import "CPTAddCurrencyFactory.h"
#import "CPTOptionsFactory.h"


@interface CPTMainScreenPresenter ()

@property (nonatomic, strong) id<CPTCoreDataServiceProtocol> coreDataService;

@end

@implementation CPTMainScreenPresenter

@synthesize view;


#pragma mark - Initializer

- (instancetype)init
{
	self = [super init];
	if (self) {
		_coreDataService = [CPTCoreDataService new];
		_coreDataService.mainScreenPresenter = self;
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
	NSMutableArray<NSString *> *coinsNames = [NSMutableArray new];
	NSMutableArray<NSNumber *> *coinsQuantity = [NSMutableArray new];
	for (Coin* coin in coinsList) {
		[coinsNames addObject:coin.name];
		[coinsQuantity addObject:[NSNumber numberWithFloat:coin.quantity]];
	}
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.view showCoinsListWithCoinsNames:[coinsNames copy] quantity:coinsQuantity];
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
