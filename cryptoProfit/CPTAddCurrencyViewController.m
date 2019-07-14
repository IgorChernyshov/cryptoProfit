//
//  CPTAddCurrencyViewController.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 17/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTAddCurrencyViewController.h"
#import "CPTTextField.h"
#import "UIColor+CPTColors.h"

@interface CPTAddCurrencyViewController ()

@property (nonatomic, strong) id<CPTAddCurrencyPresenterProtocol> presenter;
@property (nonatomic, strong) CPTTextField *currencyNameTextField;
@property (nonatomic, strong) CPTTextField *currencyQuantityTextField;

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
}


#pragma mark - Конфигурация UI

- (void)configureUI
{
	self.view.backgroundColor = [UIColor addCurrencyBackgroundColor];
	
	[self configureNavigationBar];
	[self addCurrencyNameTextField];
	[self addCurrencyQuantityTextField];
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
	
	[self.view addSubview:self.currencyNameTextField];
}

- (void)addCurrencyQuantityTextField
{
	self.currencyQuantityTextField = [CPTTextField new];
	[self.currencyQuantityTextField configureAttributedPlaceholderWithText:@"Количество"];
	
	[self.view addSubview:self.currencyQuantityTextField];
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

@end
