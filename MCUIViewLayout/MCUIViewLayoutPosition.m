//
// Created by Mathieu Baron on 2013-05-17.
// Copyright (c) 2013 Mirego, Inc. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
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

    if((position & MCViewPositionLeft) != 0) {
        xPosition = targetRect.origin.x + inset.left;
        matchingPositionCount++;
    }

    if((position & MCViewPositionRight) != 0 ) {
        xPosition = targetRect.origin.x + CGRectGetWidth(targetRect) - size.width - inset.right;
        matchingPositionCount++;
    }

    if((position & MCViewPositionHCenter) != 0) {
        xPosition = targetRect.origin.x + ((CGRectGetWidth(targetRect) - size.width) * 0.5f);
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

    if((position & MCViewPositionTop) != 0) {
        yPosition = targetRect.origin.y + inset.top;
        matchingPositionCount++;
    }

    if((position & MCViewPositionBottom) != 0) {
        yPosition = targetRect.origin.y + CGRectGetHeight(targetRect) - size.height - inset.bottom;
        matchingPositionCount++;
    }

    if((position & MCViewPositionVCenter) != 0) {
        yPosition = targetRect.origin.y + (CGRectGetHeight(targetRect) - size.height) * 0.5f;
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
    rect.origin = [self originForRelativePosition:position andInset:margins size:rect.size targetRect:targetRect];
    return rect;
}

+ (CGPoint)originForRelativePosition:(MCViewRelativePosition)position andInset:(UIEdgeInsets)inset size:(CGSize)size
                              targetRect:(CGRect) targetRect {
    CGPoint viewPosition = CGPointZero;
    viewPosition.x = [self roundFloatIfRequired:[self relativeXOriginForPosition:position relativeTo:targetRect andInset:inset size:size]];
    viewPosition.y = [self roundFloatIfRequired:[self relativeYOriginForPosition:position relativeTo:targetRect andInset:inset size:size]];
    return viewPosition;
}

+ (CGFloat)relativeXOriginForPosition:(MCViewRelativePosition)position relativeTo:(CGRect)relativeRect andInset:(UIEdgeInsets)inset
                                 size:(CGSize)size {

    CGFloat xPosition = 0.0f;

    switch (position) {
        case MCViewRelativePositionAboveAlignedLeft:
        case MCViewRelativePositionUnderAlignedLeft: {
            xPosition = CGRectGetMinX(relativeRect) + inset.left;
            break;
        }
        case MCViewRelativePositionAboveCentered:
        case MCViewRelativePositionUnderCentered: {
            CGFloat relativeMidPoint = CGRectGetMidX(relativeRect);
            xPosition = relativeMidPoint - size.width * 0.5f;
            break;
        }

        case MCViewRelativePositionAboveAlignedRight:
        case MCViewRelativePositionUnderAlignedRight: {
            xPosition = CGRectGetMaxX(relativeRect) - inset.right - size.width;
            break;
        }
        case MCViewRelativePositionToTheLeftCentered:
        case MCViewRelativePositionToTheLeftAlignedBottom:
        case MCViewRelativePositionToTheLeftAlignedTop: {
            CGFloat relativeMinX = CGRectGetMinX(relativeRect);
            xPosition = relativeMinX - size.width - inset.right;
            break;
        }
        case MCViewRelativePositionToTheRightAlignedTop:
        case MCViewRelativePositionToTheRightCentered:
        case MCViewRelativePositionToTheRightAlignedBottom: {
            CGFloat relativeMaxX = CGRectGetMaxX(relativeRect);
            xPosition = relativeMaxX + inset.left;
            break;
        }
    }

    return xPosition;
}

+ (CGFloat)relativeYOriginForPosition:(MCViewRelativePosition)position relativeTo:(CGRect)relativeRect
                             andInset:(UIEdgeInsets)inset size:(CGSize)size {
    CGFloat yPosition = 0.0f;
    switch (position) {
        case MCViewRelativePositionAboveAlignedLeft:
        case MCViewRelativePositionAboveCentered:
        case MCViewRelativePositionAboveAlignedRight:{
            CGFloat relativeTop = CGRectGetMinY(relativeRect);
            yPosition = relativeTop - inset.bottom - size.height;
            break;
        }
        case MCViewRelativePositionUnderAlignedLeft:
        case MCViewRelativePositionUnderCentered:
        case MCViewRelativePositionUnderAlignedRight:{
            CGFloat relativeBaseline = CGRectGetMaxY(relativeRect);
            yPosition = relativeBaseline + inset.top;
            break;
        }

        case MCViewRelativePositionToTheLeftCentered:
        case MCViewRelativePositionToTheRightCentered: {
            CGFloat relativeMidPoint = CGRectGetMidY(relativeRect);
            yPosition = relativeMidPoint - size.height * 0.5f;
            break;
        }

        case MCViewRelativePositionToTheRightAlignedTop:
        case MCViewRelativePositionToTheLeftAlignedTop: {
            yPosition = CGRectGetMinY(relativeRect) + inset.top;
            break;
        }

        case MCViewRelativePositionToTheRightAlignedBottom:
        case MCViewRelativePositionToTheLeftAlignedBottom: {
            yPosition = CGRectGetMaxY(relativeRect) - inset.bottom - size.height;
            break;
        }
    }

    return yPosition;
}

@end