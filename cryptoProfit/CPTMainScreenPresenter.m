//
//  CPTMainScreenPresenter.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 16/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTMainScreenPresenter.h"
#import "CPTMainScreenViewController.h"
#import "CPTAddCurrencyFactory.h"


@implementation CPTMainScreenPresenter

@synthesize view;

- (void)addCurrencyButtonWasPressed {
	[self.view.navigationController pushViewController:[CPTAddCurrencyFactory build] animated:YES];
}

- (void)optionsButtonWasPressed {
	// TODO
}

@end
