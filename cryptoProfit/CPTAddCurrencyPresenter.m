//
//  CPTAddCurrencyPresenter.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 17/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit.UINavigationController;
#import "CPTAddCurrencyPresenter.h"

@implementation CPTAddCurrencyPresenter

@synthesize view;

- (void)backButtonWasPressed
{
	[self.view.navigationController popViewControllerAnimated:YES];
}

- (void)saveButtonWasPressed
{
	[self.view.navigationController popViewControllerAnimated:YES];
}

@end
