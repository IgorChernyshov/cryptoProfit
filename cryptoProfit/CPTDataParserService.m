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


@interface CPTDataParserService ()

@property (nonatomic, strong) id<CPTCoreDataServiceProtocol> coreDataService;

@end


@implementation CPTDataParserService


#pragma mark - CPTDataParserServiceProtocol

- (void)createCoinsListFromDictionary:(NSDictionary *)dictionary
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
		[self.coreDataService saveToDatabaseCoinsList:coins];
	});
}


#pragma mark - Геттеры

- (id<CPTCoreDataServiceProtocol>)coreDataService
{
	if (_coreDataService)
	{
		return _coreDataService;
	}
	_coreDataService = [CPTCoreDataService new];
	return _coreDataService;
}

@end
