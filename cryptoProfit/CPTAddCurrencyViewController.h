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


/**
 Пассивная View экрана поиска и добавления криптовалюты. Управляется презентером.
 */
@interface CPTAddCurrencyViewController : UIViewController <CPTAddCurrencyViewProtocol>

/**
 Инициализатор View. У View обязательно должен быть презентер.

 @param presenter Презентер экрана добавления криптовалюты.
 @return Настроенная View.
 */
- (instancetype)initWithPresenter:(id<CPTAddCurrencyPresenterProtocol>)presenter;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
