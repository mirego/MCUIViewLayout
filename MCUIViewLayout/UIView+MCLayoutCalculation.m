// Copyright (c) 2015, Mirego
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

#import "UIView+MCLayoutCalculation.h"

@implementation UIView (MCLayoutCalculation)

- (CGRect)mc_getRectForPosition:(MCViewPosition)position {
    return [self mc_getRectForPosition:position withMargins:UIEdgeInsetsZero size:self.frame.size];
}

- (CGRect)mc_getRectForPosition:(MCViewPosition)position withMargins:(UIEdgeInsets)margins {
    return [self mc_getRectForPosition:position withMargins:margins size:self.frame.size];
}

- (CGRect)mc_getRectForPosition:(MCViewPosition)position withMargins:(UIEdgeInsets)margins size:(CGSize)size {
    return [self mc_getRectForPosition:position inView:self.superview withMargins:margins size:size];
}

- (CGRect)mc_getRectForPosition:(MCViewPosition)position inView:(UIView *)view {
    return [self mc_getRectForPosition:position inView:view withMargins:UIEdgeInsetsZero size:self.frame.size];
}

- (CGRect)mc_getRectForPosition:(MCViewPosition)position inView:(UIView *)view withMargins:(UIEdgeInsets)margins {
    return [self mc_getRectForPosition:position inView:view withMargins:margins size:self.frame.size];
}

- (CGRect)mc_getRectForPosition:(MCViewPosition)position inView:(UIView *)view withMargins:(UIEdgeInsets)margins size:(CGSize)size {
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
        NSAssert(false, @"can only set position for a sibling or the superview");
    }

    if (position & MCViewPositionFitParentWidth) {
        MCViewPosition adjustedPosition = (position & ~MCViewPositionFitParentWidth);
        CGRect rect = [MCUIViewLayoutPosition positionRect:viewFrame atPosition:adjustedPosition inRect:targetFrame withMargins:margins];
        CGRect rect2 = [MCUIViewLayoutPosition positionRect:viewFrame atPosition:MCViewPositionFitWidth inRect:CGRectMake(0.0f, 0.0f, self.superview.bounds.size.width, self.superview.bounds.size.height) withMargins:margins];
        rect.size = rect2.size;
        rect.origin.x = rect2.origin.x;
        return rect;
    } else if (position & MCViewPositionFitParentHeight) {
        MCViewPosition adjustedPosition = (position & ~MCViewPositionFitParentHeight);
        CGRect rect = [MCUIViewLayoutPosition positionRect:viewFrame atPosition:adjustedPosition inRect:targetFrame withMargins:margins];
        CGRect rect2 = [MCUIViewLayoutPosition positionRect:viewFrame atPosition:MCViewPositionFitHeight inRect:CGRectMake(0.0f, 0.0f, self.superview.bounds.size.width, self.superview.bounds.size.height) withMargins:margins];
        rect.size = rect2.size;
        rect.origin.y = rect2.origin.y;
        return rect;
    } else if (position & MCViewPositionHCenterInParent) {
        MCViewPosition adjustedPosition = (position & ~MCViewPositionHCenterInParent);
        CGRect rect = [MCUIViewLayoutPosition positionRect:viewFrame atPosition:adjustedPosition inRect:targetFrame withMargins:margins];
        CGRect rect2 = [MCUIViewLayoutPosition positionRect:viewFrame atPosition:MCViewPositionHorizontalCenter inRect:CGRectMake(0.0f, 0.0f, self.superview.bounds.size.width, self.superview.bounds.size.height) withMargins:margins];
        rect.origin.x = rect2.origin.x;
        return rect;
    } else if (position & MCViewPositionVCenterInParent) {
        MCViewPosition adjustedPosition = (position & ~MCViewPositionVCenterInParent);
        CGRect rect = [MCUIViewLayoutPosition positionRect:viewFrame atPosition:adjustedPosition inRect:targetFrame withMargins:margins];
        CGRect rect2 = [MCUIViewLayoutPosition positionRect:viewFrame atPosition:MCViewPositionVerticalCenter inRect:CGRectMake(0.0f, 0.0f, self.superview.bounds.size.width, self.superview.bounds.size.height) withMargins:margins];
        rect.origin.y = rect2.origin.y;
        return rect;
    } else {
        return [MCUIViewLayoutPosition positionRect:viewFrame atPosition:position inRect:targetFrame withMargins:margins];
    }
}

- (CGRect)mc_getRectForRelativePosition:(MCViewPosition)position toView:(UIView *)view {
    return [self mc_getRectForRelativePosition:position toView:view withMargins:UIEdgeInsetsZero size:self.frame.size];
}

- (CGRect)mc_getRectForRelativePosition:(MCViewPosition)position toView:(UIView *)view withMargins:(UIEdgeInsets)margins {
    return [self mc_getRectForRelativePosition:position toView:view withMargins:margins size:self.frame.size];
}

- (CGRect)mc_getRectForRelativePosition:(MCViewPosition)position toView:(UIView *)view withMargins:(UIEdgeInsets)margins size:(CGSize)size {

    // This is mainly here for backward compatibility. Can't see why we allowed layouting 2 views that are not siblings...
    if (position < MCViewPositionFitParentHeight) {
        CGRect viewFrame = self.frame;
        viewFrame.size = size;

        CGRect targetFrame = view.frame;
        if (self.superview != view.superview) {
            targetFrame.origin = [view.superview convertPoint:targetFrame.origin toView:self.superview];
        }
        return [MCUIViewLayoutPosition positionRect:viewFrame atPosition:position inRect:targetFrame withMargins:margins];
    } else {
        return [self mc_getRectForPosition:position inView:view withMargins:margins size:size];
    }
}

@end
