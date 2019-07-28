//
//  CPTMainScreenPresenter.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 16/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTMainScreenPresenterProtocol.h"
#import "CPTCoreDataServiceProtocol.h"


NS_ASSUME_NONNULL_BEGIN


/**
 Презентер экрана отображения пользовательских криптовалют. Содержит бизнес-логику, управляет View.
 */
@interface CPTMainScreenPresenter : NSObject <CPTMainScreenPresenterProtocol, CPTCoreDataServiceOutputProtocol>

@end

NS_ASSUME_NONNULL_END
