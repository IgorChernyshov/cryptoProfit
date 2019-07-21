//
//  CPTAddCurrencyPresenterProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 17/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@protocol CPTAddCurrencyViewProtocol;
@protocol CPTNetworkServiceOutputProtocol;
@class UIViewController;


NS_ASSUME_NONNULL_BEGIN


@protocol CPTAddCurrencyPresenterProtocol <NSObject>

@property (nonatomic, weak) UIViewController<CPTAddCurrencyViewProtocol> *view;

- (void)backButtonWasPressed;
- (void)saveButtonWasPressed;
- (void)textFieldDidBeginEditing;
- (void)viewAppearedOnScreen;

@end

NS_ASSUME_NONNULL_END
