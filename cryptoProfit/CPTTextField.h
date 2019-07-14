//
//  CPTTextField.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 09/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@class UITextField;


NS_ASSUME_NONNULL_BEGIN


@interface CPTTextField : UITextField

- (void)configureAttributedPlaceholderWithText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
