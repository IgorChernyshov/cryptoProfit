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
#import "CPTCoinNameCell.h"
#import "CPTLabel.h"
#import "CPTTextField.h"
#import "CPTLoadingView.h"
#import "UIColor+CPTColors.h"


@interface CPTAddCurrencyViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) id<CPTAddCurrencyPresenterProtocol> presenter;

@property (nonatomic, strong) CPTTextField *currencyNameTextField;
@property (nonatomic, strong) CPTTextField *currencyQuantityTextField;
@property (nonatomic, strong) CPTLoadingView *spinner;

@property (nonatomic, strong) UITableView *coinsSearchTableView;
@property (nonatomic, strong) NSArray<NSString *> *coinsNames;

@end


@implementation CPTAddCurrencyViewController


#pragma mark - Инициализатор

- (instancetype)initWithPresenter:(id<CPTAddCurrencyPresenterProtocol>)presenter
{
	self = [super init];
	if (self)
	{
		_presenter = presenter;
		_coinsNames = [NSArray new];
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
	[self addCoinSearchTableView];
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
	[self.currencyNameTextField addTarget:self action:@selector(textFieldDidChangeText) forControlEvents:UIControlEventEditingChanged];
	[self.currencyNameTextField addTarget:self action:@selector(textFieldDidChangeText) forControlEvents:UIControlEventEditingDidBegin];
	
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

- (void)addCoinSearchTableView
{
	self.coinsSearchTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
	[self.coinsSearchTableView registerClass:[CPTCoinNameCell class] forCellReuseIdentifier:@"coinNameCellReuseID"];
	self.coinsSearchTableView.tableFooterView = [UIView new];
	self.coinsSearchTableView.translatesAutoresizingMaskIntoConstraints = NO;
	self.coinsSearchTableView.backgroundColor = [UIColor walletTableViewBackgroundColor];
	self.coinsSearchTableView.separatorColor = [UIColor walletTableViewSeparatorColor];
	self.coinsSearchTableView.dataSource = self;
	self.coinsSearchTableView.delegate = self;
	self.coinsSearchTableView.hidden = YES;

	[self.view addSubview:self.coinsSearchTableView];
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
								[self.spinner.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],

								[self.coinsSearchTableView.topAnchor constraintEqualToAnchor:self.currencyNameTextField.bottomAnchor],
								[self.coinsSearchTableView.leftAnchor constraintEqualToAnchor:self.currencyNameTextField.leftAnchor],
								[self.coinsSearchTableView.rightAnchor constraintEqualToAnchor:self.currencyNameTextField.rightAnchor],
								[self.coinsSearchTableView.heightAnchor constraintEqualToConstant:CGRectGetHeight(self.view.frame) * 0.5]
								]];
}


#pragma mark - TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.coinsNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	CPTCoinNameCell *cell = [CPTCoinNameCell new];
	cell.coinName.text = self.coinsNames[indexPath.row];
	return cell;
}


#pragma mark - TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	self.currencyNameTextField.text = self.coinsNames[indexPath.row];
	[self hideCoinsList];
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


#pragma mark - Обработчик событий TextField

- (void)textFieldDidChangeText
{
	[self.presenter userChangedCoinNameToName:self.currencyNameTextField.text];
}


#pragma mark - CPTAddCurrencyViewProtocol

- (void)loadingStarted
{
	[self.spinner show];
	self.currencyNameTextField.enabled = NO;
	self.currencyQuantityTextField.enabled = NO;
	self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (void)loadingFinished
{
	[self.spinner hide];
	self.currencyNameTextField.enabled = YES;
	self.currencyQuantityTextField.enabled = YES;
	self.navigationItem.rightBarButtonItem.enabled = YES;
}

- (void)showCoinsListWithCoinsNames:(NSArray<NSString *> *)coins
{
	self.coinsNames = coins;
	[self.coinsSearchTableView reloadData];
	self.coinsSearchTableView.hidden = NO;
}

- (void)hideCoinsList
{
	self.coinsSearchTableView.hidden = YES;
}

@end
