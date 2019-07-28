//
//  CPTCoinViewModel.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 28/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import Foundation;


NS_ASSUME_NONNULL_BEGIN


/**
 Модель, используемая View для отображения информации о пользовательской криптовалюте.
 */
@interface CPTCoinViewModel : NSObject

@property (nonatomic, copy) NSString *name;  /**< Название криптовалюты. */
@property (nonatomic, copy) NSString *shortName; /**< Идентификатор криптовалюты. */
@property (nonatomic, strong) NSNumber *quantity; /**< Количество криптовалюты. */
@property (nonatomic, strong) NSNumber *value; /**< Стоимость криптовалюты. */

@end

NS_ASSUME_NONNULL_END
