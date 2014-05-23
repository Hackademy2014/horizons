//
//  NHCommon.h
//  New Horizons
//
//  Created by Joseph Morrill on 5/21/14.
//  Copyright (c) 2014 Hackademy. All rights reserved.
//
#ifndef COMMON_H
#define COMMON_H
#import <Foundation/Foundation.h>

@interface NHCommon : NSObject
UIColor* frgba( float cRed, float cGreen, float cBlue, float cAlpha );
UIColor* irgba( int cRed, int cGreen, int cBlue, float cAlpha );
void styleButtonsWithGradient( NSArray *buttons, int startRed, int startGreen, int startBlue, float startAlpha, int endRed, int endGreen, int endBlue, float endAlpha, float borderRadius, float borderSize, UIColor *borderColor, UIColor *titleColor, UIColor *titleHoverColor, NSString *titleFont, float titleSize );
@end
#endif