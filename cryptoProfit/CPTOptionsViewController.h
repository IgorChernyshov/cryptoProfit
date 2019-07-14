//
//  CPTOptionsViewController.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 12/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPTOptionsViewProtocol.h"
@protocol CPTOptionsPresenterProtocol;


NS_ASSUME_NONNULL_BEGIN

@interface CPTOptionsViewController : UIViewController <CPTOptionsViewProtocol>

- (instancetype)initWithPresenter:(id<CPTOptionsPresenterProtocol>)presenter;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
