//
//  CPTAddCurrencyViewProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 17/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import Foundation;
@class CPTTextField;


NS_ASSUME_NONNULL_BEGIN


@protocol CPTAddCurrencyViewProtocol <NSObject>

@property (nonatomic, strong) CPTTextField *currencyNameTextField;
@property (nonatomic, strong) CPTTextField *currencyQuantityTextField;

- (void)loadingStarted;
- (void)loadingFinishedWithCoinsNames:(NSArray<NSString *> *)coins;

- (void)showFilteredCoinsListWithCoinsNames:(NSArray<NSString *> *)coins;
- (void)hideCoinsList;

@end

NS_ASSUME_NONNULL_END
