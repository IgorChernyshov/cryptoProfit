//
//  CPTNetworkService.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 18/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTNetworkService.h"
#import "CPTAPIFactory.h"


@interface CPTNetworkService ()

@property (nonatomic, strong) CPTAPIFactory *apiFactory;

@end


@implementation CPTNetworkService


#pragma mark - CPTNetworkServiceInputProtocol

- (void)requestCurrencyList
{
	NSURL *currencyListURL = [CPTAPIFactory getCurrencyListURL];
	[self performNetworkRequestWithURL:currencyListURL];
}


#pragma mark - Приватные методы

- (void)performNetworkRequestWithURL:(NSURL *)url
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
														   NSDictionary *temp = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
														   // TODO: Parse and process data
													   }];
	[sessionDataTask resume];
}


#pragma mark - Геттеры

- (CPTAPIFactory *)apiFactory
{
	if (_apiFactory)
	{
		return _apiFactory;
	}
	_apiFactory = [CPTAPIFactory new];
	return _apiFactory;
}

@end
