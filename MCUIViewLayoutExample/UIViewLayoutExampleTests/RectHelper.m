//
//  RectHelper.m
//  MCDynamicLayoutExample
//
//  Created by Mathieu Baron on 05/16/13.
//  Copyright (c) 2013 Marc Lefrancois. All rights reserved.
//

#import "RectHelper.h"

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
