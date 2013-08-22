//
//  UIView(MCLayoutDeprecated)
//  UIViewLayoutExample
//
//  Created by mlefrancois on 2013-08-16
//  Copyright (c) 2013 Mirego Inc. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface UIView (MCLayoutDeprecated)

- (CGFloat)mc_baselinePosition __attribute__ ((deprecated));
- (CGFloat)mc_bottomPosition __attribute__ ((deprecated));
- (CGFloat)mc_rightMostPosition __attribute__ ((deprecated));

- (void)mc_positionAtX:(double)xValue __attribute__ ((deprecated));
- (void)mc_positionAtY:(double)yValue __attribute__ ((deprecated));
- (void)mc_positionAtX:(double)xValue andY:(double)yValue __attribute__ ((deprecated));
- (void)mc_positionAtX:(double)xValue andY:(double)yValue withWidth:(double)width __attribute__ ((deprecated));
- (void)mc_positionAtX:(double)xValue andY:(double)yValue withHeight:(double)height __attribute__ ((deprecated));
- (void)mc_positionAtX:(double)xValue withHeight:(double)height __attribute__ ((deprecated));

- (void)mc_positionRightOfSuperViewWithSpacing:(CGFloat)spacing __attribute__ ((deprecated));
- (void)mc_positionLeftOfSuperViewWithSpacing:(CGFloat)spacing __attribute__ ((deprecated));
- (void)mc_positionTopOfSuperViewWithSpacing:(CGFloat)spacing __attribute__ ((deprecated));
- (void)mc_positionBottomOfSuperViewWithSpacing:(CGFloat)spacing __attribute__ ((deprecated));

- (void)mc_removeSubviews __attribute__ ((deprecated));

- (void)mc_centerInSuperView __attribute__ ((deprecated));
- (void)mc_aestheticCenterInSuperView __attribute__ ((deprecated));

- (void)mc_bringToFront __attribute__ ((deprecated));
- (void)mc_sendToBack __attribute__ ((deprecated));

- (void)mc_centerAtX __attribute__ ((deprecated));
- (void)mc_centerAtXQuarter __attribute__ ((deprecated));
- (void)mc_centerAtX3Quarter __attribute__ ((deprecated));

- (void)mc_fillBelowView:(UIView*)view __attribute__ ((deprecated));
- (void)mc_fillBelowView:(UIView *)view withSpacing:(CGFloat)spacing __attribute__ ((deprecated));


- (void)mc_positionAbove:(UIView*)view __attribute__ ((deprecated));
- (void)mc_positionAbove:(UIView *)view withSpacing:(CGFloat)spacing __attribute__ ((deprecated));
- (void)mc_positionBelow:(UIView*)view __attribute__ ((deprecated));
- (void)mc_positionBelow:(UIView *)view withSpacing:(CGFloat)spacing __attribute__ ((deprecated));
- (void)mc_positionLeft:(UIView*)view __attribute__ ((deprecated));
- (void)mc_positionLeft:(UIView *)view withSpacing:(CGFloat)spacing __attribute__ ((deprecated));
- (void)mc_positionRight:(UIView*)view __attribute__ ((deprecated));
- (void)mc_positionRight:(UIView *)view withSpacing:(CGFloat)spacing __attribute__ ((deprecated));

- (void)mc_alignTop:(UIView*)view __attribute__ ((deprecated));
- (void)mc_alignTop:(UIView *)view withOffset:(CGFloat)offset __attribute__ ((deprecated));
- (void)mc_alignBottom:(UIView*)view __attribute__ ((deprecated));
- (void)mc_alignBottom:(UIView *)view withOffset:(CGFloat)offset __attribute__ ((deprecated));
- (void)mc_alignLeft:(UIView*)view __attribute__ ((deprecated));
- (void)mc_alignLeft:(UIView *)view withOffset:(CGFloat)offset __attribute__ ((deprecated));
- (void)mc_alignRight:(UIView*)view __attribute__ ((deprecated));
- (void)mc_alignRight:(UIView *)view withOffset:(CGFloat)offset __attribute__ ((deprecated));

- (void)mc_centerX:(UIView*)view __attribute__ ((deprecated));
- (void)mc_centerX:(UIView *)view withOffset:(CGFloat)offset __attribute__ ((deprecated));
- (void)mc_centerY:(UIView*)view __attribute__ ((deprecated));
- (void)mc_centerY:(UIView *)view withOffset:(CGFloat)offset __attribute__ ((deprecated));
- (void)mc_centerInView:(UIView*)view __attribute__ ((deprecated));

- (void)mc_alignRightOfSuperView __attribute__ ((deprecated));
- (void)mc_alignRightOfSuperViewWithOffset:(CGFloat)offset __attribute__ ((deprecated));
- (void)mc_alignLeftOfSuperView __attribute__ ((deprecated));
- (void)mc_alignLeftOfSuperViewWithOffset:(CGFloat)offset __attribute__ ((deprecated));
- (void)mc_alignTopOfSuperView __attribute__ ((deprecated));
- (void)mc_alignTopOfSuperViewWithOffset:(CGFloat)offset __attribute__ ((deprecated));
- (void)mc_alignBottomOfSuperView __attribute__ ((deprecated));
- (void)mc_alignBottomOfSuperViewWithOffset:(CGFloat)offset __attribute__ ((deprecated));
@end