//
//  CPTAPIFactory.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 18/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTAPIFactoryProtocol.h"


NS_ASSUME_NONNULL_BEGIN


/**
 Фабрика API-запросов.
 Эти запросы используются сетевым сервисом для получения данных от сервера.
 */
@interface CPTAPIFactory : NSObject <CPTAPIFactoryProtocol>

@end

NS_ASSUME_NONNULL_END
