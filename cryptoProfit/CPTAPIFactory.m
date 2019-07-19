//
//  CPTAPIFactory.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 18/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTAPIFactory.h"


@implementation CPTAPIFactory

+ (nonnull NSURL *)getCurrencyListURL
{
	NSURL *requestURL = [NSURL URLWithString:@"https://min-api.cryptocompare.com/data/all/coinlist"];
	return requestURL;
}

@end
