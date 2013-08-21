//
//  UIView(MCLayoutDeprecated)
//  UIViewLayoutExample
//
//  Created by mlefrancois on 2013-08-16
//  Copyright (c) 2013 Mirego Inc. All rights reserved.
//


#import <Foundation/Foundation.h>

#define MC_DEPRECATED __attribute__ ((deprecated))

@interface UIView (MCLayoutDeprecated)

- (CGFloat)mc_baselinePosition MC_DEPRECATED;
- (CGFloat)mc_bottomPosition MC_DEPRECATED;
- (CGFloat)mc_rightMostPosition MC_DEPRECATED;

- (void)mc_positionAtX:(double)xValue MC_DEPRECATED;
- (void)mc_positionAtY:(double)yValue MC_DEPRECATED;
- (void)mc_positionAtX:(double)xValue andY:(double)yValue MC_DEPRECATED;
- (void)mc_positionAtX:(double)xValue andY:(double)yValue withWidth:(double)width MC_DEPRECATED;
- (void)mc_positionAtX:(double)xValue andY:(double)yValue withHeight:(double)height MC_DEPRECATED;
- (void)mc_positionAtX:(double)xValue withHeight:(double)height MC_DEPRECATED;

- (void)mc_positionRightOfSuperViewWithSpacing:(CGFloat)spacing MC_DEPRECATED;
- (void)mc_positionLeftOfSuperViewWithSpacing:(CGFloat)spacing MC_DEPRECATED;
- (void)mc_positionTopOfSuperViewWithSpacing:(CGFloat)spacing MC_DEPRECATED;
- (void)mc_positionBottomOfSuperViewWithSpacing:(CGFloat)spacing MC_DEPRECATED;

- (void)mc_removeSubviews MC_DEPRECATED;

- (void)mc_centerInSuperView MC_DEPRECATED;
- (void)mc_aestheticCenterInSuperView MC_DEPRECATED;

- (void)mc_bringToFront MC_DEPRECATED;
- (void)mc_sendToBack MC_DEPRECATED;

- (void)mc_centerAtX MC_DEPRECATED;
- (void)mc_centerAtXQuarter MC_DEPRECATED;
- (void)mc_centerAtX3Quarter MC_DEPRECATED;

- (void)mc_fillBelowView:(UIView*)view MC_DEPRECATED;
- (void)mc_fillBelowView:(UIView *)view withSpacing:(CGFloat)spacing MC_DEPRECATED;


- (void)mc_positionAbove:(UIView*)view MC_DEPRECATED;
- (void)mc_positionAbove:(UIView *)view withSpacing:(CGFloat)spacing MC_DEPRECATED;
- (void)mc_positionBelow:(UIView*)view MC_DEPRECATED;
- (void)mc_positionBelow:(UIView *)view withSpacing:(CGFloat)spacing MC_DEPRECATED;
- (void)mc_positionLeft:(UIView*)view MC_DEPRECATED;
- (void)mc_positionLeft:(UIView *)view withSpacing:(CGFloat)spacing MC_DEPRECATED;
- (void)mc_positionRight:(UIView*)view MC_DEPRECATED;
- (void)mc_positionRight:(UIView *)view withSpacing:(CGFloat)spacing MC_DEPRECATED;

- (void)mc_alignTop:(UIView*)view MC_DEPRECATED;
- (void)mc_alignTop:(UIView *)view withOffset:(CGFloat)offset MC_DEPRECATED;
- (void)mc_alignBottom:(UIView*)view MC_DEPRECATED;
- (void)mc_alignBottom:(UIView *)view withOffset:(CGFloat)offset MC_DEPRECATED;
- (void)mc_alignLeft:(UIView*)view MC_DEPRECATED;
- (void)mc_alignLeft:(UIView *)view withOffset:(CGFloat)offset MC_DEPRECATED;
- (void)mc_alignRight:(UIView*)view MC_DEPRECATED;
- (void)mc_alignRight:(UIView *)view withOffset:(CGFloat)offset MC_DEPRECATED;

- (void)mc_centerX:(UIView*)view MC_DEPRECATED;
- (void)mc_centerX:(UIView *)view withOffset:(CGFloat)offset MC_DEPRECATED;
- (void)mc_centerY:(UIView*)view MC_DEPRECATED;
- (void)mc_centerY:(UIView *)view withOffset:(CGFloat)offset MC_DEPRECATED;
- (void)mc_centerInView:(UIView*)view MC_DEPRECATED;

- (void)mc_alignRightOfSuperView MC_DEPRECATED;
- (void)mc_alignRightOfSuperViewWithOffset:(CGFloat)offset MC_DEPRECATED;
- (void)mc_alignLeftOfSuperView MC_DEPRECATED;
- (void)mc_alignLeftOfSuperViewWithOffset:(CGFloat)offset MC_DEPRECATED;
- (void)mc_alignTopOfSuperView MC_DEPRECATED;
- (void)mc_alignTopOfSuperViewWithOffset:(CGFloat)offset MC_DEPRECATED;
- (void)mc_alignBottomOfSuperView MC_DEPRECATED;
- (void)mc_alignBottomOfSuperViewWithOffset:(CGFloat)offset MC_DEPRECATED;
@end