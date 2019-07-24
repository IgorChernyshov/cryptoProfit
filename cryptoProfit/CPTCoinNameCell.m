//
//  CPTCoinNameCell.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 21/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit;
#import "CPTCoinNameCell.h"
#import "CPTLabel.h"
#import "UIColor+CPTColors.h"


@implementation CPTCoinNameCell


#pragma mark - Жизненный цикл

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self)
	{
		[self setBackgroundColor:[UIColor walletTableViewBackgroundColor]];
		self.selectionStyle = UITableViewCellSelectionStyleNone;

		_coinName = [CPTLabel new];
		[self.contentView addSubview:_coinName];

		[self.contentView addConstraints:@[
										   [_coinName.topAnchor constraintEqualToAnchor:self.contentView.topAnchor
																			   constant:8.f],
										   [_coinName.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor
																				constant:8.f],
										   [_coinName.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor
																				  constant:-8.f],
										   [_coinName.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor
																				 constant:-8.f]
										   ]];
	}
	return self;
}

- (void)prepareForReuse
{
	self.coinName.text = @"";
	[super prepareForReuse];
}

@end
