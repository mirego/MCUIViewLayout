//
//  MCUIViewLayoutPositionTest.m
//  UIViewLayoutExample
//
//  Created by Mathieu Baron on 05/17/13.
//  Copyright (c) 2013 Mirego, Inc. All rights reserved.
//

#import "MCUIViewLayoutPositionTest.h"
#import "RectHelper.h"
#import "MCUIViewLayoutPosition.h"

@implementation MCUIViewLayoutPositionTest

- (void) testTopLeftInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionTopLeft inRect:CGRectMake(100, 100, 100, 100) withMargin:UIEdgeInsetsZero ];

    STAssertTrue(rectEquals(0.0f, 0.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testTopRightInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionTopRight inRect:CGRectMake(100, 100, 100, 100) withMargin:UIEdgeInsetsZero ];

    STAssertTrue(rectEquals(80.0f, 0.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testBottomLeftInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionBottomLeft inRect:CGRectMake(100, 100, 100, 100) withMargin:UIEdgeInsetsZero ];

    STAssertTrue(rectEquals(0.0f, 80.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testBottomRightInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionBottomRight inRect:CGRectMake(100, 100, 100, 100) withMargin:UIEdgeInsetsZero ];

    STAssertTrue(rectEquals(80.0f, 80.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testTopInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionTop inRect:CGRectMake(100, 100, 100, 100) withMargin:UIEdgeInsetsZero ];

    STAssertTrue(rectEquals(40.0f, 0.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testBottomInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionBottom inRect:CGRectMake(100, 100, 100, 100) withMargin:UIEdgeInsetsZero ];

    STAssertTrue(rectEquals(40.0f, 80.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testCenterLeftInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionCenterLeft inRect:CGRectMake(100, 100, 100, 100) withMargin:UIEdgeInsetsZero ];

    STAssertTrue(rectEquals(0.0f, 40.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testCenterRightInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionCenterRight inRect:CGRectMake(100, 100, 100, 100) withMargin:UIEdgeInsetsZero ];

    STAssertTrue(rectEquals(80.0f, 40.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testCenterInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionCenter inRect:CGRectMake(100, 100, 100, 100) withMargin:UIEdgeInsetsZero ];

    STAssertTrue(rectEquals(40.0f, 40.0f, 20.0f, 20.0f, rect), @"");
}

@end
