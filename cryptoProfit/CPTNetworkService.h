//
//  CPTNetworkService.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 18/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTNetworkServiceProtocol.h"


NS_ASSUME_NONNULL_BEGIN


/**
 Сервис сетевых запросов. Отправляет API-запросы к серверу и отправляет результат запроса на обработку другим сервисам.
 */
@interface CPTNetworkService : NSObject <CPTNetworkServiceInputProtocol>

@end

NS_ASSUME_NONNULL_END
