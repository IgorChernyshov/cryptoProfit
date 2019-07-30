//
//  CPTAPIFactoryTests.m
//  cryptoProfitTests
//
//  Created by Igor Chernyshov on 29/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import XCTest;
#import <OCMock/OCMock.h>
#import <Expecta/Expecta.h>
#import "CPTAPIFactory.h"


@interface CPTAPIFactoryTests : XCTestCase

@property (nonatomic, strong) CPTAPIFactory *testedFactory;

@end


@implementation CPTAPIFactoryTests

- (void)setUp
{
	[super setUp];
	self.testedFactory = OCMPartialMock([CPTAPIFactory new]);
}

- (void)tearDown
{
	self.testedFactory = nil;
	[super tearDown];
}

- (void)testFactoryProduceCurrencyListURL
{
	// arrange
	NSURL *testURL;

	// act
	testURL = [self.testedFactory currencyListURL];

	// assert
	expect(testURL).notTo.beNil();
}

- (void)testFactoryProduceCoinPriceURL
{
	// arrange
	NSURL *bitcoinPriceInRublesURL;

	// act
	bitcoinPriceInRublesURL = [self.testedFactory coinPriceURLWithShortName:@"BTC"];
	NSString *stringFromUrl = [NSString stringWithFormat:@"%@", bitcoinPriceInRublesURL];

	// assert
	expect(bitcoinPriceInRublesURL).notTo.beNil();
	expect(stringFromUrl).to.contain(@"BTC");
}

- (void)testFactoryFailToProduceCoinPriceURL
{
	// arrange
	NSURL *bitcoinPriceInRublesURL;

	// act
	bitcoinPriceInRublesURL = [self.testedFactory coinPriceURLWithShortName:@"- -"];

	// assert
	expect(bitcoinPriceInRublesURL).to.beNil();
}



@end
