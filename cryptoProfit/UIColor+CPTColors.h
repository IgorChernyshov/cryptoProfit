//
//  UIColor+CPTColors.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 01/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


@interface UIColor (CPTColors)

+ (UIColor *)navigationControllerBackgroundColor;
+ (UIColor *)navigationControllerTintColor;

+ (UIColor *)walletTableViewBackgroundColor;
+ (UIColor *)walletTableViewSeparatorColor;

+ (UIColor *)addCurrencyBackgroundColor;
+ (UIColor *)addCurrencyTextColor;
+ (UIColor *)addCurrencyPlaceholderColor;

@end

NS_ASSUME_NONNULL_END
