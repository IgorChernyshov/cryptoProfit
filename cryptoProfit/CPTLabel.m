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


#pragma mark - Инициализаторы

- (instancetype)initWithText:(NSString *)text
{
	self = [super init];
	if (self)
	{
		[self defaultInit];
		self.text = text;
	}
	return self;
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self defaultInit];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self defaultInit];
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self defaultInit];
	}
	return self;
}


#pragma mark - Общие настройки для всех инициализаторов

- (void)defaultInit
{
	self.translatesAutoresizingMaskIntoConstraints = NO;
	self.numberOfLines = 1;
	self.font = [UIFont fontWithName:@"Helvetica" size:16.0];
	self.textColor = [UIColor defaultTextColor];
}

@end
