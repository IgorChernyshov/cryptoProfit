//
//  CPTCoinNameCell.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 21/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@class UITableViewCell;
@class CPTLabel;


NS_ASSUME_NONNULL_BEGIN


/**
 Ячейка, отображающая название криптовалюты в списке для поиска криптовалют.
 */
@interface CPTCoinNameCell : UITableViewCell

@property (nonatomic, strong) CPTLabel *coinName; /**< Лейбл с названием криптовалюты. */

@end

NS_ASSUME_NONNULL_END
