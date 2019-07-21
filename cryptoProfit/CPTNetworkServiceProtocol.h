//
//  CPTNetworkServiceProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 18/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import Foundation;
@protocol CPTAddCurrencyPresenterProtocol;


/**
 Список типов сетевых запросов. Используется для определения соответствующего метода парсинга ответов от сервера.

 - CPTNetworkRequestTypeCurrencyList: Запрос списка всех криптовалют.
 */
typedef NS_ENUM(NSUInteger, CPTNetworkRequestType)
{
	CPTNetworkRequestTypeCurrencyList = 0
};



NS_ASSUME_NONNULL_BEGIN


/**
 Протокол сетевого сервиса.
 Описывает обязательные методы, которые должен имплементировать сетевой сервис.
 */
@protocol CPTNetworkServiceInputProtocol <NSObject>

/**
 Запрашивает список всех криптовалют.
 */
- (void)requestCurrencyList;

@end

NS_ASSUME_NONNULL_END
