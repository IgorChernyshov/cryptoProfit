//
//  CPTMainScreenFactoryTests.m
//  cryptoProfitTests
//
//  Created by Igor Chernyshov on 29/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import XCTest;
#import <OCMock/OCMock.h>
#import <Expecta/Expecta.h>
#import "CPTMainScreenFactory.h"
#import "CPTMainScreenViewProtocol.h"
#import "CPTMainScreenViewController.h"
#import "CPTMainScreenPresenterProtocol.h"
#import "CPTMainScreenPresenter.h"


@interface CPTMainScreenViewController (Tests)

@property (nonatomic, strong) id <CPTMainScreenPresenterProtocol> presenter;

@end


@interface CPTMainScreenFactoryTests : XCTestCase

@end


@implementation CPTMainScreenFactoryTests

- (void)testFactoryBuildMainScreenModule
{
	// arrange
	CPTMainScreenViewController *testedModule;

	// act
	testedModule = (CPTMainScreenViewController *)[CPTMainScreenFactory build];

	// assert
	expect(testedModule).to.beKindOf([UIViewController class]);
	expect(testedModule).to.conformTo(@protocol(CPTMainScreenViewProtocol));
	expect(testedModule.presenter).to.conformTo(@protocol(CPTMainScreenPresenterProtocol));
	expect(testedModule.presenter.view).to.equal(testedModule);
}

@end
