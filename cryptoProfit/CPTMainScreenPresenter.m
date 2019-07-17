//
//  CPTMainScreenPresenter.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 16/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit.UINavigationController;
#import "CPTMainScreenPresenter.h"
#import "CPTAddCurrencyFactory.h"
#import "CPTOptionsFactory.h"


@implementation CPTMainScreenPresenter

@synthesize view;

- (void)addCurrencyButtonWasPressed
{
	[self.view.navigationController pushViewController:[CPTAddCurrencyFactory build] animated:YES];
}

- (void)optionsButtonWasPressed
{
	[self.view.navigationController pushViewController:[CPTOptionsFactory build] animated:YES];
}

@end
