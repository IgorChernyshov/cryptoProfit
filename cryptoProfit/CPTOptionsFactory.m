//
//  CPTOptionsFactory.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 12/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit;
#import "CPTOptionsFactory.h"
#import "CPTOptionsPresenter.h"
#import "CPTOptionsViewController.h"

@implementation CPTOptionsFactory

+ (UIViewController<CPTOptionsViewProtocol> *)build
{
	id<CPTOptionsPresenterProtocol> presenter = [CPTOptionsPresenter new];
	UIViewController<CPTOptionsViewProtocol> *view = [[CPTOptionsViewController alloc] initWithPresenter:presenter];
	presenter.view = view;
	
	return view;
}

@end
