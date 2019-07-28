//
//  CPTLoadingView.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 21/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit;


NS_ASSUME_NONNULL_BEGIN


/**
 View с индикатором загрузки.
 */
@interface CPTLoadingView : UIView

/**
 Отобразить view.
 */
- (void)show;

/**
 Скрыть view.
 */
- (void)hide;

@end

NS_ASSUME_NONNULL_END
