//
//  CPTCoreDataServiceProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 19/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import Foundation;


NS_ASSUME_NONNULL_BEGIN


/**
 Протокол сервиса по работе с CoreData.
 Описывает обязательные методы, которые должен имплементировать сервис работы с CoreData.
 */
@protocol CPTCoreDataServiceProtocol <NSObject>

/**
 Сохраняет список криптовалют в базу данных.

 @param coinsList Список криптовалют
 */
- (void)saveToDatabaseCoinsList:(NSArray<NSDictionary *> *)coinsList;

@end

NS_ASSUME_NONNULL_END
