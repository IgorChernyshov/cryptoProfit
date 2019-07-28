//
//  CPTDataParserService.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 19/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTDataParserServiceProtocol.h"


NS_ASSUME_NONNULL_BEGIN


/**
 Сервис парсера данных. Парсит JSON полученные из сети в словари, с которыми работает сервис CoreData.
 */
@interface CPTDataParserService : NSObject <CPTDataParserServiceProtocol>

@end

NS_ASSUME_NONNULL_END
