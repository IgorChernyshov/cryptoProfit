//
//  CPTMainScreenPresenterTests.m
//  cryptoProfitTests
//
//  Created by Igor Chernyshov on 30/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import XCTest;
#import <OCMock/OCMock.h>
#import <Expecta/Expecta.h>
#import "CPTMainScreenPresenter.h"
#import "CPTMainScreenViewController.h"
#import "CPTNetworkServiceProtocol.h"
#import "CPTNetworkService.h"
#import "CPTCoreDataServiceProtocol.h"
#import "CPTCoreDataService.h"
#import "Coin+CoreDataClass.h"


@interface CPTMainScreenPresenter (Tests)

@property (nonatomic, strong) id<CPTNetworkServiceInputProtocol> networkService;
@property (nonatomic, strong) id<CPTCoreDataServiceProtocol> coreDataService;

@end


@interface CPTMainScreenPresenterTests : XCTestCase

@property (nonatomic, strong) CPTMainScreenPresenter *testedPresenter;

@end


@implementation CPTMainScreenPresenterTests

- (void)setUp {
	[super setUp];
	self.testedPresenter = OCMPartialMock([CPTMainScreenPresenter new]);
	self.testedPresenter.networkService = OCMPartialMock([CPTNetworkService new]);
	self.testedPresenter.coreDataService = OCMPartialMock([CPTCoreDataService new]);
	self.testedPresenter.view = OCMPartialMock([[CPTMainScreenViewController alloc] initWithPresenter:self.testedPresenter]);
}

- (void)tearDown {
	self.testedPresenter = nil;
	[super tearDown];
}

- (void)testInitializer
{
	// arrange
	self.testedPresenter = nil;

	// act
	self.testedPresenter = [CPTMainScreenPresenter new];

	// assert
	expect(self.testedPresenter.coreDataService).to.beKindOf([CPTCoreDataService class]);
	expect(self.testedPresenter.networkService).to.beKindOf([CPTNetworkService class]);
	expect(self.testedPresenter.networkService.mainScreenPresenter).to.equal(self.testedPresenter);
	expect(self.testedPresenter.networkService.addCurrencyPresenter).to.beNil();
}

- (void)testUsersCoinsAreRequestedWhenViewWillAppearOnScreen
{
	// arrange
	OCMExpect([self.testedPresenter.coreDataService getUsersCoinsListWithOutput:OCMOCK_ANY]);

	// act
	[self.testedPresenter viewWillAppearOnScreen];

	// assert
	OCMVerifyAll((id)self.testedPresenter);
}

- (void)testNotifiesViewWhenSuccessfullyLoadedUsersCoinsList
{
	// arrange
	OCMExpect([self.testedPresenter.networkService requestCoinPriceWithShortName:OCMOCK_ANY]);
	NSArray<Coin *> *coinsMock = @[OCMClassMock([Coin class])];

	// act
	[self.testedPresenter successfullyLoadedUsersCoinsList:coinsMock];

	// assert
	OCMVerifyAll((id)self.testedPresenter);
}

- (void)testNavigationOnAddCurrencyButtonTapped
{
	// arrange
	OCMExpect([self.testedPresenter.view.navigationController pushViewController:OCMOCK_ANY animated:YES]);

	// act
	[self.testedPresenter addCurrencyButtonWasPressed];

	// assert
	OCMVerifyAll((id)self.testedPresenter);
}

- (void)testNavigationOnOptionsButtonTapped
{
	// arrange
	OCMExpect([self.testedPresenter.view.navigationController pushViewController:OCMOCK_ANY animated:YES]);

	// act
	[self.testedPresenter optionsButtonWasPressed];

	// assert
	OCMVerifyAll((id)self.testedPresenter);
}

@end
