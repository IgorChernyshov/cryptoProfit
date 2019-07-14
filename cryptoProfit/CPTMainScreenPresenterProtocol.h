//
//  CPTMainScreenPresenterProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 16/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CPTMainScreenViewController;

NS_ASSUME_NONNULL_BEGIN


@protocol CPTMainScreenPresenterProtocol <NSObject>

@property (nonatomic, weak) CPTMainScreenViewController *view;

- (void)optionsButtonWasPressed;
- (void)addCurrencyButtonWasPressed;

@end

NS_ASSUME_NONNULL_END
