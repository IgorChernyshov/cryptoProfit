//
//  UIColor+CPTColors.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 01/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@class UIColor;


NS_ASSUME_NONNULL_BEGIN


@interface UIColor (CPTColors)

// Общие цвета приложения
+ (UIColor *)defaultTextColor;

// Цвета Navigation Controller'а
+ (UIColor *)navigationControllerBackgroundColor;
+ (UIColor *)navigationControllerTintColor;

// Цвета главного экрана приложения
+ (UIColor *)walletTableViewBackgroundColor;
+ (UIColor *)walletTableViewSeparatorColor;

// Цвета экрана добавления валюты
+ (UIColor *)addCurrencyBackgroundColor;
+ (UIColor *)addCurrencyPlaceholderColor;

// Цвета экрана настроек
+ (UIColor *)optionsBackgroundColor;

@end

NS_ASSUME_NONNULL_END
