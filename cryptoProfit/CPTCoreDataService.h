//
//  CPTCoreDataService.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 19/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTCoreDataServiceProtocol.h"


NS_ASSUME_NONNULL_BEGIN


/**
 Сервис по работе с CoreData. Сохраняет и загружает объекты Coin в CoreData.
 */
@interface CPTCoreDataService : NSObject <CPTCoreDataServiceProtocol>

@end

NS_ASSUME_NONNULL_END
