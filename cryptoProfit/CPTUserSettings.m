//
//  CPTUserSettings.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 21/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTUserSettings.h"


static NSString * const CPTCoinsListWasUpdatedAfterLaunch = @"cptCoinsListWasUpdatedAfterLaunch";


@implementation CPTUserSettings


#pragma mark - Сохранение данных пользователя

+ (void)coinsListHasBeenUpdated
{
	[[self userDefaults] setBool:YES forKey:CPTCoinsListWasUpdatedAfterLaunch];
}


#pragma mark - Загрузка данных пользователя

+ (BOOL)coinsListWasUpdatedAfterLaunch
{
	return [[self userDefaults] boolForKey:CPTCoinsListWasUpdatedAfterLaunch];
}


#pragma mark - Геттеры

+ (NSUserDefaults *)userDefaults
{
	return [NSUserDefaults standardUserDefaults];
}

@end
