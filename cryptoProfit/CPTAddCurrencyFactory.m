//
//  CPTAddCurrencyFactory.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 17/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit;
#import "CPTAddCurrencyViewProtocol.h"
#import "CPTAddCurrencyFactory.h"
#import "CPTAddCurrencyViewController.h"
#import "CPTAddCurrencyPresenter.h"


@implementation CPTAddCurrencyFactory

+ (UIViewController<CPTAddCurrencyViewProtocol> *)build
{
	id<CPTAddCurrencyPresenterProtocol> presenter = [CPTAddCurrencyPresenter new];
	UIViewController<CPTAddCurrencyViewProtocol> *view = [[CPTAddCurrencyViewController alloc] initWithPresenter:presenter];
	presenter.view = view;
	
	return view;
}

@end
