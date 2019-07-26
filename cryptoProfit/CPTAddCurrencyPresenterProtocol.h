//
//  CPTAddCurrencyPresenterProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 17/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit;
@class UIViewController;
@protocol CPTAddCurrencyViewProtocol;
@protocol CPTNetworkServiceOutputProtocol;


NS_ASSUME_NONNULL_BEGIN


@protocol CPTAddCurrencyPresenterProtocol <NSObject>

@property (nonatomic, weak) UIViewController<CPTAddCurrencyViewProtocol> *view;

- (void)backButtonWasPressed;
- (void)saveButtonWasPressedWithCoinName:(NSString *)name quantity:(CGFloat)quantity;

- (void)parsedCoinsListWithNames:(NSArray<NSString *> *)names;
- (void)userIsSearchingForCoinName:(NSString *)name inArrayOfNames:(NSArray<NSString *> *)names;

- (void)viewAppearedOnScreen;

@end

NS_ASSUME_NONNULL_END
