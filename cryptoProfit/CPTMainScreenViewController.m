//
//  CPTMainScreenViewController.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 23/05/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit;
#import "CPTMainScreenViewController.h"
#import "CPTWalletCell.h"
#import "UIColor+CPTColors.h"

static NSString * const CPTMainScreenCellIdentifier = @"WalletCellIdentifier";


@interface CPTMainScreenViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) id<CPTMainScreenPresenterProtocol> presenter;
@property (nonatomic, strong) UITableView *tableView;

@end


@implementation CPTMainScreenViewController


#pragma mark - Инициализатор

- (instancetype)initWithPresenter:(id<CPTMainScreenPresenterProtocol>)presenter
{
	self = [super init];
	if (self)
	{
		_presenter = presenter;
	}
	return self;
}


#pragma mark - Жизненный цикл View Controller'а

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	[self configureUI];
}


#pragma mark - Конфигурация UI

- (void)configureUI
{
	self.view.backgroundColor = [UIColor walletTableViewBackgroundColor];

	[self addTableView];
	[self configureNavigationController];
	[self createConstraints];
}

- (void)addTableView
{
	self.tableView = [UITableView new];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
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
								[self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
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


#pragma mark - UITableViewDataSource Protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return [CPTWalletCell new];
}

@end
