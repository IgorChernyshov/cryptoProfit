//
//  CPTOptionsFactory.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 12/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@class UIViewController;
@protocol CPTOptionsViewProtocol;


NS_ASSUME_NONNULL_BEGIN


/**
 Собирает модуль CPTOptionsViewController.
 */
@interface CPTOptionsFactory : NSObject

+ (UIViewController<CPTOptionsViewProtocol> *)build; /**< Метод класса для сборки модуля */

@end

NS_ASSUME_NONNULL_END
