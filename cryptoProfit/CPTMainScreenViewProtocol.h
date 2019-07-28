//
//  CPTMainScreenViewProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 16/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import Foundation;


NS_ASSUME_NONNULL_BEGIN


/**
 Протокол View экрана отображения пользовательских криптовалют. Описывает методы, которые должна имплементировать View.
 */
@protocol CPTMainScreenViewProtocol <NSObject>

/**
 Оповещение о том, что загрузка пользовательских криптовалют началась.
 */
- (void)loadingStarted;

/**
 Оповещение о том, что загрузка пользовательских криптовалют завершилась.
 */
- (void)loadingFinished;

/**
 Оповещение о том, что необходимо показать на экране список пользовательских криптовалют.

 @param coins Массив с именами пользовательских криптовалют.
 @param quantity Массив с количеством пользовательских криптовалют.
 */
- (void)showCoinsListWithCoinsNames:(NSArray<NSString *> *)coins quantity:(NSArray<NSNumber *> *)quantity;

@end

NS_ASSUME_NONNULL_END
