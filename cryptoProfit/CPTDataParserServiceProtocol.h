//
//  CPTDataParserServiceProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 19/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import Foundation;
@protocol CPTAddCurrencyPresenterProtocol;


NS_ASSUME_NONNULL_BEGIN


/**
 Протокол сервиса парсинга данных.
 Описывает обязательные методы, которые должен имплементировать сервис парсинга данных.
 */
@protocol CPTDataParserServiceProtocol <NSObject>

/**
 Генерирует список криптовалют из ответа сервера.

 @param dictionary Словарь с ответом от сервера.
 @param output Ссылка на делегат, который запросил данные.
 */
- (void)createCoinsListFromDictionary:(NSDictionary *)dictionary
						   withOutput:(id<CPTAddCurrencyPresenterProtocol>)output;

@end

NS_ASSUME_NONNULL_END
