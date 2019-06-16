//
//  CPTMainScreenBuilder.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 16/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTMainScreenBuilder.h"
#import "CPTMainScreenPresenter.h"


@implementation CPTMainScreenBuilder

+(UIViewController<CPTMainScreenViewProtocol> *)build
{
	CPTMainScreenPresenter *presenter = [CPTMainScreenPresenter new];
	CPTMainScreenViewController *view = [[CPTMainScreenViewController alloc] initWithPresenter: presenter];
	return view;
}

@end
