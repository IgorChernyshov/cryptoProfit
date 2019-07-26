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


@implementation CPTMainScreenPresenter

@synthesize view;


#pragma mark - CPTMainScreenPresenterProtocol

- (void)viewWillAppearOnScreen
{
//	[CPTCoreDataService getUsersCoinsListWithOutput:self];
}

- (void)successfullyLoadedUsersCoinsList:(NSArray<Coin *> *)coinsList
{
	NSMutableArray *coinsNames = [NSMutableArray new];
	for (Coin* coin in coinsList) {
		[coinsNames addObject:coin.name];
	}
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.view showCoinsListWithCoinsNames:[coinsNames copy]];
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
