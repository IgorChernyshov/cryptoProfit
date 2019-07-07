//
//  CPTMainScreenFactory.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 16/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTMainScreenFactory.h"
#import "CPTMainScreenPresenter.h"
#import "CPTAddCurrencyFactory.h"


@implementation CPTMainScreenFactory

+ (UIViewController<CPTMainScreenViewProtocol> *)build
{
	CPTMainScreenPresenter *presenter = [CPTMainScreenPresenter new];
	CPTMainScreenViewController *view = [[CPTMainScreenViewController alloc] initWithPresenter: presenter];
	presenter.view = view;
	return view;
}

@end
