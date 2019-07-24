//
//  CPTCoreDataServiceProtocol.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 19/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

@import UIKit;
@class Coin;
@protocol CPTCoreDataServiceOutputProtocol;


NS_ASSUME_NONNULL_BEGIN


/**
 Протокол сервиса по работе с CoreData.
 Описывает обязательные методы, которые должен имплементировать сервис работы с CoreData.
 */
@protocol CPTCoreDataServiceProtocol <NSObject>

+ (void)saveToDatabaseCoinsList:(NSArray<NSDictionary *> *)coinsList
					 withOutput:(id<CPTCoreDataServiceOutputProtocol>)output;

+ (void)loadCoinsListWithFilter:(NSString *)filter
						 output:(nonnull id<CPTCoreDataServiceOutputProtocol>)output;

+ (void)saveUsersCoinWithName:(NSString *)name
					 quantity:(CGFloat)quantity
					   output:(nonnull id<CPTCoreDataServiceOutputProtocol>)output;

@end


@protocol CPTCoreDataServiceOutputProtocol <NSObject>

- (void)coinsListWasSaved;
- (void)filteringFinishedWithCoinsList:(NSArray<Coin *> *)coinsList;
- (void)usersCoinSavedSuccessfully;

@end

NS_ASSUME_NONNULL_END
