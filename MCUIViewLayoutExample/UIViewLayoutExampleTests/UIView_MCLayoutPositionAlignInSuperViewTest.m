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
#import "UIView+MCLayout.h"

@interface UIView_MCLayoutPositionAlignInSuperViewTest : XCTestCase
@property(nonatomic) UIView *containerView;
@property(nonatomic) UIView *toPositionView;
@property(nonatomic) UIView *siblingView;
@end

@implementation UIView_MCLayoutPositionAlignInSuperViewTest

- (void)setUp
{
    [super setUp];
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.siblingView = [[UIView alloc] initWithFrame:CGRectMake(95, 95, 10, 10)];
    self.toPositionView = [[UIView alloc] initWithFrame:CGRectMake(-50, -50, 40, 40)];
    [self.containerView addSubview:self.toPositionView];
    [self.containerView addSubview:self.siblingView];
}

- (void)tearDown
{
    [self.toPositionView removeFromSuperview];
    [self.siblingView removeFromSuperview];
    self.containerView = nil;
    self.toPositionView = nil;
    self.siblingView = nil;
    [super tearDown];
}

-(void)testAboveCenterInParent {
    [self.toPositionView mc_setRelativePosition:MCViewPositionAbove | MCViewPositionHCenterInParent toView:self.siblingView];
    XCTAssertTrue(rectEquals(80, 55, 40, 40, self.toPositionView.frame), @"");
}

-(void)testUnderCenterInParent {
    [self.toPositionView mc_setRelativePosition:MCViewPositionUnder | MCViewPositionHCenterInParent toView:self.siblingView];
    XCTAssertTrue(rectEquals(80, 105, 40, 40, self.toPositionView.frame), @"");
}

-(void)testToTheRightCenterInParent {
    [self.toPositionView mc_setRelativePosition:MCViewPositionToTheRight | MCViewPositionVCenterInParent toView:self.siblingView];
    XCTAssertTrue(rectEquals(105, 80, 40, 40, self.toPositionView.frame), @"");
}

-(void)testToTheLeftCenterInParent {
    [self.toPositionView mc_setRelativePosition:MCViewPositionToTheLeft | MCViewPositionVCenterInParent toView:self.siblingView];
    XCTAssertTrue(rectEquals(55, 80, 40, 40, self.toPositionView.frame), @"");
}

-(void)testAboveFitParentWidth {
    [self.toPositionView mc_setRelativePosition:MCViewPositionAbove | MCViewPositionFitParentWidth toView:self.siblingView];
    XCTAssertTrue(rectEquals(0, 55, 200, 40, self.toPositionView.frame), @"");
}

-(void)testUnderFitParentWidth {
    [self.toPositionView mc_setRelativePosition:MCViewPositionUnder | MCViewPositionFitParentWidth toView:self.siblingView];
    XCTAssertTrue(rectEquals(0, 105, 200, 40, self.toPositionView.frame), @"");
}

-(void)testToTheRightFitParentHeight {
    [self.toPositionView mc_setRelativePosition:MCViewPositionToTheRight | MCViewPositionFitParentHeight toView:self.siblingView];
    XCTAssertTrue(rectEquals(105, 0, 40, 200, self.toPositionView.frame), @"");
}

-(void)testToTheLeftFitParentHeight {
    [self.toPositionView mc_setRelativePosition:MCViewPositionToTheLeft | MCViewPositionFitParentHeight toView:self.siblingView];
    XCTAssertTrue(rectEquals(55, 0, 40, 200, self.toPositionView.frame), @"");
}



@end
