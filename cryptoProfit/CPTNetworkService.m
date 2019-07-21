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


@interface CPTNetworkService ()

@property (nonatomic, strong) id<CPTAPIFactoryProtocol> apiFactory;
@property (nonatomic, strong) id<CPTDataParserServiceProtocol> dataParser;

@end


@implementation CPTNetworkService


#pragma mark - CPTNetworkServiceInputProtocol

- (void)requestCurrencyList
{
	NSURL *currencyListURL = [self.apiFactory currencyListURL];
	[self performNetworkRequestWithURL:currencyListURL requestType:CPTNetworkRequestTypeCurrencyList];
}


#pragma mark - Приватные методы

- (void)performNetworkRequestWithURL:(NSURL *)url requestType:(CPTNetworkRequestType)requestType
{
	NSMutableURLRequest *request = [NSMutableURLRequest new];
	[request setURL:url];
	[request setHTTPMethod:@"GET"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[request setTimeoutInterval:15];

	NSURLSession *session;
	session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

	NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request
													   completionHandler:^(NSData * _Nullable data,
																		   NSURLResponse * _Nullable response,
																		   NSError * _Nullable error) {
														   if (!data)
														   {
															   return;
														   }
														   NSDictionary *serverResponse = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
														   NSDictionary *responseData = [serverResponse objectForKey:@"Data"];
														   [self requestToParseData:responseData ofRequestType:requestType];
													   }];
	[sessionDataTask resume];
}

- (void)requestToParseData:(NSDictionary *)data ofRequestType:(CPTNetworkRequestType)requestType
{
	switch (requestType)
	{
		case CPTNetworkRequestTypeCurrencyList:
			[self.dataParser createCoinsListFromDictionary:data];
			break;
	}
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
