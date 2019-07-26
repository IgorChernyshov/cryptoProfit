//
//  CPTMainScreenViewController.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 23/05/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@class UIViewController;
#import "CPTMainScreenViewProtocol.h"
@protocol CPTMainScreenPresenterProtocol;


NS_ASSUME_NONNULL_BEGIN


/**
 Главный экран приложения, где отображается список криптовалют и откуда осуществляется навигация на другие экраны.
 */
@interface CPTMainScreenViewController : UIViewController <CPTMainScreenViewProtocol>

- (instancetype)initWithPresenter:(id<CPTMainScreenPresenterProtocol>)presenter;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
