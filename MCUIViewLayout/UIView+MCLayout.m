//
//  UIView+Layout.m
//  UIViewLayout
//
//  Created by Jean-Philippe Couture on 2012-08-30.
//  Copyright (c) 2012 Mirego, Inc. All rights reserved.
//

#import "UIView+MCLayout.h"

@implementation UIView (MCLayout)

- (void)mc_removeSubviews {
	for (UIView *view in self.subviews) {
		[view removeFromSuperview];
	}
}

- (CGFloat)mc_width
{
	CGRect bounds = [self bounds];
	return bounds.size.width;
}

- (void)mc_setWidth:(CGFloat)value
{
	CGRect frame = [self frame];
	frame.size.width = round(value);
	[self setFrame:frame];
}

- (CGFloat)mc_height
{
	CGRect bounds = [self bounds];
	return bounds.size.height;
}

- (void)mc_setHeight:(CGFloat)value
{
	CGRect frame = [self frame];
	frame.size.height = round(value);
	[self setFrame:frame];
}

- (CGFloat)mc_bottomPosition
{
	return ([self mc_height] + [self mc_yPosition]);
}

- (void)mc_setSize:(CGSize)size
{
	CGRect frame = [self frame];
	frame.size.width = round(size.width);
	frame.size.height = round(size.height);
	[self setFrame:frame];
}

- (CGSize)mc_size
{
	CGRect bounds = [self bounds];
	return bounds.size;
}

- (void)mc_fillBelowView:(UIView *)view
{
    [self mc_fillBelowView:view withSpacing:0.0f];
}


- (void)mc_fillBelowView:(UIView *)view withSpacing:(CGFloat)spacing
{
    if (!self.superview) return;
    if (self.superview != view.superview) return;
    
    CGRect frame = self.superview.bounds;
    frame.origin.y = view.mc_baselinePosition + spacing;
    frame.size.height -= (view.mc_baselinePosition + spacing);
    
    [self setFrame:frame];
}

- (CGPoint)mc_origin
{
	CGRect frame = [self frame];
	return frame.origin;
}

- (void)mc_setOrigin:(CGPoint)point
{
	CGRect frame = [self frame];
	frame.origin = point;
	[self setFrame:frame];
}

- (CGFloat)mc_xPosition
{
	CGRect frame = [self frame];
	return frame.origin.x;
}

- (CGFloat)mc_yPosition
{
	CGRect frame = [self frame];
	return frame.origin.y;
}

- (CGFloat)mc_baselinePosition
{
	return [self mc_yPosition] + [self mc_height];
}

- (CGFloat)mc_rightMostPosition
{
    return  [self mc_xPosition] + [self mc_width];
}


- (void)mc_PositionSubView:(UIView *)view aligned:(UIViewContentMode)position inset:(UIEdgeInsets)inset {
    CGRect viewFrame = view.frame;
    CGFloat width = CGRectGetWidth(viewFrame);
    CGFloat height = CGRectGetHeight(viewFrame);

    switch (position) {
        case UIViewContentModeTop: {
            view.frame = CGRectMake(((CGRectGetWidth(self.bounds) - CGRectGetWidth(viewFrame)) * 0.5f),
                                    inset.top,
                                    width,
                                    height);
            break;
        }
        case UIViewContentModeTopRight: {
            view.frame = CGRectMake(CGRectGetWidth(self.bounds) - CGRectGetWidth(viewFrame) - inset.right,
                                    inset.top,
                                    width,
                                    height);
            break;
        }
        case UIViewContentModeTopLeft: {
            view.frame = CGRectMake(inset.left,
                                    inset.top,
                                    width,
                                    height);
            break;
        }
        case UIViewContentModeBottomRight: {
            view.frame = CGRectMake(CGRectGetWidth(self.bounds) - CGRectGetWidth(viewFrame) - inset.right,
                                    CGRectGetHeight(self.bounds) - CGRectGetHeight(viewFrame) - inset.bottom,
                                    width,
                                    height);
            break;
        }
        case UIViewContentModeBottomLeft: {
            view.frame = CGRectMake(inset.left,
                                    CGRectGetHeight(self.bounds) - CGRectGetHeight(viewFrame) - inset.bottom,
                                    width,
                                    height);
            break;
        }
        case UIViewContentModeBottom:
        default: {
            view.frame = CGRectMake(((CGRectGetWidth(self.bounds) - CGRectGetWidth(viewFrame)) * 0.5f),
                                    CGRectGetHeight(self.bounds) - CGRectGetHeight(viewFrame) - inset.bottom,
                                    width,
                                    height);
            break;
        }
    }

}

- (void)mc_positionAtX:(double)xValue {
	CGRect frame = [self frame];
	frame.origin.x = round(xValue);
	[self setFrame:frame];
}

- (void)mc_positionAtY:(double)yValue {
	CGRect frame = [self frame];
	frame.origin.y = round(yValue);
	[self setFrame:frame];
}

- (void)mc_positionAtX:(double)xValue andY:(double)yValue {
	CGRect frame = [self frame];
	frame.origin.x = round(xValue);
	frame.origin.y = round(yValue);
	[self setFrame:frame];
}

- (void)mc_positionAtX:(double)xValue andY:(double)yValue withWidth:(double)width {
	CGRect frame = [self frame];
	frame.origin.x = round(xValue);
	frame.origin.y = round(yValue);
	frame.size.width = width;
	[self setFrame:frame];
}

- (void)mc_positionAtX:(double)xValue andY:(double)yValue withHeight:(double)height {
	CGRect frame = [self frame];
	frame.origin.x = round(xValue);
	frame.origin.y = round(yValue);
	frame.size.height = height;
	[self setFrame:frame];
}

- (void)mc_positionAtX:(double)xValue withHeight:(double)height {
	CGRect frame = [self frame];
	frame.origin.x = round(xValue);
	frame.size.height = height;
	[self setFrame:frame];
}


- (void)mc_positionRightOfSuperViewWithSpacing:(CGFloat)spacing
{
    if (self.superview) {
        [self mc_positionAtX:(self.superview.mc_width - self.mc_width - spacing)];
    }
}

- (void)mc_positionLeftOfSuperViewWithSpacing:(CGFloat)spacing
{
    [self mc_positionAtX:spacing];
}

- (void)mc_positionTopOfSuperViewWithSpacing:(CGFloat)spacing
{
    [self mc_positionAtY:spacing];
}

- (void)mc_positionBottomOfSuperViewWithSpacing:(CGFloat)spacing
{
    if (self.superview) {
        [self mc_positionAtY:(self.superview.mc_height - self.mc_height - spacing)];
    }
}

- (void)mc_centerInSuperView
{
    if (self.superview) {
        double xPos = round((self.superview.bounds.size.width - self.bounds.size.width) / 2.0f);
        double yPos = round((self.superview.bounds.size.height - self.bounds.size.height) / 2.0f);
        [self mc_positionAtX:xPos andY:yPos];
    }
}

- (void)mc_aestheticCenterInSuperView
{
	double xPos = round(([self.superview mc_width] - [self mc_width]) / 2.0);
	double yPos = round(([self.superview mc_height] - [self mc_height]) / 2.0) - ([self.superview mc_height] / 8.0f);
    [self mc_positionAtX:xPos andY:yPos];
}

- (void)mc_bringToFront
{
	[self.superview bringSubviewToFront:self];
}

- (void)mc_sendToBack
{
	[self.superview sendSubviewToBack:self];
}

- (void)mc_centerAtX
{
    double xPos = round((self.superview.bounds.size.width - self.bounds.size.width) / 2.0f);
    [self mc_positionAtX:xPos];
}

- (void)mc_centerAtXQuarter
{
    double xPos = round((self.superview.bounds.size.width / 4.0f) - (self.bounds.size.width / 2.0f));
    [self mc_positionAtX:xPos];
}

- (void)mc_centerAtX3Quarter
{
    [self mc_centerAtXQuarter];
    double xPos = round((self.superview.bounds.size.width / 2.0f) + self.bounds.origin.x);
    [self mc_positionAtX:xPos];
}

- (void)mc_positionAbove:(UIView *)view
{
    [self mc_positionAbove:view withSpacing:0.0f];
}

- (void)mc_positionAbove:(UIView *)view withSpacing:(CGFloat)spacing
{
    CGFloat offset = self.bounds.size.height;
    CGFloat origin = view.frame.origin.y;
    CGRect frame = self.frame;
    frame.origin.y = origin - offset - spacing;
    self.frame = frame;
}

- (void)mc_positionBelow:(UIView *)view
{
    [self mc_positionBelow:view withSpacing:0.0f];
}

- (void)mc_positionBelow:(UIView *)view withSpacing:(CGFloat)spacing
{
    CGFloat offset = view.bounds.size.height;
    CGFloat origin = view.frame.origin.y;
    CGRect frame = self.frame;
    frame.origin.y = origin + offset + spacing;
    self.frame = frame;
}

- (void)mc_positionLeft:(UIView *)view
{
    [self mc_positionLeft:view withSpacing:0.0f];
}

- (void)mc_positionLeft:(UIView *)view withSpacing:(CGFloat)spacing
{
    CGFloat offset = self.bounds.size.width;
    CGFloat origin = view.frame.origin.x;
    CGRect frame = self.frame;
    frame.origin.x = origin - offset - spacing;
    self.frame = frame;
}

- (void)mc_positionRight:(UIView *)view
{
    [self mc_positionRight:view withSpacing:0.0f];
}

- (void)mc_positionRight:(UIView *)view withSpacing:(CGFloat)spacing
{
    CGFloat offset = view.bounds.size.width;
    CGFloat origin = view.frame.origin.x;
    CGRect frame = self.frame;
    frame.origin.x = origin + offset + spacing;
    self.frame = frame;
}

- (void)mc_alignTop:(UIView *)view
{
    [self mc_alignTop:view withOffset:0.0f];
}

- (void)mc_alignTop:(UIView *)view withOffset:(CGFloat)offset
{
    CGFloat origin = view.frame.origin.y;
    CGRect frame = self.frame;
    frame.origin.y = origin + offset;
    self.frame = frame;
}

- (void)mc_alignBottom:(UIView *)view
{
    [self mc_alignBottom:view withOffset:0.0f];
}

- (void)mc_alignBottom:(UIView *)view withOffset:(CGFloat)offset
{
    CGFloat bottom = view.frame.origin.y + view.frame.size.height;
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height + offset;
    self.frame = frame;
}

- (void)mc_alignLeft:(UIView *)view
{
    [self mc_alignLeft:view withOffset:0.0f];
}

- (void)mc_alignLeft:(UIView *)view withOffset:(CGFloat)offset
{
    CGFloat origin = view.frame.origin.x;
    CGRect frame = self.frame;
    frame.origin.x = origin + offset;
    self.frame = frame;
}

- (void)mc_alignRight:(UIView*)view
{
    [self mc_alignRight:view withOffset:0.0f];
}

- (void)mc_alignRight:(UIView *)view withOffset:(CGFloat)offset
{
    CGFloat right = view.frame.origin.x + view.frame.size.width;
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width + offset;
    self.frame = frame;
}

- (void)mc_centerX:(UIView *)view
{
    [self mc_centerX:view withOffset:0.0f];
}

- (void)mc_centerX:(UIView *)view withOffset:(CGFloat)offset
{
    CGFloat x = view.center.x;
    CGPoint center = self.center;
    center.x = x + offset;
    self.center = center;
}

- (void)mc_centerY:(UIView*)view
{
    [self mc_centerY:view withOffset:0.0f];
}

- (void)mc_centerY:(UIView *)view withOffset:(CGFloat)offset
{
    CGRect viewFrame = view.frame;
    CGFloat y = viewFrame.origin.y + viewFrame.size.height/2.0f;
    CGRect frame = self.frame;
    frame.origin.y = y - self.mc_height/2.0f;
    frame.origin.y += offset;
    self.frame = frame;
}

- (void)mc_centerInView:(UIView *)view
{
    [self mc_centerX:view];
    [self mc_centerY:view];
}

- (void)mc_alignRightOfSuperView
{
    [self mc_alignRightOfSuperViewWithOffset:0.0f];
}

- (void)mc_alignRightOfSuperViewWithOffset:(CGFloat)offset
{
    if(!self.superview) return;
    [self mc_positionAtX:self.superview.mc_width - self.mc_width - offset];
}


- (void)mc_alignLeftOfSuperView
{
    [self mc_alignLeftOfSuperViewWithOffset:0.0f];
}

- (void)mc_alignLeftOfSuperViewWithOffset:(CGFloat)offset
{
    if(!self.superview) return;
    [self mc_positionAtX:offset];
}

- (void)mc_alignTopOfSuperView
{
    [self mc_alignTopOfSuperViewWithOffset:0.0f];
}

- (void)mc_alignTopOfSuperViewWithOffset:(CGFloat)offset
{
    if(!self.superview) return;
    [self mc_positionAtY:offset];
    
}

- (void)mc_alignBottomOfSuperView
{
    [self mc_alignBottomOfSuperViewWithOffset:0.0f];
}

- (void)mc_alignBottomOfSuperViewWithOffset:(CGFloat)offset
{
    if(!self.superview) return;
    [self mc_positionAtY:self.superview.mc_height - self.mc_height - offset];
}


@end
