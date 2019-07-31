//
//  CPTTextField.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 09/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@class UITextField;


NS_ASSUME_NONNULL_BEGIN


/**
 Стандартное текстовое поле, которое используется в приложении.
 Имеет преднастроенный внешний вид и тип клавиатуры.
 TranslatesAutoresizingMaskIntoConstraints выключен.
 */
@interface CPTTextField : UITextField

/**
 Устанавливает в текстовое поле плейсхолдер с атрибутами.

 @param text Текст плейсхолдера.
 */
- (void)configureAttributedPlaceholderWithText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
