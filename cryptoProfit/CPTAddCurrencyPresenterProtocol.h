//
//  CPTAddCurrencyPresenterProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 17/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit;
@class UIViewController;
@protocol CPTAddCurrencyViewProtocol;
@protocol CPTNetworkServiceOutputProtocol;


NS_ASSUME_NONNULL_BEGIN


/**
 Протокол презентера экрана добавления валюты. Содержит описание методов, которые должен имплементировать презентер.
 */
@protocol CPTAddCurrencyPresenterProtocol <NSObject>

@property (nonatomic, weak) UIViewController<CPTAddCurrencyViewProtocol> *view; /**< View экрана добавления валюты, которой управляет презентер. */

/**
 Оповещение, что у View была нажата кнопка "Назад".
 */
- (void)backButtonWasPressed;

/**
 Оповещение, что у View была нажата кнопка "Сохранить". Также содержит данные, которые необходимо сохранить.

 @param name Название криптовалюты для сохранения.
 @param quantity Количество криптовалюты для сохранения.
 */
- (void)saveButtonWasPressedWithCoinName:(NSString *)name quantity:(NSNumber *)quantity;

/**
 Оповещение, что список валют, полученных от сервера был распаршен и готов к отображению в поиске.
 Также содержит сам список в виде массива словарей.

 @param names Список криптовалют для отображения в поиске.
 */
- (void)parsedCoinsListWithNames:(NSArray<NSString *> *)names;

/**
 Оповещение о том, что пользователь начал искать валюту. Содержит текст, введённый пользователем и список валют.

 @param name Текст введённый пользователем в строку поиска по имени.
 @param names Массив названий валют в котором вести поиск.
 */
- (void)userIsSearchingForCoinName:(NSString *)name inArrayOfNames:(NSArray<NSString *> *)names;

/**
 Оповещение о том, что View появилась на экране и необходимо подготовить данные для поиска.
 */
- (void)viewAppearedOnScreen;

@end

NS_ASSUME_NONNULL_END
