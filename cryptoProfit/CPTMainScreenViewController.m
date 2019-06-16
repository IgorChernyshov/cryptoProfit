//
//  CPTMainScreenViewController.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 23/05/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTMainScreenViewController.h"
#import "UIColor+CPTColors.h"

@interface CPTMainScreenViewController ()

@property (nonatomic, strong) id<CPTMainScreenPresenterProtocol> presenter;

@end

@implementation CPTMainScreenViewController

- (instancetype)initWithPresenter:(id<CPTMainScreenPresenterProtocol>)presenter
{
	self = [super init];
	if (self) {
		_presenter = presenter;
		self.view.backgroundColor = [UIColor cpt_lightGray];
		self.title = @"CRYPTO PROFIT";
	}
	return self;
}

@end
