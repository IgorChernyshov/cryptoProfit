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


@interface CPTWalletCell : UITableViewCell

@property (nonatomic, strong) CPTLabel *nameLabel;
@property (nonatomic, strong) CPTLabel *quantityLabel;
@property (nonatomic, strong) CPTLabel *deltaLabel;

@end

NS_ASSUME_NONNULL_END
