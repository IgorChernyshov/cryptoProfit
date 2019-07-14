//
//  CPTOptionsPresenterProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 12/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@class UIViewController;
@protocol CPTOptionsViewProtocol;


NS_ASSUME_NONNULL_BEGIN


@protocol CPTOptionsPresenterProtocol <NSObject>

@property (nonatomic, weak) UIViewController<CPTOptionsViewProtocol> *view;

- (void)backButtonWasPressed;
- (void)saveButtonWasPressed;

@end

NS_ASSUME_NONNULL_END
