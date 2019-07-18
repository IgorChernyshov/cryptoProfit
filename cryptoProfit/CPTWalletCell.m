//
//  CPTWalletCell.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 16/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit;
#import "CPTWalletCell.h"
#import "CPTLabel.h"
#import "UIColor+CPTColors.h"


@implementation CPTWalletCell


#pragma mark - Инициализатор

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self)
	{
		[self configureUI];
	}
	return self;
}


#pragma mark - Конфигурация UI

- (void)configureUI
{
	[self setBackgroundColor:[UIColor walletTableViewBackgroundColor]];
	
	[self addNameLabel];
	[self addQuantityLabel];
	[self addDeltaLabel];
	[self createConstraints];
}

- (void)addNameLabel
{
	_nameLabel = [[CPTLabel alloc] initWithText:@"Test name"];
	[self.contentView addSubview:_nameLabel];
}

- (void)addQuantityLabel
{
	_quantityLabel = [[CPTLabel alloc] initWithText:@"Test qty"];
	[self.contentView addSubview:_quantityLabel];
}

- (void)addDeltaLabel
{
	_deltaLabel = [[CPTLabel alloc] initWithText:@"Test delta"];
	[self.contentView addSubview:_deltaLabel];
}

- (void)createConstraints
{
	[self.contentView addConstraints:@[
									   [_nameLabel.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:16.f],
									   [_nameLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:16.f],
									   [_nameLabel.rightAnchor constraintEqualToAnchor:self.contentView.centerXAnchor],
									   [_nameLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-16.f],

									   [_quantityLabel.leftAnchor constraintEqualToAnchor:self.contentView.centerXAnchor constant:16.f],
									   [_quantityLabel.centerYAnchor constraintEqualToAnchor:_nameLabel.centerYAnchor],
									   [_quantityLabel.rightAnchor constraintEqualToAnchor:_deltaLabel.leftAnchor constant:-16.f],

									   [_deltaLabel.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-16.f],
									   [_deltaLabel.centerYAnchor constraintEqualToAnchor:_nameLabel.centerYAnchor]
									   ]];
}

@end
