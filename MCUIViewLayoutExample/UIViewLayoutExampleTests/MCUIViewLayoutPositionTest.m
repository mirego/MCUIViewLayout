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
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionTop | MCViewPositionLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(0.0f, 0.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testTopLeftInRectWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionTop | MCViewPositionLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(5.0f, 5.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testTopRightInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionTop | MCViewPositionRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(80.0f, 0.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testTopRightInRectWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionTop | MCViewPositionRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(75.0f, 5.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testBottomLeftInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionBottom | MCViewPositionLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(0.0f, 80.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testBottomLeftInRectWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionBottom | MCViewPositionLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(5.0f, 75.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testBottomRightInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionBottom | MCViewPositionRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(80.0f, 80.0f, 20.0f, 20.0f, rect), @"");
}
- (void) testBottomRightInRectWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionBottom | MCViewPositionRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(75.0f, 75.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testTopInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionTop inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(40.0f, 0.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testTopInRectWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionTop inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(40.0f, 5.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testBottomInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionBottom inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(40.0f, 80.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testBottomInRectWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionBottom inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(40.0f, 75.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testCenterLeftInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionCenterLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(0.0f, 40.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testCenterLeftInRectWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionCenterLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(5.0f, 40.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testCenterRightInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionCenterRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(80.0f, 40.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testCenterRightInRectWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionCenterRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(75.0f, 40.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testCenterInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionCenter inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(40.0f, 40.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testCenterInRectWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionCenter inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(40.0f, 40.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testViewRelativePositionAboveAlignedLeft {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionAboveAlignedLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(100.0f, 90.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionAboveAlignedLeftWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionAboveAlignedLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(105.0f, 85.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionAboveCentered {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionAboveCentered inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(145.0f, 90.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionAboveCenteredWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionAboveCentered inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(145.0f, 85.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionAboveAlignedRight {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionAboveAlignedRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(190.0f, 90.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionAboveAlignedRightWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionAboveAlignedRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(185.0f, 85.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheRightAlignedTop {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheRightAlignedTop inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(200.0f, 100.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheRightAlignedTopWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheRightAlignedTop inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(205.0f, 105.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheRightCentered {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheRightCentered inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(200.0f, 145.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheRightCenteredWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheRightCentered inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(205.0f, 145.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheRightAlignedBottom {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheRightAlignedBottom inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(200.0f, 190.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheRightAlignedBottomWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheRightAlignedBottom inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(205.0f, 185.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheLeftAlignedTop {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheLeftAlignedTop inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(90.0f, 100.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheLeftAlignedTopWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheLeftAlignedTop inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(85.0f, 105.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheLeftCentered {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheLeftCentered inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(90.0f, 145.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheLeftCenteredWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheLeftCentered inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(85.0f, 145.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheLeftAlignedBottom {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheLeftAlignedBottom inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(90.0f, 190.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheLeftAlignedBottomWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheLeftAlignedBottom inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(85.0f, 185.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionUnderAlignedLeft {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionUnderAlignedLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(100.0f, 200.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionUnderAlignedLeftWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionUnderAlignedLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(105.0f, 205.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionUnderCentered {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionUnderCentered inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(145.0f, 200.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionUnderCenteredWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionUnderCentered inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(145.0f, 205.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionUnderAlignedRight {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionUnderAlignedRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    STAssertTrue(rectEquals(190.0f, 200.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionUnderAlignedRightWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionUnderAlignedRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    STAssertTrue(rectEquals(185.0f, 205.0f, 10.0f, 10.0f, rect), @"");
}

@end
