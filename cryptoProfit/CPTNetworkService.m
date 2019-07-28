//
//  CPTNetworkService.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 18/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTNetworkService.h"
#import "CPTAPIFactoryProtocol.h"
#import "CPTAPIFactory.h"
#import "CPTDataParserServiceProtocol.h"
#import "CPTDataParserService.h"
#import "CPTCoreDataServiceProtocol.h"
#import "CPTAddCurrencyPresenterProtocol.h"
#import "CPTMainScreenPresenterProtocol.h"
#import "CPTUserSettingsService.h"


@interface CPTNetworkService ()

@property (nonatomic, strong) id<CPTAPIFactoryProtocol> apiFactory;
@property (nonatomic, strong) id<CPTDataParserServiceProtocol> dataParser;

@end


@implementation CPTNetworkService

@synthesize mainScreenPresenter, addCurrencyPresenter;


#pragma mark - CPTNetworkServiceInputProtocol

- (void)requestCurrencyList
{
	NSURL *currencyListURL = [self.apiFactory currencyListURL];
	NSURLSessionDataTask *dataTask;
	dataTask = [[self session] dataTaskWithRequest:[self requestWithURL:currencyListURL]
								 completionHandler:^(NSData * _Nullable data,
													 NSURLResponse * _Nullable response,
													 NSError * _Nullable error) {
									 if (!data || error)
									 {
										 [CPTUserSettingsService coinsListHasBeenUpdated];
										 [self.addCurrencyPresenter viewAppearedOnScreen];
										 return;
									 }
									 NSDictionary *serverResponse = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
									 [self requestToParseCoinsList:serverResponse];
								 }];
	[dataTask resume];
}

- (void)requestCoinPriceWithShortName:(NSString *)shortName;
{
	NSURL *coinPriceURL = [self.apiFactory coinPriceURLWithShortName:shortName];
	NSURLSessionDataTask *dataTask;
	dataTask = [[self session] dataTaskWithRequest:[self requestWithURL:coinPriceURL]
								 completionHandler:^(NSData * _Nullable data,
													 NSURLResponse * _Nullable response,
													 NSError * _Nullable error) {
									 if (!data || error)
									 {
										 return;
									 }
									 NSDictionary *serverResponse = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
									 NSNumber *price = [serverResponse valueForKey:@"RUB"];
									 [self.mainScreenPresenter receivedPrice:price forCoinWithShortName:shortName];
								 }];
	[dataTask resume];
}


#pragma mark - Приватные методы

- (void)requestToParseCoinsList:(NSDictionary *)data
{
	NSDictionary *payload = [data objectForKey:@"Data"];
	[self.dataParser createCoinsListFromDictionary:payload withOutput:self.addCurrencyPresenter];
}


#pragma mark - Хелперы

- (NSMutableURLRequest *)requestWithURL:(NSURL *)url
{
	NSMutableURLRequest *request = [NSMutableURLRequest new];
	[request setURL:url];
	[request setHTTPMethod:@"GET"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[request setTimeoutInterval:15];
	return request;
}

- (NSURLSession *)session
{
	return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
}


#pragma mark - Геттеры

- (id<CPTAPIFactoryProtocol>)apiFactory
{
	if (_apiFactory)
	{
		return _apiFactory;
	}
	_apiFactory = [CPTAPIFactory new];
	return _apiFactory;
}

- (id<CPTDataParserServiceProtocol>)dataParser
{
	if (_dataParser)
	{
		return _dataParser;
	}
	_dataParser = [CPTDataParserService new];
	return _dataParser;
}

@end
