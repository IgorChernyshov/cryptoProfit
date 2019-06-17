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

+ (UIViewController<CPTMainScreenViewProtocol> *)build
{
	CPTMainScreenPresenter *presenter = [CPTMainScreenPresenter new];
	CPTMainScreenViewController *view = [[CPTMainScreenViewController alloc] initWithPresenter: presenter];
	view.navigationItem.leftBarButtonItem = [self optionsButton];
	view.navigationItem.rightBarButtonItem = [self addCurrencyButton];
	return view;
}

+ (UIBarButtonItem *)optionsButton
{
	UIBarButtonItem *optionsButton = [UIBarButtonItem new];
	optionsButton.image = [UIImage imageNamed:@"optionsIcon"];
	optionsButton.action = @selector(optionsButtonWasTapped);
	return optionsButton;
}

+ (UIBarButtonItem *)addCurrencyButton
{
	UIBarButtonItem *addCurrencyButton = [UIBarButtonItem new];
	addCurrencyButton.image = [UIImage imageNamed:@"addCurrencyButton"];
	addCurrencyButton.action = @selector(addCurrencyButtonWasTapped);
	return addCurrencyButton;
}

+ (void)optionsButtonWasTapped
{
	
}

+ (void)addCurrencyButtonWasTapped
{
	
}

@end
