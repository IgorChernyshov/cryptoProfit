//
//  CPTAddCurrencyViewController.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 17/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit;
#import "CPTAddCurrencyViewController.h"
#import "CPTAddCurrencyPresenterProtocol.h"
#import "CPTTextField.h"
#import "CPTLoadingView.h"
#import "UIColor+CPTColors.h"


@interface CPTAddCurrencyViewController () <UITextFieldDelegate>

@property (nonatomic, strong) id<CPTAddCurrencyPresenterProtocol> presenter;
@property (nonatomic, strong) CPTTextField *currencyNameTextField;
@property (nonatomic, strong) CPTTextField *currencyQuantityTextField;
@property (nonatomic, strong) CPTLoadingView *spinner;

@end


@implementation CPTAddCurrencyViewController


#pragma mark - Инициализатор

- (instancetype)initWithPresenter:(id<CPTAddCurrencyPresenterProtocol>)presenter
{
	self = [super init];
	if (self)
	{
		_presenter = presenter;
	}
	return self;
}


#pragma mark -  Жизненный цикл View Controller'а

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	[self configureUI];
	[self.presenter viewAppearedOnScreen];
}


#pragma mark - Конфигурация UI

- (void)configureUI
{
	self.view.backgroundColor = [UIColor addCurrencyBackgroundColor];
	
	[self configureNavigationBar];
	[self addCurrencyNameTextField];
	[self addCurrencyQuantityTextField];
	[self addLoadingView];
	[self createConstraints];
}

- (void)configureNavigationBar
{
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backIcon"]
																	  style:UIBarButtonItemStylePlain
																	 target:self
																	 action:@selector(backButtonWasPressed)];
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"doneIcon"]
																		  style:UIBarButtonItemStylePlain
																		 target:self
																		 action:@selector(saveButtonWasPressed)];
	self.navigationItem.leftBarButtonItem = backButton;
	self.navigationItem.rightBarButtonItem = doneButton;
	self.title = @"Добавьте валюту";
}

- (void)addCurrencyNameTextField
{
	self.currencyNameTextField = [CPTTextField new];
	[self.currencyNameTextField configureAttributedPlaceholderWithText:@"Название валюты"];
	self.currencyNameTextField.delegate = self;
	
	[self.view addSubview:self.currencyNameTextField];
}

- (void)addCurrencyQuantityTextField
{
	self.currencyQuantityTextField = [CPTTextField new];
	[self.currencyQuantityTextField configureAttributedPlaceholderWithText:@"Количество"];
	
	[self.view addSubview:self.currencyQuantityTextField];
}

- (void)addLoadingView
{
	self.spinner = [CPTLoadingView new];

	[self.view addSubview:self.spinner];
}

- (void)createConstraints
{
	[self.view addConstraints:@[
								[self.currencyNameTextField.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:16.f],
								[self.currencyNameTextField.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:16.f],
								[self.currencyNameTextField.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-16.f],
								
								[self.currencyQuantityTextField.topAnchor constraintEqualToAnchor:self.currencyNameTextField.bottomAnchor constant:8.f],
								[self.currencyQuantityTextField.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:16.f],
								[self.currencyQuantityTextField.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-16.f],

								[self.spinner.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
								[self.spinner.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
								]];
}


#pragma mark - Методы кнопок Navigation Bar

- (void)backButtonWasPressed
{
	[self.presenter backButtonWasPressed];
}

- (void)saveButtonWasPressed
{
	// TODO: Save currency information into Core Data
	[self.presenter saveButtonWasPressed];
}


#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	[self.presenter textFieldDidBeginEditing];
}


#pragma mark - CPTAddCurrencyViewProtocol

- (void)loadingStarted
{
	[self.spinner show];
	self.currencyNameTextField.enabled = NO;
	self.currencyQuantityTextField.enabled = NO;
}

- (void)loadingFinished
{
	[self.spinner hide];
	self.currencyNameTextField.enabled = YES;
	self.currencyQuantityTextField.enabled = YES;
}

@end
