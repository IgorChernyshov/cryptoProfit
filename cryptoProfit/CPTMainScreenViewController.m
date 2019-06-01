//
//  CPTMainScreenViewController.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 23/05/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTMainScreenViewController.h"
#import "UIColor+CPTColors.h"

@interface CPTMainScreenViewController ()

@end

@implementation CPTMainScreenViewController

- (instancetype)init
{
	self = [super init];
	if (self) {
		self.view.backgroundColor = [UIColor cpt_lightGray];
	}
	return self;
}

@end
