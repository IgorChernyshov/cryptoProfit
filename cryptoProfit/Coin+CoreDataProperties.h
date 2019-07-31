//
//  Coin+CoreDataProperties.h
//  cryptoProfit
//
//  Created by Igor Chernyshov on 19/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//
//

#import "Coin+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN


@interface Coin (CoreDataProperties)

+ (NSFetchRequest<Coin *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *shortName;
@property (nonatomic) float quantity;

@end

NS_ASSUME_NONNULL_END
