//
//  CPTMainScreenViewController.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 23/05/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit;
#import "CPTMainScreenViewController.h"
#import "CPTMainScreenPresenterProtocol.h"
#import "CPTWalletCell.h"
#import "CPTCoinViewModel.h"
#import "CPTLabel.h"
#import "UIColor+CPTColors.h"


static NSString * const CPTMainScreenCellIdentifier = @"WalletCellIdentifier";


@interface CPTMainScreenViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) id<CPTMainScreenPresenterProtocol> presenter;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray<CPTCoinViewModel *> *coins;
@property (nonatomic, strong) UIView *tableHeaderView;

@end


@implementation CPTMainScreenViewController


#pragma mark - Инициализатор

- (instancetype)initWithPresenter:(id<CPTMainScreenPresenterProtocol>)presenter
{
	self = [super init];
	if (self)
	{
		_presenter = presenter;
		_coins = [NSArray new];
	}
	return self;
}


#pragma mark - Жизненный цикл View Controller'а

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	[self configureUI];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self.presenter viewWillAppearOnScreen];
}


#pragma mark - Конфигурация UI

- (void)configureUI
{
	self.view.backgroundColor = [UIColor walletTableViewBackgroundColor];

	[self addTableHeaderView];
	[self addTableView];
	[self configureNavigationController];
	[self createConstraints];
}

- (void)addTableHeaderView
{
	self.tableHeaderView = [UIView new];
	self.tableHeaderView.translatesAutoresizingMaskIntoConstraints = NO;
	self.tableHeaderView.backgroundColor = [UIColor walletTableViewBackgroundColor];
	
	CPTLabel *walletNameLabel = [[CPTLabel alloc] initWithText:@"Валюта"];
	walletNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
	
	CPTLabel *walletTotalLabel = [[CPTLabel alloc] initWithText:@"Кол-во"];
	walletTotalLabel.translatesAutoresizingMaskIntoConstraints = NO;
	
	CPTLabel *walletChangeLabel = [[CPTLabel alloc] initWithText:@"Сумма"];
	walletChangeLabel.translatesAutoresizingMaskIntoConstraints = NO;
	
	[self.tableHeaderView addSubview:walletNameLabel];
	[self.tableHeaderView addSubview:walletTotalLabel];
	[self.tableHeaderView addSubview:walletChangeLabel];
	[self.view addSubview:self.tableHeaderView];
	
	[self.view addConstraints:@[
								[self.tableHeaderView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
								[self.tableHeaderView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor],
								[self.tableHeaderView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor],
								[self.tableHeaderView.heightAnchor constraintEqualToConstant:40.f],
								
								[walletNameLabel.leftAnchor constraintEqualToAnchor:self.tableHeaderView.leftAnchor constant:16.f],
								[walletNameLabel.centerYAnchor constraintEqualToAnchor:self.tableHeaderView.centerYAnchor],
								[walletNameLabel.rightAnchor constraintEqualToAnchor:self.tableHeaderView.centerXAnchor],
								
								[walletTotalLabel.leftAnchor constraintEqualToAnchor:self.tableHeaderView.centerXAnchor constant:16.f],
								[walletTotalLabel.centerYAnchor constraintEqualToAnchor:self.tableHeaderView.centerYAnchor],
								[walletTotalLabel.rightAnchor constraintEqualToAnchor:walletChangeLabel.leftAnchor constant:-16.f],
								
								[walletChangeLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-16.f],
								[walletChangeLabel.centerYAnchor constraintEqualToAnchor:self.tableHeaderView.centerYAnchor]
								]];
}

- (void)addTableView
{
	self.tableView = [UITableView new];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.tableView.estimatedRowHeight = 100.f;
	[self.tableView registerClass:[CPTWalletCell class] forCellReuseIdentifier:CPTMainScreenCellIdentifier];
	
	self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
	self.tableView.allowsSelection = NO;
	self.tableView.separatorColor = [UIColor walletTableViewSeparatorColor];
	self.tableView.backgroundColor = [UIColor walletTableViewBackgroundColor];
	
	[self.view addSubview:self.tableView];
}

- (void)configureNavigationController
{
	UIBarButtonItem *optionsButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"optionsIcon"]
																	  style:UIBarButtonItemStylePlain
																	 target:self
																	 action:@selector(optionsButtonWasPressed)];
	UIBarButtonItem *addCurrencyButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"addCurrencyIcon"]
																		  style:UIBarButtonItemStylePlain
																		 target:self
																		 action:@selector(addCurrencyButtonWasPressed)];
	self.navigationItem.leftBarButtonItem = optionsButton;
	self.navigationItem.rightBarButtonItem = addCurrencyButton;
	self.title = @"CRYPTO PROFIT";
}

- (void)createConstraints
{
	[self.view addConstraints:@[
								[self.tableView.topAnchor constraintEqualToAnchor:self.tableHeaderView.bottomAnchor],
								[self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
								[self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
								[self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
								]];
}


#pragma mark - Методы кнопок Navigation Bar

- (void)optionsButtonWasPressed
{
	[self.presenter optionsButtonWasPressed];
}

- (void)addCurrencyButtonWasPressed
{
	[self.presenter addCurrencyButtonWasPressed];
}


#pragma mark - CPTMainScreenViewProtocol

- (void)showCoinsListWithCoinsNames:(NSArray<CPTCoinViewModel *> *)coins
{
	self.coins = coins;
	[self.tableView reloadData];
	self.tableView.hidden = NO;
}

- (void)updateCoinWithShortName:(NSString *)shortName setPrice:(NSNumber *)price
{
	for (CPTCoinViewModel *coin in self.coins)
	{
		if (![coin.shortName isEqualToString:shortName])
		{
			continue;
		}
		NSNumber *value = [NSNumber numberWithFloat:(coin.quantity.floatValue * price.floatValue)];
		coin.value = value;
		[self.tableView reloadData];
		return;
	}
}

- (void)loadingStarted
{

}

- (void)loadingFinished
{

}


#pragma mark - UITableViewDataSource Protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.coins.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	CPTWalletCell *cell = [CPTWalletCell new];
	cell.nameLabel.text = self.coins[indexPath.row].name;
	cell.quantityLabel.text = [NSString stringWithFormat:@"%@", self.coins[indexPath.row].quantity];
	NSString *coinValue = [NSString stringWithFormat:@"%@ ₽", self.coins[indexPath.row].value];
	cell.valueLabel.text = [coinValue isEqualToString:@"0 ₽"] ? @"Нет данных" : coinValue;
	return cell;
}

@end
