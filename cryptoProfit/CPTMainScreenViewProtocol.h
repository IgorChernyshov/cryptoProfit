//
//  CPTMainScreenViewProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 16/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import Foundation;
@class CPTCoinViewModel;


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

 @param coins Массив с вью-моделями пользовательских криптовалют.
 */
- (void)showCoinsListWithCoinsNames:(NSArray<CPTCoinViewModel *> *)coins;

/**
 Обновляет цену единицы криптовалюты.

 @param shortName Идентификатор криптовалюты.
 @param price Цена единицы криптовалюты.
 */
- (void)updateCoinWithShortName:(NSString *)shortName setPrice:(NSNumber *)price;

@end

NS_ASSUME_NONNULL_END
