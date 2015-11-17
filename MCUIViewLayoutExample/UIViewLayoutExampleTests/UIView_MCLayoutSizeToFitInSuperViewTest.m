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
#import "UIView+MCLayout.h"
#import "GeometryTestingHelper.h"

@interface UIView_MCLayoutSizeToFitInSuperViewTest : XCTestCase
@property(nonatomic) UIView *containerView;
@property(nonatomic) UIView *toPositionView;
@end

@implementation UIView_MCLayoutSizeToFitInSuperViewTest
- (void)setUp
{
    [super setUp];
    // Set-up code here.
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    self.toPositionView = [[UIView alloc] initWithFrame:CGRectMake(-50, -50, 40, 40)];
    [self.containerView addSubview:self.toPositionView];
}

- (void)tearDown
{
    // Tear-down code here.
    [self.toPositionView removeFromSuperview];
    self.containerView = nil;
    self.toPositionView = nil;
    [super tearDown];
}

- (void)testAlignTopExpandWidth
{
    [self.toPositionView mc_setPosition:MCViewPositionTopHCenter|MCViewPositionFitWidth withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];
    XCTAssertTrue(rectEquals(5, 5, 190, 40, self.toPositionView.frame), @"");
}

- (void)testAlignTopExpandWidthUnequalMargins
{
    [self.toPositionView mc_setPosition:MCViewPositionTopHCenter|MCViewPositionFitWidth withMargins:UIEdgeInsetsMake(5, 10, 15, 20)];
    XCTAssertTrue(rectEquals(10, 5, 170, 40, self.toPositionView.frame), @"");
}

- (void)testAlignBottomExpandHeight
{
    [self.toPositionView mc_setPosition:MCViewPositionBottomHCenter|MCViewPositionFitHeight withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];
    XCTAssertTrue(rectEquals(80, 5, 40, 290, self.toPositionView.frame), @"");
}

- (void)testAlignLeftExpandHeight
{
    [self.toPositionView mc_setPosition:MCViewPositionVCenterLeft|MCViewPositionFitHeight withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];
    XCTAssertTrue(rectEquals(5, 5, 40, 290, self.toPositionView.frame), @"");
}

- (void)testAlignRightExpandWidth
{
    [self.toPositionView mc_setPosition:MCViewPositionVCenterRight|MCViewPositionFitWidth withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];
    XCTAssertTrue(rectEquals(5, 130, 190, 40, self.toPositionView.frame), @"");
}

- (void)testAlignBottomHCenterFitWidth {
    [self.toPositionView mc_setPosition:MCViewPositionBottomHCenter|MCViewPositionFitWidth withMargins:UIEdgeInsetsMake(5, 10, 15, 20)];
    XCTAssertTrue(rectEquals(10, 245, 170, 40, self.toPositionView.frame), @"");
}

- (void)testAlignCentersFitAll {
    [self.toPositionView mc_setPosition:MCViewPositionCenters|MCViewPositionFitWidth |MCViewPositionFitHeight withMargins:UIEdgeInsetsMake(5, 10, 15, 20)];
    XCTAssertTrue(rectEquals(10, 5, 170, 280, self.toPositionView.frame), @"");
}

- (void)testAlignCentersFitWidth {
    [self.toPositionView mc_setPosition:MCViewPositionCenters|MCViewPositionFitWidth withMargins:UIEdgeInsetsMake(5, 10, 15, 20)];
    XCTAssertTrue(rectEquals(10, 120, 170, 40, self.toPositionView.frame), @"");
}

- (void)testAlignCentersFitHeight {
    [self.toPositionView mc_setPosition:MCViewPositionCenters|MCViewPositionFitHeight withMargins:UIEdgeInsetsMake(5, 10, 15, 20)];
    XCTAssertTrue(rectEquals(70, 5, 40, 280, self.toPositionView.frame), @"");
}

- (void)testAlignRightFitHeight {
    [self.toPositionView mc_setPosition:MCViewPositionRight|MCViewPositionFitHeight withMargins:UIEdgeInsetsMake(100, 0, 0, 0)];
    XCTAssertTrue(rectEquals(160, 100, 40, 200, self.toPositionView.frame), @"");
}

- (void)testAlignLeftFitHeight {
    [self.toPositionView mc_setPosition:MCViewPositionLeft|MCViewPositionFitHeight withMargins:UIEdgeInsetsMake(100, 0, 0, 0)];
    XCTAssertTrue(rectEquals(0, 100, 40, 200, self.toPositionView.frame), @"");
}

- (void)testAlignTopFitWidth {
    [self.toPositionView mc_setPosition:MCViewPositionTop|MCViewPositionFitWidth withMargins:UIEdgeInsetsMake(20, 5, 0, 10)];
    XCTAssertTrue(rectEquals(5, 20, 185, 40, self.toPositionView.frame), @"");
}

- (void)testAlignBottomFitWidth {
    [self.toPositionView mc_setPosition:MCViewPositionBottom|MCViewPositionFitWidth withMargins:UIEdgeInsetsMake(20, 5, 10, 10)];
    XCTAssertTrue(rectEquals(5, 250, 185, 40, self.toPositionView.frame), @"");
}

@end
