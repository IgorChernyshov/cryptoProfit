//
//  CPTNavigationController.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 01/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTNavigationController.h"
#import "CPTMainScreenViewController.h"
#import "UIColor+CPTColors.h"


@implementation CPTNavigationController

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self configureRootViewController];
		[self configureNavigationBar];
	}
	return self;
}

- (void)configureRootViewController
{
	CPTMainScreenViewController *mainViewController = [CPTMainScreenViewController new];
	[self addChildViewController:mainViewController];
}

- (void)configureNavigationBar
{
	self.navigationBar.barTintColor = [UIColor cpt_darkGray100];
	self.navigationBar.opaque = NO;
}

@end
