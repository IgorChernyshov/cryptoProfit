//
//  CPTMainScreenPresenterProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 16/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@class UIViewController;
@protocol CPTMainScreenViewProtocol;


NS_ASSUME_NONNULL_BEGIN


/**
 Протокол презентера экрана отображения пользовательских криптовалют. Содержит описание методов, которые должен имплементировать презентер.
 */
@protocol CPTMainScreenPresenterProtocol <NSObject>

@property (nonatomic, weak) UIViewController<CPTMainScreenViewProtocol> *view; /**< View экрана отображения пользовательских криптовалют, которой управляет презентер. */

/**
 Оповещение о том, что View появилась на экране и необходимо загрузить данные для отображения.
 */
- (void)viewWillAppearOnScreen;

/**
 Оповещение, что у View была нажата кнопка "Настройки".
 */
- (void)optionsButtonWasPressed;

/**
 Оповещение, что у View была нажата кнопка "Добавить".
 */
- (void)addCurrencyButtonWasPressed;

@end

NS_ASSUME_NONNULL_END
