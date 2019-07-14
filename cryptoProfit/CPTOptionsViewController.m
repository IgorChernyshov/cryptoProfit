//
//  CPTOptionsViewController.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 12/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTOptionsViewController.h"
#import "CPTOptionsPresenterProtocol.h"
#import "CPTLabel.h"
#import "UIColor+CPTColors.h"

@interface CPTOptionsViewController ()

@property (nonatomic, strong) id<CPTOptionsPresenterProtocol> presenter;

@property (nonatomic, strong) UIStackView *currencyStackView;
@property (nonatomic, strong) CPTLabel *currencyLabel;
@property (nonatomic, strong) UIButton *currencyButton;
@property (nonatomic, strong) UIStackView *timePeriodStackView;
@property (nonatomic, strong) CPTLabel *timePeriodLabel;
@property (nonatomic, strong) UIButton *timePeriodButton;

@property (nonatomic, strong) UIStackView *controlsStackView;

@end

@implementation CPTOptionsViewController


#pragma mark - Инициализатор

- (instancetype)initWithPresenter:(id<CPTOptionsPresenterProtocol>)presenter
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
	self.view.backgroundColor = [UIColor optionsBackgroundColor];
	
	[self configureNavigationBar];
	[self configureControlsStack];
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
																  action:@selector(doneButtonWasPressed)];
	self.navigationItem.leftBarButtonItem = backButton;
	self.navigationItem.rightBarButtonItem = doneButton;
	self.title = @"Настройки";
}

- (void)configureControlsStack
{
	[self configureCurrencyStack];
	[self configureTimePeriodStack];
	
	self.controlsStackView = [[UIStackView alloc] initWithArrangedSubviews:@[
																			 self.currencyStackView,
																			 self.timePeriodStackView
																			 ]];
	self.controlsStackView.translatesAutoresizingMaskIntoConstraints = NO;
	self.controlsStackView.axis = UILayoutConstraintAxisVertical;
	self.controlsStackView.distribution = UIStackViewDistributionFillEqually;
	self.controlsStackView.spacing = 8.f;
	
	[self.view addSubview:self.controlsStackView];
}

- (void)configureCurrencyStack
{
	self.currencyLabel = [[CPTLabel alloc] initWithText:@"Валюта"];
	
	self.currencyButton = [UIButton buttonWithType:UIButtonTypeSystem];
	[self.currencyButton setAttributedTitle:[self attributedButtonTitleWithString:@"₽"] forState:UIControlStateNormal];
	[self.currencyButton addTarget:self action:@selector(didTapCurrencyButton) forControlEvents:UIControlEventTouchUpInside];
	
	self.currencyStackView = [self stackViewWithLabel:self.currencyLabel button:self.currencyButton];
}

- (void)configureTimePeriodStack
{
	self.timePeriodLabel = [[CPTLabel alloc] initWithText:@"Изменения за"];
	
	self.timePeriodButton = [UIButton buttonWithType:UIButtonTypeSystem];
	[self.timePeriodButton setAttributedTitle:[self attributedButtonTitleWithString:@"24 часа"] forState:UIControlStateNormal];
	[self.timePeriodButton addTarget:self action:@selector(didTapTimePeriodButton) forControlEvents:UIControlEventTouchUpInside];
	
	self.timePeriodStackView = [self stackViewWithLabel:self.timePeriodLabel button:self.timePeriodButton];
}

- (void)createConstraints
{
	[self.view addConstraints:@[
								[self.controlsStackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
								[self.controlsStackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
								]];
}


#pragma mark - Методы кнопок Navigation Bar

- (void)backButtonWasPressed
{
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)doneButtonWasPressed
{
	// TODO: Сохранение настроек в NSUserDefaults
	[self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Методы кнопок настройки

- (void)didTapCurrencyButton
{
	
}

- (void)didTapTimePeriodButton
{
	
}


#pragma mark - Хелперы

- (NSAttributedString *)attributedButtonTitleWithString:(NSString *)string
{
	NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
	[attributes setObject:[UIFont fontWithName:@"Helvetica" size:16.0] forKey:NSFontAttributeName];
	[attributes setObject:@(NSUnderlineStyleSingle) forKey:NSUnderlineStyleAttributeName];
	[attributes setObject:[UIColor defaultTextColor] forKey:NSForegroundColorAttributeName];
	NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:string attributes:attributes];
	return attributedTitle;
}

- (UIStackView *)stackViewWithLabel:(UILabel *)label button:(UIButton *)button
{
	UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[label, button]];
	stackView.axis = UILayoutConstraintAxisHorizontal;
	stackView.distribution = UIStackViewDistributionFillEqually;
	stackView.spacing = 8.f;
	
	return stackView;
}

@end
