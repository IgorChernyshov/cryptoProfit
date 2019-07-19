//
//  CPTAPIFactoryProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 18/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import Foundation;


NS_ASSUME_NONNULL_BEGIN


/**
 Протокол фабрики API.
 Описывает обязательные методы которые должна имлементировать API-фабрика.
 */
@protocol CPTAPIFactoryProtocol <NSObject>

/**
 Создаёт URL API-запроса на получение списка всех валют.

 @return URL запроса.
 */
+ (NSURL *)getCurrencyListURL;

@end

NS_ASSUME_NONNULL_END
