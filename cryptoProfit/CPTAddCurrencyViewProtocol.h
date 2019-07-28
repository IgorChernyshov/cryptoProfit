//
//  CPTAddCurrencyViewProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 17/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import Foundation;
@class CPTTextField;


NS_ASSUME_NONNULL_BEGIN


/**
 Протокол View экрана добавления криптовалюты. Описывает методы, которые должна имплементировать View.
 */
@protocol CPTAddCurrencyViewProtocol <NSObject>

/**
 Оповещение, что загрузка данных началась.
 */
- (void)loadingStarted;

/**
 Оповещение, что загрузка списка всех криптовалют завершилась.

 @param coins Результат загрузки списка всех криптовалют.
 */
- (void)loadingFinishedWithCoinsNames:(NSArray<NSString *> *)coins;

/**
 Оповещение, что загрузка отфильтрованного списка криптовалют завершилась.

 @param coins Отфильтрованный список криптовалют.
 */
- (void)showFilteredCoinsListWithCoinsNames:(NSArray<NSString *> *)coins;

/**
 Оповещение, что необходимо спрятать список для поиска криптовалют.
 */
- (void)hideCoinsList;

@end

NS_ASSUME_NONNULL_END
