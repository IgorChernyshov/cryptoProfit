//
//  CPTUserSettings.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 21/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import Foundation;


NS_ASSUME_NONNULL_BEGIN


@interface CPTUserSettings : NSObject

// Сохранить настройки пользователя
+ (void)coinsListHasBeenUpdated;

// Загрузить настройки пользователя
+ (BOOL)coinsListWasUpdatedAfterLaunch;

@end

NS_ASSUME_NONNULL_END
