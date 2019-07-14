//
//  CPTLabel.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 12/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit.UILabel;
#import "CPTLabel.h"
#import "UIColor+CPTColors.h"

@implementation CPTLabel

- (instancetype)initWithText:(NSString *)text
{
	self = [super init];
	if (self)
	{
		self.translatesAutoresizingMaskIntoConstraints = NO;
		self.numberOfLines = 1;
		self.font = [UIFont fontWithName:@"Helvetica" size:16.0];
		self.textColor = [UIColor defaultTextColor];
		self.text = text;
	}
	return self;
}

@end
