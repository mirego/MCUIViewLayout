//
//  UIView+Layout.h
//  UIViewLayout
//
//  Created by Jean-Philippe Couture on 2012-08-30.
//  Copyright (c) 2012 Mirego, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MCViewPosition) {
    MCViewPositionCenter,
    MCViewPositionTop,
    MCViewPositionBottom,
    MCViewPositionCenterLeft,
    MCViewPositionRight,
    MCViewPositionTopLeft,
    MCViewPositionTopRight,
    MCViewPositionBottomLeft,
    MCViewPositionBottomRight,
};

typedef NS_ENUM(NSInteger, MCViewRelativePosition) {
    MCViewRelativePositionAboveAlignedLeft,
    MCViewRelativePositionAboveCentered,
    MCViewRelativePositionAboveAlignedRight,
    MCViewRelativePositionToTheRightAlignedTop,
    MCViewRelativePositionToTheRightCentered,
    MCViewRelativePositionToTheRightAlignedBottom,
    MCViewRelativePositionToTheLeftAlignedTop,
    MCViewRelativePositionToTheLefttCentered,
    MCViewRelativePositionToTheLeftAlignedBottom,
    MCViewRelativePositionUnderAlignedLeft,
    MCViewRelativePositionUnderCentered,
    MCViewRelativePositionUnderAlignedRight
};

@interface UIView (MCLayout)

- (CGFloat)mc_width;
- (void)mc_setWidth:(CGFloat)width;

- (CGFloat)mc_height;
- (void)mc_setHeight:(CGFloat)height;

- (CGFloat)mc_bottomPosition;

- (CGSize)mc_size;
- (void)mc_setSize:(CGSize)size;

- (CGPoint)mc_origin;
- (void)mc_setOrigin:(CGPoint)point;

- (CGFloat)mc_xPosition;
- (CGFloat)mc_yPosition;

- (CGFloat)mc_baselinePosition;
- (CGFloat)mc_rightMostPosition;

- (void)mc_setPosition:(MCViewPosition)position withMargins:(UIEdgeInsets)margins;
- (void)mc_setPosition:(MCViewRelativePosition)position relativeToView:(UIView *)view withMargins:(UIEdgeInsets)margins;
- (void)mc_setPosition:(MCViewPosition)position inView:(UIView *)view withMargins:(UIEdgeInsets)margins;

- (void)mc_setPosition:(MCViewPosition)position withMargins:(UIEdgeInsets)margins size:(CGSize) size;
- (void)mc_setPosition:(MCViewRelativePosition)position relativeToView:(UIView *)view withMargins:(UIEdgeInsets)margins size:(CGSize) size;
- (void)mc_setPosition:(MCViewPosition)position inView:(UIView *)view withMargins:(UIEdgeInsets)margins size:(CGSize) size;


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
