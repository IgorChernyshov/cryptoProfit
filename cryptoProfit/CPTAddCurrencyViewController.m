//
//  CPTAddCurrencyViewController.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 17/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTAddCurrencyViewController.h"

@interface CPTAddCurrencyViewController ()

@property (nonatomic, strong) id<CPTAddCurrencyPresenterProtocol> presenter;

@end

@implementation CPTAddCurrencyViewController


#pragma mark - Инициализатор

- (instancetype)initWithPresenter:(id<CPTAddCurrencyPresenterProtocol>)presenter
{
	self = [super init];
	if (self) {
		_presenter = presenter;
	}
	return self;
}

@end
