//
//  CPTWalletCell.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 16/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit.UITableViewCell;
#import "CPTWalletCell.h"
#import "UIColor+CPTColors.h"


@implementation CPTWalletCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self)
	{
		[self setBackgroundColor:[UIColor walletTableViewBackgroundColor]];
	}
	return self;
}

@end
