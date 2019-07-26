//
//  CPTMainScreenViewProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 16/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import Foundation;


NS_ASSUME_NONNULL_BEGIN


@protocol CPTMainScreenViewProtocol <NSObject>

- (void)loadingStarted;
- (void)loadingFinished;

- (void)showCoinsListWithCoinsNames:(NSArray<NSString *> *)coins;
- (void)hideCoinsList;

@end

NS_ASSUME_NONNULL_END
