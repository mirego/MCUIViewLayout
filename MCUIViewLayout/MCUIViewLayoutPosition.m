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
#import "MCUIViewLayoutPosition.h"

@implementation MCUIViewLayoutPosition 
CGFloat (^_ceilFloatToDisplayScale)(CGFloat x);
CGFloat (^_floorFloatToDisplayScale)(CGFloat x);

+ (void)load {
    CGFloat displayScale = [UIScreen mainScreen].scale;
    CGFloat displayScaleInv = 1.0f / displayScale;
    
    if (displayScale > 1.0f) {
        _ceilFloatToDisplayScale = ^(CGFloat x) {
            return ceilf(x * displayScale) * displayScaleInv;
        };
        _floorFloatToDisplayScale = ^(CGFloat x) {
            return floorf(x * displayScale) * displayScaleInv;
        };
    } else {
        _ceilFloatToDisplayScale = ^(CGFloat x) {
            return (CGFloat)ceilf(x);
        };
        _floorFloatToDisplayScale = ^(CGFloat x) {
            return (CGFloat)floorf(x);
        };
    }
}

+ (CGRect)positionRect:(CGRect)rect atPosition:(MCViewPosition)position inRect:(CGRect)targetRect withMargins:(UIEdgeInsets const)margins {
    rect.size = [self sizeForPosition:position andInset:margins initialSize:rect.size inRect:targetRect];
    rect.origin = [self originForPosition:position andInset:margins size:rect.size inRect:targetRect initialRectOrigin:rect.origin];
    return rect;
}

+ (CGSize)sizeForPosition:(MCViewPosition)position andInset:(UIEdgeInsets)inset initialSize:(CGSize)size inRect:(CGRect)rect
{
    CGSize result = size;
    result.width = _ceilFloatToDisplayScale([self widthForPosition:position andInset:inset initialSize:size inRect:rect]);
    result.height = _ceilFloatToDisplayScale([self heightForPosition:position andInset:inset initialSize:size inRect:rect]);
    return result;
}

+ (CGFloat)heightForPosition:(MCViewPosition)position andInset:(UIEdgeInsets)inset initialSize:(CGSize)size inRect:(CGRect)rect
{
    CGFloat actualHeight = size.height;
    if (position & MCViewPositionFitHeight) {
        actualHeight = CGRectGetHeight(rect) - inset.top - inset.bottom;
    }
    return actualHeight;
}

+ (CGFloat)widthForPosition:(MCViewPosition)position andInset:(UIEdgeInsets)inset initialSize:(CGSize)size inRect:(CGRect)rect
{
    CGFloat actualWidth = size.width;
    if (position & MCViewPositionFitWidth) {
        actualWidth = CGRectGetWidth(rect) - inset.left - inset.right;
    }
    return actualWidth;
}

+ (CGPoint)originForPosition:(MCViewPosition)position andInset:(UIEdgeInsets)inset size:(CGSize)size inRect:(CGRect)targetRect initialRectOrigin:(CGPoint)initialRectOrigin{
    CGPoint origin = CGPointZero;

    if ((position & MCViewPositionLeft) || (position & MCViewPositionToTheRight)){
        origin.x = _floorFloatToDisplayScale([self xOriginForPosition:position andInset:inset size:size inRect:targetRect defaultX:initialRectOrigin.x]);
    }
    else {
        origin.x = _ceilFloatToDisplayScale([self xOriginForPosition:position andInset:inset size:size inRect:targetRect defaultX:initialRectOrigin.x]);
    }

    if ((position & MCViewPositionTop) || (position & MCViewPositionUnder)) {
        origin.y = _floorFloatToDisplayScale([self yOriginForPosition:position andInset:inset size:size inRect:targetRect defaultY:initialRectOrigin.y]);
    }
    else {
        origin.y = _ceilFloatToDisplayScale([self yOriginForPosition:position andInset:inset size:size inRect:targetRect defaultY:initialRectOrigin.y]);
    }

    return origin;
}


+ (CGFloat)xOriginForPosition:(MCViewPosition)position andInset:(UIEdgeInsets)inset size:(CGSize)size
                       inRect:(CGRect)targetRect defaultX:(CGFloat)defaultX {
    CGFloat xPosition = defaultX;
    CGSize sizeForPositioning = size;

    if (position & MCViewPositionFitWidth) {
        xPosition = targetRect.origin.x + inset.left;
    }
    else {
        int matchingPositionCount = 0;

        if(position & MCViewPositionToTheLeft) {
            CGFloat relativeMinX = CGRectGetMinX(targetRect);
            xPosition = relativeMinX - sizeForPositioning.width - inset.right;
            matchingPositionCount++;
        }

        if(position & MCViewPositionLeft) {
            xPosition = targetRect.origin.x + inset.left;
            matchingPositionCount++;
        }

        if(position & MCViewPositionHorizontalCenter) {
            xPosition = targetRect.origin.x + ((CGRectGetWidth(targetRect) - sizeForPositioning.width) * 0.5f);
            xPosition += inset.left;
            xPosition -= inset.right;
            matchingPositionCount++;
        }

        if(position & MCViewPositionRight) {
            xPosition = targetRect.origin.x + CGRectGetWidth(targetRect) - sizeForPositioning.width - inset.right;
            matchingPositionCount++;
        }

        if(position & MCViewPositionToTheRight) {
            CGFloat relativeMaxX = CGRectGetMaxX(targetRect);
            xPosition = relativeMaxX + inset.left;
            matchingPositionCount++;
        }

        if (matchingPositionCount > 1) {
            NSAssert(NO, @"Positions not handled");
        }
    }

    return xPosition;
}

+ (CGFloat)yOriginForPosition:(MCViewPosition)position andInset:(UIEdgeInsets)inset size:(CGSize)size
        inRect:(CGRect)targetRect defaultY:(CGFloat)defaultY {
    CGFloat yPosition = defaultY;
    CGSize sizeForPositioning = size;

    if (position & MCViewPositionFitHeight) {
        yPosition = targetRect.origin.y + inset.top;
    }
    else {
        int matchingPositionCount = 0;

        if(position & MCViewPositionAbove) {
            CGFloat relativeTop = CGRectGetMinY(targetRect);
            yPosition = relativeTop - inset.bottom - sizeForPositioning.height;
            matchingPositionCount++;
        }

        if(position & MCViewPositionTop) {
            yPosition = targetRect.origin.y + inset.top;
            matchingPositionCount++;
        }

        if(position & MCViewPositionVerticalCenter) {
            yPosition = targetRect.origin.y + (CGRectGetHeight(targetRect) - sizeForPositioning.height) * 0.5f;
            yPosition += inset.top;
            yPosition -= inset.bottom;
            matchingPositionCount++;
        }

        if(position & MCViewPositionBottom) {
            yPosition = targetRect.origin.y + CGRectGetHeight(targetRect) - sizeForPositioning.height - inset.bottom;
            matchingPositionCount++;
        }

        if(position & MCViewPositionUnder) {
            CGFloat relativeBaseline = CGRectGetMaxY(targetRect);
            yPosition = relativeBaseline + inset.top;
            matchingPositionCount++;
        }

        if (matchingPositionCount > 1) {
            NSAssert(NO, @"Positions not handled");
        }
    }

    return yPosition;
}

+ (CGFloat)ceilFloatToDisplayScale:(CGFloat)number {
    return _ceilFloatToDisplayScale(number);
}

+ (CGFloat)floorFloatToDisplayScale:(CGFloat)number {
    return _floorFloatToDisplayScale(number);
}

+ (CGRect)relativePositionRect:(CGRect)rect atPosition:(MCViewPosition)position inRect:(CGRect)targetRect withMargins:(UIEdgeInsets)margins {
    return [self positionRect:rect atPosition:position inRect:targetRect withMargins:margins];
}

@end