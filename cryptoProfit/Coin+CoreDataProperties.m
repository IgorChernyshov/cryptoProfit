//
//  Coin+CoreDataProperties.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 19/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//
//

#import "Coin+CoreDataProperties.h"


@implementation Coin (CoreDataProperties)

+ (NSFetchRequest<Coin *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Coin"];
}

@dynamic name;
@dynamic shortName;
@dynamic quantity;
@dynamic delta;
@dynamic value;

@end
