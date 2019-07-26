//
//  CPTDataParserService.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 19/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTDataParserService.h"
#import "CPTAddCurrencyPresenterProtocol.h"
#import "CPTCoreDataServiceProtocol.h"
#import "CPTCoreDataService.h"
#import "Coin+CoreDataClass.h"


@interface CPTDataParserService ()

@property (nonatomic, strong) id<CPTCoreDataServiceProtocol> coreDataService;

@end


@implementation CPTDataParserService


#pragma mark - Initialization

- (instancetype)init
{
	self = [super init];
	if (self) {
		_coreDataService = [CPTCoreDataService new];
	}
	return self;
}


#pragma mark - CPTDataParserServiceProtocol

- (void)createCoinsListFromDictionary:(NSDictionary *)dictionary
						   withOutput:(nonnull id<CPTAddCurrencyPresenterProtocol>)output
{
	if (!dictionary)
	{
		return;
	}

//	dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSMutableArray<NSString *> *coinsNames = [NSMutableArray new];
		NSMutableArray<NSDictionary *> *coins = [NSMutableArray new];
		NSArray<NSDictionary *> *coinsList = dictionary.allValues;
		for (NSDictionary *coin in coinsList)
		{
			@autoreleasepool
			{
				NSString *coinName = [coin objectForKey:@"CoinName"];
				NSString *coinShortName = [coin objectForKey:@"Name"];

				NSDictionary *newCoin = @{
										  @"name" : coinName,
										  @"shortName" : coinShortName
										  };
				[coinsNames addObject:coinName];
				[coins addObject:newCoin];
			}
		}
		[self.coreDataService saveCoinsList:coins];
		[output parsedCoinsListWithNames:[coinsNames copy]];
//	});
}

@end
