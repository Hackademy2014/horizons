//
//  NHCommon.m
//  New Horizons
//
//  Created by Joseph Morrill on 5/21/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//

#import "NHCommon.h"

@implementation NHCommon

UIColor* frgba( float cRed, float cGreen, float cBlue, float cAlpha ){
	return [UIColor colorWithRed:cRed / 255.0f green:cGreen / 255.0f blue:cBlue / 255.0f alpha:cAlpha];
}
UIColor* irgba( int cRed, int cGreen, int cBlue, float cAlpha ){
	return [UIColor colorWithRed:(float)cRed / 255.0f green:(float)cGreen / 255.0f blue:(float)cBlue / 255.0f alpha:cAlpha];
}

void styleButtonsWithGradient( NSArray *buttons, int startRed, int startGreen, int startBlue, float startAlpha, int endRed, int endGreen, int endBlue, float endAlpha, float borderRadius, float borderSize, UIColor *borderColor, UIColor *titleColor, UIColor *titleHoverColor, NSString *titleFont, float titleSize ){
    for( UIButton *button in buttons ){
        [button setTitleColor:titleColor forState:UIControlStateNormal];
        [button setTitleColor:titleHoverColor forState:UIControlStateHighlighted];
        
        // Set default background color
        [button setBackgroundColor:[UIColor blackColor]];
        
        // Set title details
        [[button titleLabel] setFont:[UIFont fontWithName:titleFont size:titleSize]];
        
        // Draw a custom gradient
        CAGradientLayer *buttonGradient = [CAGradientLayer layer];
        buttonGradient.frame = button.bounds;
        buttonGradient.colors = [NSArray arrayWithObjects:
                                 (id)[frgba((float)startRed, (float)startGreen, (float)startBlue, startAlpha) CGColor],
                              (id)[frgba((float)endRed, (float)endGreen, (float)endBlue, endAlpha) CGColor],
                              nil];
        [button.layer insertSublayer:buttonGradient atIndex:0];
        
        // Round button corners
        CALayer *buttonLayer = [button layer];
        [buttonLayer setMasksToBounds:YES];
        [buttonLayer setCornerRadius:borderRadius];
        
        // Apply border
        [buttonLayer setBorderWidth:borderSize];
        [buttonLayer setBorderColor:[borderColor CGColor]];
    }
}

void styleViewWithGradient( UIView *view, int startRed, int startGreen, int startBlue, float startAlpha, int endRed, int endGreen, int endBlue, float endAlpha ){
	// Set default background color
	[view setBackgroundColor:[UIColor blackColor]];
	
	// Draw a custom gradient
	CAGradientLayer *theGradient = [CAGradientLayer layer];
	theGradient.frame = view.bounds;
	theGradient.colors = [NSArray arrayWithObjects:
							 (id)[frgba((float)startRed, (float)startGreen, (float)startBlue, startAlpha) CGColor],
							 (id)[frgba((float)endRed, (float)endGreen, (float)endBlue, endAlpha) CGColor],
							 nil];
	[view.layer insertSublayer:theGradient atIndex:0];
}

void styleTableCell( UITableViewCell *cell ){
	cell.backgroundColor = kYellow;
    cell.textLabel.backgroundColor = kClear;
    cell.detailTextLabel.backgroundColor = kClear;
}
@end
