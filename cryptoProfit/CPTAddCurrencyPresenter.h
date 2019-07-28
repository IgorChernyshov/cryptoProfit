//
//  CPTAddCurrencyPresenter.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 17/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTAddCurrencyPresenterProtocol.h"
#import "CPTCoreDataServiceProtocol.h"


NS_ASSUME_NONNULL_BEGIN


/**
 Презентер экрана поиска и добавления пользовательских криптовалют. Содержит бизнес-логику, управляет View.
 */
@interface CPTAddCurrencyPresenter : NSObject <CPTAddCurrencyPresenterProtocol, CPTCoreDataServiceOutputProtocol>

@end

NS_ASSUME_NONNULL_END
