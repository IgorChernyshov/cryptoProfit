//
//  CPTDataParserServiceProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 19/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import Foundation;


NS_ASSUME_NONNULL_BEGIN


/**
 Протокол сервиса парсинга данных.
 Описывает обязательные методы, которые должен имплементировать сервис парсинга данных.
 */
@protocol CPTDataParserServiceProtocol <NSObject>

/**
 Генерирует список криптовалют из ответа сервера.

 @param dictionary Словарь с ответом от сервера.
 */
- (void)createCoinsListFromDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
