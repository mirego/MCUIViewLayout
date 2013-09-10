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
#import "UIView+MCLayout.h"

@implementation UIView (MCLayout)
- (CGFloat)mc_width
{
	return CGRectGetWidth(self.bounds);
}

- (void)mc_setWidth:(CGFloat)value
{
	CGRect frame = [self frame];
	frame.size.width = ceilf(value);
	[self setFrame:frame];
}

- (CGFloat)mc_height
{
	return CGRectGetHeight(self.bounds);
}

- (void)mc_setHeight:(CGFloat)value
{
	CGRect frame = [self frame];
	frame.size.height = ceilf(value);
	[self setFrame:frame];
}

- (void)mc_setSize:(CGSize)size
{
	CGRect frame = [self frame];
	frame.size.width = ceilf(size.width);
	frame.size.height = ceilf(size.height);
	[self setFrame:frame];
}

- (CGSize)mc_size
{
	CGRect bounds = [self bounds];
	return bounds.size;
}

- (CGPoint)mc_origin
{
	return self.frame.origin;
}

- (void)mc_setOrigin:(CGPoint)point
{
	CGRect frame = [self frame];
	frame.origin = CGPointMake(roundf(point.x), roundf(point.y));
	[self setFrame:frame];
}

- (CGFloat)mc_xPosition
{
	return [self mc_origin].x;
}

- (CGFloat)mc_yPosition
{
    return [self mc_origin].y;
}

- (void)mc_setPosition:(MCViewPosition)position {
    [self mc_setPosition:position withMargins:UIEdgeInsetsZero];
}

- (void)mc_setPosition:(MCViewPosition)position withMargins:(UIEdgeInsets)margins {
    [self mc_setPosition:position withMargins:margins size:self.frame.size];
}

- (void)mc_setPosition:(MCViewPosition)position withMargins:(UIEdgeInsets)margins size:(CGSize) size {
    [self mc_setPosition:position inView:self.superview withMargins:margins size:size];
}

- (void)mc_setPosition:(MCViewPosition)position inView:(UIView *)view {
    [self mc_setPosition:position inView:view withMargins:UIEdgeInsetsZero];
}

- (void)mc_setPosition:(MCViewPosition)position inView:(UIView *)view withMargins:(UIEdgeInsets)margins {
    [self mc_setPosition:position inView:view withMargins:margins size:self.frame.size];
}

- (void)mc_setPosition:(MCViewPosition)position inView:(UIView *)view withMargins:(UIEdgeInsets)margins size:(CGSize)size {

    CGRect viewFrame = self.frame;
    viewFrame.size = size;


    CGRect targetFrame;
    if (view == self.superview) {
        targetFrame = view.bounds;
    }
    else if (view.superview == self.superview) {
        targetFrame = view.frame;
    }
    else {
        NSAssert(false, @"can only set position for a sibbling or the superview");
    }

    viewFrame = [MCUIViewLayoutPosition positionRect:viewFrame atPosition:position inRect:targetFrame withMargins:margins];

    self.frame = viewFrame;
}

- (void)mc_setRelativePosition:(MCViewPosition)position toView:(UIView *)view
{
    [self mc_setRelativePosition:position toView:view withMargins:UIEdgeInsetsZero];
}

- (void)mc_setRelativePosition:(MCViewPosition)position toView:(UIView *)view withMargins:(UIEdgeInsets)margins {
    [self mc_setRelativePosition:position toView:view withMargins:margins size:self.frame.size];
}

- (void)mc_setRelativePosition:(MCViewPosition)position toView:(UIView *)view withMargins:(UIEdgeInsets)margins size:(CGSize)size {
    CGRect viewFrame = self.frame;
    viewFrame.size = size;

    CGRect targetFrame = view.frame;
    if (self.superview != view.superview) {
        targetFrame.origin = [view.superview convertPoint:targetFrame.origin toView:self.superview];
    }

    viewFrame = [MCUIViewLayoutPosition relativePositionRect:viewFrame atPosition:position inRect:targetFrame withMargins:margins];
    self.frame = viewFrame;
}

@end
