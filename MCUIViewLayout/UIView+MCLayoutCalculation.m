//
//  UIView+MCLayoutCalculation.m
//  UIViewLayoutExample
//
//  Created by Marc Lefrancois on 2015-11-13.
//  Copyright © 2015 Mirego, Inc. All rights reserved.
//

#import "UIView+MCLayoutCalculation.h"

@implementation UIView (MCLayoutCalculation)

- (CGRect)mc_getRectForPosition:(MCViewPosition)position {
    return [self mc_getRectForPosition:position withMargins:UIEdgeInsetsZero size:self.frame.size];
}

- (CGRect)mc_getRectForPosition:(MCViewPosition)position withMargins:(UIEdgeInsets)margins {
    return [self mc_getRectForPosition:position withMargins:margins size:self.frame.size];
}

- (CGRect)mc_getRectForPosition:(MCViewPosition)position withMargins:(UIEdgeInsets)margins size:(CGSize) size {
    return [self mc_getRectForPosition:position inView:self.superview withMargins:margins size:self.frame.size];
}

- (CGRect)mc_getRectForPosition:(MCViewPosition)position inView:(UIView *)view {
    return [self mc_getRectForPosition:position inView:view withMargins:UIEdgeInsetsZero size:self.frame.size];
}

- (CGRect)mc_getRectForPosition:(MCViewPosition)position inView:(UIView *)view withMargins:(UIEdgeInsets)margins {
    return [self mc_getRectForPosition:position inView:view withMargins:margins size:self.frame.size];
}

- (CGRect)mc_getRectForPosition:(MCViewPosition)position inView:(UIView *)view withMargins:(UIEdgeInsets)margins size:(CGSize) size {
    
    CGRect viewFrame = self.frame;
    viewFrame.size = size;
    
    
    CGRect targetFrame;
    if (view == self.superview) {
        targetFrame = CGRectMake(0.0f, 0.0f, view.bounds.size.width, view.bounds.size.height);
    }
    else if (view.superview == self.superview) {
        targetFrame = view.frame;
    }
    else {
        NSAssert(false, @"can only set position for a sibbling or the superview");
    }
    
    return [MCUIViewLayoutPosition positionRect:viewFrame atPosition:position inRect:targetFrame withMargins:margins];
}

- (CGRect)mc_getRectForRelativePosition:(MCViewPosition)position toView:(UIView *)view {
    return [self mc_getRectForRelativePosition:position toView:view withMargins:UIEdgeInsetsZero size:self.frame.size];
}

- (CGRect)mc_getRectForRelativePosition:(MCViewPosition)position toView:(UIView *)view withMargins:(UIEdgeInsets)margins {
    return [self mc_getRectForRelativePosition:position toView:view withMargins:margins size:self.frame.size];
}

- (CGRect)mc_getRectForRelativePosition:(MCViewPosition)position toView:(UIView *)view withMargins:(UIEdgeInsets)margins size:(CGSize) size {
    CGRect viewFrame = self.frame;
    viewFrame.size = size;
    
    CGRect targetFrame = view.frame;
    if (self.superview != view.superview) {
        targetFrame.origin = [view.superview convertPoint:targetFrame.origin toView:self.superview];
    }
    
    return [MCUIViewLayoutPosition relativePositionRect:viewFrame atPosition:position inRect:targetFrame withMargins:margins];
}


@end
