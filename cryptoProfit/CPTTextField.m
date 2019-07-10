//
//  CPTTextField.m
//  cryptoProfit
//
//  Created by Igor Chernyshov on 09/07/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "CPTTextField.h"
#import "UIColor+CPTColors.h"


@implementation CPTTextField

- (instancetype)init
{
	self = [super init];
	if (self) {
		self.translatesAutoresizingMaskIntoConstraints = NO;
		self.borderStyle = UITextBorderStyleRoundedRect;
		self.backgroundColor = [UIColor addCurrencyBackgroundColor];
		self.textColor = [UIColor addCurrencyTextColor];
		self.font = [self textFieldFont];
		self.autocorrectionType = UITextAutocorrectionTypeNo;
		self.spellCheckingType = UITextSpellCheckingTypeNo;
		self.autocapitalizationType = UITextAutocapitalizationTypeNone;
		self.clearsOnBeginEditing = YES;
	}
	return self;
}


#pragma mark - Helpers

- (void)configureAttributedPlaceholderWithText:(NSString *)text
{
	NSDictionary<NSAttributedStringKey,id> *attributes = [self placeholderAttributes];
	NSAttributedString *placeholder = [[NSAttributedString alloc] initWithString:text attributes: attributes];
	self.attributedPlaceholder = placeholder;
}

- (NSDictionary<NSAttributedStringKey,id> *)placeholderAttributes
{
	return @{
			 NSForegroundColorAttributeName : [UIColor addCurrencyPlaceholderColor],
			 NSFontAttributeName : [self textFieldFont]
			 };
}

- (UIFont *)textFieldFont
{
	return [UIFont fontWithName:@"Helvetica" size:16.0];
}

@end
