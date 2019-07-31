//
//  CPTAddCurrencyFactory.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 17/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@class UIViewController;
@protocol CPTAddCurrencyViewProtocol;


NS_ASSUME_NONNULL_BEGIN


/**
 Собирает модуль CPTAddCurrencyViewController.
 */
@interface CPTAddCurrencyFactory : NSObject

+ (UIViewController<CPTAddCurrencyViewProtocol> *)build; /**< Метод класса для сборки модуля */

@end

NS_ASSUME_NONNULL_END
