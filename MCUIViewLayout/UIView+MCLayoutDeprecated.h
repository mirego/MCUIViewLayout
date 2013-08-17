//
//  UIView(MCLayoutDeprecated)
//  UIViewLayoutExample
//
//  Created by mlefrancois on 2013-08-16
//  Copyright (c) 2013 Mirego Inc. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface UIView (MCLayoutDeprecated)

- (CGFloat)mc_baselinePosition;
- (CGFloat)mc_bottomPosition;
- (CGFloat)mc_rightMostPosition;

- (void)mc_positionAtX:(double)xValue;
- (void)mc_positionAtY:(double)yValue;
- (void)mc_positionAtX:(double)xValue andY:(double)yValue;
- (void)mc_positionAtX:(double)xValue andY:(double)yValue withWidth:(double)width;
- (void)mc_positionAtX:(double)xValue andY:(double)yValue withHeight:(double)height;
- (void)mc_positionAtX:(double)xValue withHeight:(double)height;

- (void)mc_positionRightOfSuperViewWithSpacing:(CGFloat)spacing;
- (void)mc_positionLeftOfSuperViewWithSpacing:(CGFloat)spacing;
- (void)mc_positionTopOfSuperViewWithSpacing:(CGFloat)spacing;
- (void)mc_positionBottomOfSuperViewWithSpacing:(CGFloat)spacing;

- (void)mc_removeSubviews;

- (void)mc_centerInSuperView;
- (void)mc_aestheticCenterInSuperView;

- (void)mc_bringToFront;
- (void)mc_sendToBack;

- (void)mc_centerAtX;
- (void)mc_centerAtXQuarter;
- (void)mc_centerAtX3Quarter;

- (void)mc_fillBelowView:(UIView*)view;
- (void)mc_fillBelowView:(UIView *)view withSpacing:(CGFloat)spacing;


- (void)mc_positionAbove:(UIView*)view;
- (void)mc_positionAbove:(UIView *)view withSpacing:(CGFloat)spacing;
- (void)mc_positionBelow:(UIView*)view;
- (void)mc_positionBelow:(UIView *)view withSpacing:(CGFloat)spacing;
- (void)mc_positionLeft:(UIView*)view;
- (void)mc_positionLeft:(UIView *)view withSpacing:(CGFloat)spacing;
- (void)mc_positionRight:(UIView*)view;
- (void)mc_positionRight:(UIView *)view withSpacing:(CGFloat)spacing;

- (void)mc_alignTop:(UIView*)view;
- (void)mc_alignTop:(UIView *)view withOffset:(CGFloat)offset;
- (void)mc_alignBottom:(UIView*)view;
- (void)mc_alignBottom:(UIView *)view withOffset:(CGFloat)offset;
- (void)mc_alignLeft:(UIView*)view;
- (void)mc_alignLeft:(UIView *)view withOffset:(CGFloat)offset;
- (void)mc_alignRight:(UIView*)view;
- (void)mc_alignRight:(UIView *)view withOffset:(CGFloat)offset;

- (void)mc_centerX:(UIView*)view;
- (void)mc_centerX:(UIView *)view withOffset:(CGFloat)offset;
- (void)mc_centerY:(UIView*)view;
- (void)mc_centerY:(UIView *)view withOffset:(CGFloat)offset;
- (void)mc_centerInView:(UIView*)view;

- (void)mc_alignRightOfSuperView;
- (void)mc_alignRightOfSuperViewWithOffset:(CGFloat)offset;
- (void)mc_alignLeftOfSuperView;
- (void)mc_alignLeftOfSuperViewWithOffset:(CGFloat)offset;
- (void)mc_alignTopOfSuperView;
- (void)mc_alignTopOfSuperViewWithOffset:(CGFloat)offset;
- (void)mc_alignBottomOfSuperView;
- (void)mc_alignBottomOfSuperViewWithOffset:(CGFloat)offset;
@end