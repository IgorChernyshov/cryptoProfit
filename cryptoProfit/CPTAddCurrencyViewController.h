//
//  CPTAddCurrencyViewController.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 17/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@class UIViewController;
@protocol CPTAddCurrencyPresenterProtocol;
#import "CPTAddCurrencyViewProtocol.h"


NS_ASSUME_NONNULL_BEGIN


@interface CPTAddCurrencyViewController : UIViewController <CPTAddCurrencyViewProtocol>

- (instancetype)initWithPresenter:(id<CPTAddCurrencyPresenterProtocol>)presenter;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
