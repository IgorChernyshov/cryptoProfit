//
//  CPTOptionsPresenterProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 12/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@class UIViewController;
@protocol CPTOptionsViewProtocol;


NS_ASSUME_NONNULL_BEGIN


/**
 Протокол презентера экрана опций. Содержит описание методов, которые должен имплементировать презентер.
 */
@protocol CPTOptionsPresenterProtocol <NSObject>

@property (nonatomic, weak) UIViewController<CPTOptionsViewProtocol> *view; /**< View экрана опций, которой управляет презентер. */

/**
 Оповещение от View, что была нажата кнопка "Назад".
 */
- (void)backButtonWasPressed;

/**
 Оповещение от View, что была нажата кнопка "Сохранить".
 */
- (void)saveButtonWasPressed;

@end

NS_ASSUME_NONNULL_END
