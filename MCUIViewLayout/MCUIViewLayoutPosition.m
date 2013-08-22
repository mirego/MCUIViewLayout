//
// Created by Mathieu Baron on 2013-05-17.
// Copyright (c) 2013 Mirego, Inc. All rights reserved.
//
#import "MCUIViewLayoutPosition.h"

@implementation MCUIViewLayoutPosition 
+ (CGRect)positionRect:(CGRect)rect atPosition:(MCViewPosition)position inRect:(CGRect)targetRect withMargins:(UIEdgeInsets const)margins {
    rect.origin = [self originForPosition:position andInset:margins size:rect.size inRect:targetRect initialRectOrigin:rect.origin];
    rect.size = [self sizeForPosition:position andInset:margins initialSize:rect.size inRect:targetRect];
    return rect;
}

+ (CGSize)sizeForPosition:(MCViewPosition)position andInset:(UIEdgeInsets)inset initialSize:(CGSize)size inRect:(CGRect)rect
{
    CGSize result = size;
    result.width = [self roundFloatIfRequired:[self widthForPosition:position andInset:inset initialSize:size inRect:rect]];
    result.height = [self roundFloatIfRequired:[self heightForPosition:position andInset:inset initialSize:size inRect:rect]];
    return result;
}

+ (CGFloat)heightForPosition:(MCViewPosition)position andInset:(UIEdgeInsets)inset initialSize:(CGSize)size inRect:(CGRect)rect
{
    CGFloat actualHeight = size.height;
    BOOL fitHeight = (position & MCViewPositionFitHeight) != 0;
    if (fitHeight) {
        actualHeight = CGRectGetHeight(rect) - inset.top - inset.bottom;
    }
    return actualHeight;
}

+ (CGFloat)widthForPosition:(MCViewPosition)position andInset:(UIEdgeInsets)inset initialSize:(CGSize)size inRect:(CGRect)rect
{
    CGFloat actualWidth = size.width;
    BOOL fitWidth = (position & MCViewPositionFitWidth) != 0;
    if (fitWidth) {
        actualWidth = CGRectGetWidth(rect) - inset.left - inset.right;
    }
    return actualWidth;
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
    CGSize sizeForPositioning = size;


    BOOL fitWidth = (position & MCViewPositionFitWidth) != 0;
    if (fitWidth) {
        sizeForPositioning.width = CGRectGetWidth(targetRect) - inset.left - inset.right;
    }

    int matchingPositionCount = 0;

    if((position & MCViewPositionToTheLeft) != 0) {
        CGFloat relativeMinX = CGRectGetMinX(targetRect);
        xPosition = relativeMinX - sizeForPositioning.width - inset.right;
        matchingPositionCount++;
    }

    if((position & MCViewPositionLeft) != 0) {
        xPosition = targetRect.origin.x + inset.left;
        matchingPositionCount++;
    }

    if((position & MCViewPositionHorizontalCenter) != 0) {
        if (fitWidth) {
            xPosition = targetRect.origin.x + inset.left;
        } else {
            xPosition = targetRect.origin.x + ((CGRectGetWidth(targetRect) - sizeForPositioning.width) * 0.5f);
            xPosition += inset.left;
            xPosition -= inset.right;
        }

        matchingPositionCount++;
    }

    if((position & MCViewPositionRight) != 0 ) {
        xPosition = targetRect.origin.x + CGRectGetWidth(targetRect) - sizeForPositioning.width - inset.right;
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
    CGSize sizeForPositioning = size;

    BOOL fitHeight = (position & MCViewPositionFitHeight) != 0;
    if (fitHeight) {
        sizeForPositioning.height = CGRectGetHeight(targetRect) - inset.top - inset.bottom;
    }

    int matchingPositionCount = 0;

    if((position & MCViewPositionAbove) != 0) {
        CGFloat relativeTop = CGRectGetMinY(targetRect);
        yPosition = relativeTop - inset.bottom - sizeForPositioning.height;
        matchingPositionCount++;
    }

    if((position & MCViewPositionTop) != 0) {
        yPosition = targetRect.origin.y + inset.top;
        matchingPositionCount++;
    }

    if((position & MCViewPositionVerticalCenter) != 0) {
        if (fitHeight) {
            yPosition = targetRect.origin.y + inset.top;
        }
        else {
            yPosition = targetRect.origin.y + (CGRectGetHeight(targetRect) - sizeForPositioning.height) * 0.5f;
            yPosition += inset.top;
            yPosition -= inset.bottom;
        }

        matchingPositionCount++;
    }

    if((position & MCViewPositionBottom) != 0) {
        yPosition = targetRect.origin.y + CGRectGetHeight(targetRect) - sizeForPositioning.height - inset.bottom;
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

+ (CGRect)relativePositionRect:(CGRect)rect atPosition:(MCViewPosition)position inRect:(CGRect)targetRect withMargins:(UIEdgeInsets)margins {
    return [self positionRect:rect atPosition:position inRect:targetRect withMargins:margins];
}

@end