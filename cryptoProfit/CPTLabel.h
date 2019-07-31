//
//  CPTLabel.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 12/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit.UILabel;


NS_ASSUME_NONNULL_BEGIN


/**
 Стандартный лейбл, который используется в приложении.
 Имеет преднастроенный внешний вид.
 TranslatesAutoresizingMaskIntoConstraints выключен.
 */
@interface CPTLabel : UILabel

/**
 Инициализирует лейбл, настраивая внешний вид и устанавливая текст для отображения.

 @param text Текст лейбла.
 @return Лейбл с настроенным внешним видом и текстом.
 */
- (instancetype)initWithText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
