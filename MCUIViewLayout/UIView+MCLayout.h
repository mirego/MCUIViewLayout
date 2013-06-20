// Copyright (c) 2013, Mirego
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// - Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
// - Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
// - Neither the name of the Mirego nor the names of its contributors may
//   be used to endorse or promote products derived from this software without
//   specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

#import <UIKit/UIKit.h>
#import "MCUIViewLayoutPosition.h"


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

- (void)mc_setPosition:(MCViewPosition)position;
- (void)mc_setPosition:(MCViewPosition)position withMargins:(UIEdgeInsets)margins;
- (void)mc_setPosition:(MCViewPosition)position withMargins:(UIEdgeInsets)margins size:(CGSize) size;

- (void)mc_setPosition:(MCViewPosition)position inView:(UIView *)view;
- (void)mc_setPosition:(MCViewPosition)position inView:(UIView *)view withMargins:(UIEdgeInsets)margins;
- (void)mc_setPosition:(MCViewPosition)position inView:(UIView *)view withMargins:(UIEdgeInsets)margins size:(CGSize) size;

- (void)mc_setRelativePosition:(MCViewRelativePosition)position toView:(UIView *)view withMargins:(UIEdgeInsets)margins;
- (void)mc_setRelativePosition:(MCViewRelativePosition)position toView:(UIView *)view withMargins:(UIEdgeInsets)margins size:(CGSize) size;


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
