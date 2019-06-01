//
//  UIColor+CPTColors.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 01/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "UIColor+CPTColors.h"


@implementation UIColor (CPTColors)

+ (UIColor *)cpt_darkGray100
{
	return [UIColor colorWithRed:41.f/255.f
						   green:40.f/255.f
							blue:52.f/255.f
						   alpha:1];
}

+ (UIColor *)cpt_darkGray65
{
	return [UIColor colorWithRed:41.f/255.f
						   green:40.f/255.f
							blue:52.f/255.f
						   alpha:0.65];
}

+ (UIColor *)cpt_lightGray
{
	return [UIColor colorWithRed:65.f/255.f
						   green:69.f/255.f
							blue:80.f/255.f
						   alpha:1];
}

+ (UIColor *)cpt_green
{
	return [UIColor colorWithRed:143.f/255.f
						   green:207.f/255.f
							blue:78.f/255.f
						   alpha:1];
}

@end
