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

#import <XCTest/XCTest.h>
#import "GeometryTestingHelper.h"
#import "MCUIViewLayoutPosition.h"

@interface MCUIViewLayoutPositionTest : XCTestCase
@property(nonatomic) CGFloat displayScale;
@end


@implementation MCUIViewLayoutPositionTest
- (void)setUp
{
    [super setUp];
    self.displayScale = [UIScreen mainScreen].scale;
}

- (void) testLeftInRectNoMargin {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(100.0f, 1000.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testLeftInRectWithMargin {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(99, 5, 99, 99)];

    XCTAssertTrue(rectEquals(105.0f, 1000.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testHCenterInRectNoMargin {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionHorizontalCenter inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(140.0f, 1000.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testHCenterInRectWithMargin {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionHorizontalCenter inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(99, 99, 99, 5)];

    XCTAssertTrue(rectEquals(234.0f, 1000.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testRightInRectNoMargin {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(180.0f, 1000.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testRightInRectWithMargin {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(99, 99, 99, 5)];

    XCTAssertTrue(rectEquals(175.0f, 1000.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testTopInRectNoMargin {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionTop inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(1000.0f, 100.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testTopInRectWithMargin {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionTop inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 99, 99, 99)];

    XCTAssertTrue(rectEquals(1000.0f, 105.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testVCenterInRectNoMargin {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionVerticalCenter inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(1000.0f, 140.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testVCenterInRectWithMargin {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionVerticalCenter inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 99, 99, 99)];

    XCTAssertTrue(rectEquals(1000.0f, 46.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testBottomInRectNoMargin {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionBottom inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(1000.0f, 180.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testBottomInRectWithMargin {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionBottom inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(99, 99, 5, 99)];

    XCTAssertTrue(rectEquals(1000.0f, 175.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testTopLeftInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionTopLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(100.0f, 100.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testTopRightInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionTopRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(180.0f, 100.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testBottomLeftInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionBottomLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(100.0f, 180.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testBottomRightInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionBottomRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(180.0f, 180.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testTopHCenterInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionTopHCenter inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(140.0f, 100.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testBottomHCenterInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionBottomHCenter inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(140.0f, 180.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testVCenterLeftInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionVCenterLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(100.0f, 140.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testVCenterRightInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionVCenterRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(180.0f, 140.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testCentersInRect {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionCenters inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(140.0f, 140.0f, 20.0f, 20.0f, rect), @"");
}

- (void) testViewRelativePositionAboveAlignedLeft {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionAboveAlignedLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(100.0f, 90.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionAboveAlignedLeftWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionAboveAlignedLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    XCTAssertTrue(rectEquals(105.0f, 85.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionAboveCentered {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionAboveCentered inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(145.0f, 90.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionAboveCenteredWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionAboveCentered inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    XCTAssertTrue(rectEquals(145.0f, 85.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionAboveAlignedRight {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionAboveAlignedRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(190.0f, 90.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionAboveAlignedRightWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionAboveAlignedRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    XCTAssertTrue(rectEquals(185.0f, 85.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheRightAlignedTop {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheRightAlignedTop inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(200.0f, 100.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheRightAlignedTopWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheRightAlignedTop inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    XCTAssertTrue(rectEquals(205.0f, 105.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheRightCentered {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheRightCentered inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(200.0f, 145.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheRightCenteredWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheRightCentered inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    XCTAssertTrue(rectEquals(205.0f, 145.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheRightAlignedBottom {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheRightAlignedBottom inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(200.0f, 190.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheRightAlignedBottomWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheRightAlignedBottom inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    XCTAssertTrue(rectEquals(205.0f, 185.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheLeftAlignedTop {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheLeftAlignedTop inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(90.0f, 100.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheLeftAlignedTopWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheLeftAlignedTop inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    XCTAssertTrue(rectEquals(85.0f, 105.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheLeftCentered {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheLeftCentered inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(90.0f, 145.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheLeftCenteredWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheLeftCentered inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    XCTAssertTrue(rectEquals(85.0f, 145.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheLeftAlignedBottom {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheLeftAlignedBottom inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(90.0f, 190.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionToTheLeftAlignedBottomWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionToTheLeftAlignedBottom inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    XCTAssertTrue(rectEquals(85.0f, 185.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionUnderAlignedLeft {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionUnderAlignedLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(100.0f, 200.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionUnderAlignedLeftWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionUnderAlignedLeft inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    XCTAssertTrue(rectEquals(105.0f, 205.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionUnderCentered {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionUnderCentered inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(145.0f, 200.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionUnderCenteredWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionUnderCentered inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    XCTAssertTrue(rectEquals(145.0f, 205.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionUnderAlignedRight {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionUnderAlignedRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(190.0f, 200.0f, 10.0f, 10.0f, rect), @"");
}

- (void) testViewRelativePositionUnderAlignedRightWithEdgeInset {
    CGRect rect = [MCUIViewLayoutPosition relativePositionRect:CGRectMake(1000, 1000, 10, 10) atPosition:MCViewRelativePositionUnderAlignedRight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];

    XCTAssertTrue(rectEquals(185.0f, 205.0f, 10.0f, 10.0f, rect), @"");
}

- (void)testFitHeightNoMargins {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionFitHeight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(1000.0f, 100.0f, 20.0f, 100.0f, rect), @"");
}

- (void)testFitHeightWithMargins {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionFitHeight inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(10, 0, 5, 0)];

    XCTAssertTrue(rectEquals(1000.0f, 110.0f, 20.0f, 85.0f, rect), @"");
}

- (void)testFitWidthNoMargins {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionFitWidth inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsZero];

    XCTAssertTrue(rectEquals(100.0f, 1000.0f, 100.0f, 20.0f, rect), @"");
}

- (void)testFitWidthWithMargins {
    CGRect rect = [MCUIViewLayoutPosition positionRect:CGRectMake(1000, 1000, 20, 20) atPosition:MCViewPositionFitWidth inRect:CGRectMake(100, 100, 100, 100) withMargins:UIEdgeInsetsMake(0,10,0,5)];

    XCTAssertTrue(rectEquals(110.0f, 1000.0f, 85.0f, 20.0f, rect), @"");
}

- (void)testCeilFloatToDisplayScale
{
    CGFloat ceiledFloat = [MCUIViewLayoutPosition ceilFloatToDisplayScale:1.33];
    if (self.displayScale > 1.0f) {
        XCTAssertEqual(ceiledFloat, 1.5f);
    } else {
        XCTAssertEqual(ceiledFloat, 2.0f);
    }

}

- (void)testFloorFloatToDisplayScale
{
    CGFloat flooredFloat = [MCUIViewLayoutPosition floorFloatToDisplayScale:1.75];
    if (self.displayScale > 1.0f) {
        XCTAssertEqual(flooredFloat, 1.5f);
    } else {
        XCTAssertEqual(flooredFloat, 1.0f);
    }
}

@end
