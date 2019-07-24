//
//  CPTDataParserService.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 19/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTDataParserService.h"
#import "CPTCoreDataServiceProtocol.h"
#import "CPTCoreDataService.h"


@implementation CPTDataParserService


#pragma mark - CPTDataParserServiceProtocol

- (void)createCoinsListFromDictionary:(NSDictionary *)dictionary
						   withOutput:(nonnull id<CPTCoreDataServiceOutputProtocol>)output
{
	if (!dictionary)
	{
		return;
	}

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSMutableArray<NSDictionary *> *coins = [NSMutableArray new];
		NSArray<NSDictionary *> *coinsList = dictionary.allValues;
		for (NSDictionary *coin in coinsList)
		{
			@autoreleasepool
			{
				NSDictionary *newCoin = @{
										  @"name" : [coin objectForKey:@"CoinName"],
										  @"shortName" : [coin objectForKey:@"Name"]
										  };
				[coins addObject:newCoin];
			}
		}
		[CPTCoreDataService saveToDatabaseCoinsList:coins withOutput:output];
	});
}

@end
