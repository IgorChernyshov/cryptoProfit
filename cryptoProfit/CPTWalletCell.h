//
//  CPTWalletCell.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 16/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@class UITableViewCell;
@class CPTLabel;


NS_ASSUME_NONNULL_BEGIN


/**
 Ячейка, отображающая название, количество, стоимость и изменение в цене пользовательских криптовалют.
 */
@interface CPTWalletCell : UITableViewCell

@property (nonatomic, strong) CPTLabel *nameLabel; /**< Лейбл с названием криптовалюты. */
@property (nonatomic, strong) CPTLabel *quantityLabel; /**< Лейбл с количеством криптовалюты. */
@property (nonatomic, strong) CPTLabel *deltaLabel; /**< Лейбл с изменением стоимости криптовалюты. */

@end

NS_ASSUME_NONNULL_END
