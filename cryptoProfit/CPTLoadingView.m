//
//  CPTLoadingView.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 21/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTLoadingView.h"
#import "UIColor+CPTColors.h"


@interface CPTLoadingView ()

@property (nonatomic, strong) UIView *roundedBackgroundView;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;

@end


@implementation CPTLoadingView


#pragma mark - Инициализатор

- (instancetype)init
{
	self = [super init];
	if (self) {
		self.translatesAutoresizingMaskIntoConstraints = NO;
		[self createBackgroundView];
		[self createSpinner];
		[self createConstraints];
		[self hide];
	}
	return self;
}


#pragma mark - Создание UI

- (void)createBackgroundView
{
	UIView *view = [UIView new];
	view.translatesAutoresizingMaskIntoConstraints = NO;
	view.backgroundColor = [UIColor spinnerViewBackgroundColor];
	view.layer.masksToBounds = YES;
	view.layer.cornerRadius = 5.0;
	_roundedBackgroundView = view;

	[self addSubview:_roundedBackgroundView];
}

- (void)createSpinner
{
	UIActivityIndicatorView *spinner;
	spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	spinner.translatesAutoresizingMaskIntoConstraints = NO;
	spinner.color = [UIColor spinnerColor];
	_spinner = spinner;

	[self addSubview:_spinner];
}

- (void)createConstraints
{
	[self addConstraints:@[
						   [self.heightAnchor constraintEqualToConstant:70.f],
						   [self.widthAnchor constraintEqualToConstant:70.f],

						   [_roundedBackgroundView.topAnchor constraintEqualToAnchor:self.topAnchor],
						   [_roundedBackgroundView.leftAnchor constraintEqualToAnchor:self.leftAnchor],
						   [_roundedBackgroundView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
						   [_roundedBackgroundView.rightAnchor constraintEqualToAnchor:self.rightAnchor],

						   [_spinner.centerXAnchor constraintEqualToAnchor:_roundedBackgroundView.centerXAnchor],
						   [_spinner.centerYAnchor constraintEqualToAnchor:_roundedBackgroundView.centerYAnchor]
						   ]];
}

- (void)show
{
	_roundedBackgroundView.hidden = NO;
	[_spinner startAnimating];
}

- (void)hide
{
	_roundedBackgroundView.hidden = YES;
	[_spinner stopAnimating];
}

@end
