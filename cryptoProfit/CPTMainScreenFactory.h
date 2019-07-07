//
//  CPTMainScreenFactory.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 16/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPTMainScreenViewController.h"


NS_ASSUME_NONNULL_BEGIN


/**
 Собирает модуль CPTMainScreenViewController.
 */
@interface CPTMainScreenFactory : NSObject

+ (UIViewController<CPTMainScreenViewProtocol> *)build;	/**< Метод класса для сборки модуля */

@end

NS_ASSUME_NONNULL_END
