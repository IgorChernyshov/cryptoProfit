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
@property (nonatomic, strong) NSArray<NSString *> *coinsNames;

- (void)loadingStarted;
- (void)loadingFinished;

- (void)showCoinsListWithCoinsNames:(NSArray<NSString *> *)coins;
- (void)hideCoinsList;

@end

NS_ASSUME_NONNULL_END
