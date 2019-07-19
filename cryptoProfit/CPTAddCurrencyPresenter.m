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
	[self.networkService requestCurrencyList];
}

@end
