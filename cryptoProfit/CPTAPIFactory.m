//
//  CPTAPIFactory.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 18/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTAPIFactory.h"


@implementation CPTAPIFactory

- (NSURL *)currencyListURL
{
	NSURL *requestURL = [NSURL URLWithString:@"https://min-api.cryptocompare.com/data/all/coinlist"];
	return requestURL;
}

- (NSURL *)coinPriceURLWithShortName:(NSString *)shortName;
{
	NSString *requestString = [NSString stringWithFormat:@"https://min-api.cryptocompare.com/data/price?fsym=%@&tsyms=RUB", shortName];
	NSURL *requestURL = [NSURL URLWithString:requestString];
	return requestURL;
}

@end
