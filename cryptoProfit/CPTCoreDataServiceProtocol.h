//
//  CPTCoreDataServiceProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 19/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit;
@class Coin;
@protocol CPTMainScreenPresenterProtocol;
@protocol CPTAddCurrencyPresenterProtocol;
@protocol CPTCoreDataServiceOutputProtocol;


NS_ASSUME_NONNULL_BEGIN


/**
 Протокол сервиса по работе с CoreData.
 Описывает обязательные методы, которые должен имплементировать сервис работы с CoreData.
 */
@protocol CPTCoreDataServiceProtocol <NSObject>

/**
 Сохраняет список криптовалют в CoreData.

 @param coinsList Словарь криптовалют. Содержит название и сокращённое название каждой валюты.
 */
- (void)saveCoinsList:(NSArray<NSDictionary *> *)coinsList;

/**
 Загружает список всех криптовалют и передаёт их делегату.
 Делегат получает массив объектов Coin.

 @param output Делегат, который получит загруженные данные.
 */
- (void)loadCoinsListWithOutput:(nonnull id<CPTCoreDataServiceOutputProtocol>)output;

/**
 Сохраняет криптовалюту, которую добавил пользователь, в CoreData.

 @param name Название криптовалюты.
 @param quantity Количество криптовалюты.
 @param output Делегат, который получит уведомление, когда валюта будет сохранена.
 */
- (void)saveUsersCoinWithName:(NSString *)name
					 quantity:(NSNumber *)quantity
					   output:(nonnull id<CPTCoreDataServiceOutputProtocol>)output;

/**
 Загружает список криптовалют, добавленных пользователем.
 Делегат получает массив объектов Coin.

 @param output Делегат, который получит загруженные данные.
 */
- (void)getUsersCoinsListWithOutput:(nonnull id<CPTCoreDataServiceOutputProtocol>)output;

@end


/**
 Протокол делегата сервиса CoreData. Все методы опциональные.
 */
@protocol CPTCoreDataServiceOutputProtocol <NSObject>

@optional

/**
 Оповещение, что список имён криптовалют был сохранён в CoreData.
 */
- (void)coinsListWasSaved;

/**
 Передаёт список имён криптовалют, заруженных из CoreData.

 @param coinsList Список криптовалют.
 */
- (void)loadedCoinsList:(NSArray<Coin *> *)coinsList;

/**
 Оповещение, что криптовалюта, введённая пользователем, была успешно сохранена.
 */
- (void)usersCoinSavedSuccessfully;

/**
 Передаёт список и количество криптовалют, сохранённых пользователем.

 @param coinsList Список криптовалют пользователя.
 */
- (void)successfullyLoadedUsersCoinsList:(NSArray<Coin *> *)coinsList;

@end

NS_ASSUME_NONNULL_END
