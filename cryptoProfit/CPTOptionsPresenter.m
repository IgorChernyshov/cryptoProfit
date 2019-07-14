//
//  CPTOptionsPresenter.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 12/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit.UINavigationController;
#import "CPTOptionsPresenter.h"

@implementation CPTOptionsPresenter

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
