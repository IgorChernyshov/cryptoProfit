//
//  CPTAddCurrencyPresenter.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 17/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit.UINavigationController;
#import "CPTAddCurrencyPresenter.h"
#import "CPTNetworkServiceProtocol.h"
#import "CPTAddCurrencyViewProtocol.h"
#import "CPTNetworkService.h"


@interface CPTAddCurrencyPresenter ()

@property (nonatomic, strong) id<CPTNetworkServiceInputProtocol> networkService;

@end


@implementation CPTAddCurrencyPresenter

@synthesize view;


#pragma mark - Инициализатор

- (instancetype)init
{
	self = [super init];
	if (self)
	{
		_networkService = [CPTNetworkService new];
		_networkService.addCurrencyPresenter = self;
	}
	return self;
}


#pragma mark - Навигация

- (void)backButtonWasPressed
{
	[self.view.navigationController popViewControllerAnimated:YES];
}

- (void)saveButtonWasPressed
{
	[self.view.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Обработчик событий TextFieldDelegate

- (void)textFieldDidBeginEditing
{

}


#pragma mark - CPTAddCurrencyPresenterProtocol

- (void)viewAppearedOnScreen
{
	[self.view loadingStarted];
	[self.networkService requestCurrencyList];
}


#pragma mark - CPTCoreDataServiceOutputProtocol

- (void)coinsListWasSaved
{
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.view loadingFinished];
	});
}

@end
