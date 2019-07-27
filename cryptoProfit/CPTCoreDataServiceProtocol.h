//
//  CPTCoreDataServiceProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 19/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit;
@class Coin;
@protocol CPTMainScreenPresenterProtocol;
@protocol CPTAddCurrencyPresenterProtocol;
@protocol CPTCoreDataServiceOutputProtocol;


NS_ASSUME_NONNULL_BEGIN


/**
 Протокол сервиса по работе с CoreData.
 Описывает обязательные методы, которые должен имплементировать сервис работы с CoreData.
 */
@protocol CPTCoreDataServiceProtocol <NSObject>

- (void)saveCoinsList:(NSArray<NSDictionary *> *)coinsList;

- (void)loadCoinsListWithOutput:(nonnull id<CPTCoreDataServiceOutputProtocol>)output;

- (void)saveUsersCoinWithName:(NSString *)name
					 quantity:(NSNumber *)quantity
					   output:(nonnull id<CPTCoreDataServiceOutputProtocol>)output;

- (void)getUsersCoinsListWithOutput:(nonnull id<CPTCoreDataServiceOutputProtocol>)output;

@optional

@property (nonatomic, weak) id<CPTMainScreenPresenterProtocol> mainScreenPresenter;
@property (nonatomic, weak) id<CPTAddCurrencyPresenterProtocol> addCurrencyPresenter;

@end


@protocol CPTCoreDataServiceOutputProtocol <NSObject>

@optional

- (void)coinsListWasSaved;
- (void)loadedCoinsList:(NSArray<Coin *> *)coinsList;
- (void)usersCoinSavedSuccessfully;
- (void)successfullyLoadedUsersCoinsList:(NSArray<Coin *> *)coinsList;

@end

NS_ASSUME_NONNULL_END
