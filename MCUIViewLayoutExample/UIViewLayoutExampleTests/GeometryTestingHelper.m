//
//  RectHelper.m
//  MCDynamicLayoutExample
//
//  Created by Mathieu Baron on 05/16/13.
//  Copyright (c) 2013 Marc Lefrancois. All rights reserved.
//

#import "GeometryTestingHelper.h"

BOOL rectEquals(CGFloat expectedX, CGFloat expectedY, CGFloat expectedWidth, CGFloat expectedHeight, CGRect rectToValidate)
{
    CGRect expectedRect = CGRectMake(expectedX, expectedY, expectedWidth, expectedHeight);
    if (!CGRectEqualToRect(expectedRect, rectToValidate))
    {
        NSLog(@"expected: %@ actual: %@", NSStringFromCGRect(expectedRect), NSStringFromCGRect(rectToValidate));
        return NO;
    }
    return YES;
}

BOOL sizeEquals(CGFloat expectedWidth, CGFloat expectedHeight, CGSize sizeToValidate)
{
    CGSize expectedSize = CGSizeMake(expectedWidth, expectedHeight);
    if (!CGSizeEqualToSize(expectedSize, sizeToValidate))
    {
        NSLog(@"expected: %@ actual: %@", NSStringFromCGSize(expectedSize), NSStringFromCGSize(sizeToValidate));
        return NO;
    }
    return YES;
}

BOOL pointEquals(CGFloat expectedX, CGFloat expectedY, CGPoint pointToValidate)
{
    CGPoint expectedPoint = CGPointMake(expectedX, expectedY);
    if (!CGPointEqualToPoint(expectedPoint, pointToValidate))
    {
        NSLog(@"expected: %@ actual: %@", NSStringFromCGPoint(expectedPoint), NSStringFromCGPoint(pointToValidate));
        return NO;
    }
    return YES;
}
