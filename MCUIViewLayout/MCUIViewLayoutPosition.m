//
// Created by Mathieu Baron on 2013-05-17.
// Copyright (c) 2013 Mirego, Inc. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import "MCUIViewLayoutPosition.h"


@implementation MCUIViewLayoutPosition {

}

+ (CGRect)positionRect:(CGRect)rect atPosition:(enum MCViewPosition)position inRect:(CGRect)targetRect withMargins:(UIEdgeInsets const)margins {
    rect.origin = [self originForPosition:position andInset:margins size:rect.size inRect:targetRect initialRectOrigin: rect.origin];
    return rect;
}


+ (CGPoint)originForPosition:(MCViewPosition)position andInset:(UIEdgeInsets)inset size:(CGSize)size inRect:(CGRect)targetRect initialRectOrigin:(CGPoint)initialRectOrigin{
    CGPoint origin = CGPointZero;
    origin.x = [self roundFloatIfRequired:[self xOriginForPosition:position andInset:inset size:size inRect:targetRect defaultX:initialRectOrigin.x]];
    origin.y = [self roundFloatIfRequired:[self yOriginForPosition:position andInset:inset size:size inRect:targetRect defaultY:initialRectOrigin.y]];
    return origin;
}


+ (CGFloat)xOriginForPosition:(MCViewPosition)position andInset:(UIEdgeInsets)inset size:(CGSize)size
                       inRect:(CGRect)targetRect defaultX:(CGFloat)defaultX {
    CGFloat xPosition = defaultX;

    int matchingPositionCount = 0;

    if((position & MCViewPositionToTheLeft) != 0) {
        CGFloat relativeMinX = CGRectGetMinX(targetRect);
        xPosition = relativeMinX - size.width - inset.right;
        matchingPositionCount++;
    }

    if((position & MCViewPositionLeft) != 0) {
        xPosition = targetRect.origin.x + inset.left;
        matchingPositionCount++;
    }

    if((position & MCViewPositionHorizontalCenter) != 0) {
        xPosition = targetRect.origin.x + ((CGRectGetWidth(targetRect) - size.width) * 0.5f);
        matchingPositionCount++;
    }

    if((position & MCViewPositionRight) != 0 ) {
        xPosition = targetRect.origin.x + CGRectGetWidth(targetRect) - size.width - inset.right;
        matchingPositionCount++;
    }

    if((position & MCViewPositionToTheRight) != 0) {
        CGFloat relativeMaxX = CGRectGetMaxX(targetRect);
        xPosition = relativeMaxX + inset.left;
        matchingPositionCount++;
    }

    if (matchingPositionCount > 1) {
        NSAssert(NO, @"Positions not handled");
    }
    
    return xPosition;
}

+ (CGFloat)yOriginForPosition:(MCViewPosition)position andInset:(UIEdgeInsets)inset size:(CGSize)size
        inRect:(CGRect)targetRect defaultY:(CGFloat)defaultY {
    CGFloat yPosition = defaultY;

    int matchingPositionCount = 0;

    if((position & MCViewPositionAbove) != 0) {
        CGFloat relativeTop = CGRectGetMinY(targetRect);
        yPosition = relativeTop - inset.bottom - size.height;
        matchingPositionCount++;
    }

    if((position & MCViewPositionTop) != 0) {
        yPosition = targetRect.origin.y + inset.top;
        matchingPositionCount++;
    }

    if((position & MCViewPositionVerticalCenter) != 0) {
        yPosition = targetRect.origin.y + (CGRectGetHeight(targetRect) - size.height) * 0.5f;
        matchingPositionCount++;
    }

    if((position & MCViewPositionBottom) != 0) {
        yPosition = targetRect.origin.y + CGRectGetHeight(targetRect) - size.height - inset.bottom;
        matchingPositionCount++;
    }

    if((position & MCViewPositionUnder) != 0) {
        CGFloat relativeBaseline = CGRectGetMaxY(targetRect);
        yPosition = relativeBaseline + inset.top;
        matchingPositionCount++;
    }

    if (matchingPositionCount > 1) {
        NSAssert(NO, @"Positions not handled");
    }

    return yPosition;
}

+ (CGFloat)roundFloatIfRequired:(CGFloat)number {
    static BOOL onNonRetina;
    static dispatch_once_t once;
    dispatch_once(&once, ^ {
        onNonRetina = [UIScreen mainScreen].scale <= 1.0000f;
    });

    if (onNonRetina) {
        return roundf(number);
    }
    else {
        return number;
    }
}

+ (CGRect)relativePositionRect:(CGRect)rect atPosition:(MCViewRelativePosition)position inRect:(CGRect)targetRect withMargins:(UIEdgeInsets const)margins {

    switch (position) {
        case MCViewRelativePositionAboveAlignedLeft: {
            position = MCViewPositionAbove | MCViewPositionLeft;
            break;
        }

        case MCViewRelativePositionAboveCentered: {
            position = MCViewPositionAbove | MCViewPositionHorizontalCenter;
            break;
        }

        case MCViewRelativePositionAboveAlignedRight: {
            position = MCViewPositionAbove | MCViewPositionRight;
            break;
        }

        case MCViewRelativePositionToTheRightAlignedTop: {
            position = MCViewPositionTop | MCViewPositionToTheRight;
            break;
        }

        case MCViewRelativePositionToTheRightCentered: {
            position = MCViewPositionVerticalCenter | MCViewPositionToTheRight;
            break;
        }

        case MCViewRelativePositionToTheRightAlignedBottom: {
            position = MCViewPositionToTheRight | MCViewPositionBottom;
            break;
        }

        case MCViewRelativePositionToTheLeftAlignedTop: {
            position = MCViewPositionToTheLeft | MCViewPositionTop;
            break;
        }

        case MCViewRelativePositionToTheLeftCentered: {
            position = MCViewPositionToTheLeft | MCViewPositionVerticalCenter;
            break;
        }

        case MCViewRelativePositionToTheLeftAlignedBottom: {
            position = MCViewPositionToTheLeft | MCViewPositionBottom;
            break;
        }

        case MCViewRelativePositionUnderAlignedLeft: {
            position = MCViewPositionLeft | MCViewPositionUnder;
            break;
        }

        case MCViewRelativePositionUnderCentered: {
            position = MCViewPositionHorizontalCenter | MCViewPositionUnder;
            break;
        }

        case MCViewRelativePositionUnderAlignedRight: {
            position = MCViewPositionRight | MCViewPositionUnder;
            break;
        }
    }

    rect.origin = [self originForPosition:position andInset:margins size:rect.size inRect:targetRect initialRectOrigin: rect.origin];

    return rect;
}

@end