//
//  CPTNavigationController.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 01/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTNavigationController.h"
#import "CPTMainScreenBuilder.h"
#import "UIColor+CPTColors.h"


@implementation CPTNavigationController

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self configureInitialViewController];
		[self configureNavigationBar];
	}
	return self;
}


#pragma mark - Конфигурация Navigation Controller

- (void)configureInitialViewController
{
	UIViewController<CPTMainScreenViewProtocol> *viewController = [CPTMainScreenBuilder build];
	[self addChildViewController:viewController];
}

- (void)configureNavigationBar
{
	NSDictionary *settings = @{
							   NSForegroundColorAttributeName:[UIColor cpt_green],
							   NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:20.f]
							   };
	self.navigationBar.titleTextAttributes = settings;
	self.navigationBar.barTintColor = [UIColor cpt_darkGray100];
	self.navigationBar.translucent = NO;
}

@end
