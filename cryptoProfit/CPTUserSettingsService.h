//
//  CPTUserSettingsService.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 21/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import Foundation;


NS_ASSUME_NONNULL_BEGIN


/**
 Сервис, который сохраняет и загружает пользовательские настройки в NSUserDefaults.
 */
@interface CPTUserSettingsService : NSObject

/**
 Оповещение о том, что приложение было запущено.
 Устанавливает флаг необходимости обновления списка криптовалют в YES.
 */
+ (void)applicationStarted;

/**
 Оповещение о том, что список криптовалют был обновлён.
 Устанавливает флаг необходимости обновления списка криптовалют в NO.
 */
+ (void)coinsListHasBeenUpdated;

/**
 Проверяет, был ли обновлён список криптовалют после запуска приложения.

 @return YES - был обновлён, NO - не был.
 */
+ (BOOL)coinsListWasUpdatedAfterLaunch;

@end

NS_ASSUME_NONNULL_END
