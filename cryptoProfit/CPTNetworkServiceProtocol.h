//
//  CPTNetworkServiceProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 18/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import Foundation;


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


/**
 Делегат сетевого сервиса.
 Получает результаты сетевого запроса от сервиса.
 */
@protocol CPTNetworkServiceOutputProtocol <NSObject>

@end

NS_ASSUME_NONNULL_END
