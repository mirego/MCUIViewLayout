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

@interface UIView_MCLayoutBesideSiblingTest : XCTestCase
@property (nonatomic) UIView *containerView;
@property (nonatomic) UIView *toPositionView;
@property (nonatomic) UIView *siblingView;
@end

@implementation UIView_MCLayoutBesideSiblingTest
- (void)setUp {
    [super setUp];
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.toPositionView = [[UIView alloc] initWithFrame:CGRectMake(-50, -50, 40, 40)];
    self.siblingView = [[UIView alloc] initWithFrame:CGRectMake(30, 75, 50, 50)];
    [self.containerView addSubview:self.toPositionView];
    [self.containerView addSubview:self.siblingView];
}

- (void)tearDown {
    [self.toPositionView removeFromSuperview];
    [self.siblingView removeFromSuperview];
    self.siblingView = nil;
    self.toPositionView = nil;
    self.containerView = nil;
    [super tearDown];
}

- (void)testAboveSiblingCentered {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionAboveCentered toView:self.siblingView];
    XCTAssertTrue(rectEquals(35, 35, 40, 40, self.toPositionView.frame), @"");
}

- (void)testAboveSiblingAlignLeft {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionAboveAlignedLeft toView:self.siblingView];
    XCTAssertTrue(rectEquals(30, 35, 40, 40, self.toPositionView.frame), @"");
}

- (void)testAboveSiblingAlignRight {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionAboveAlignedRight toView:self.siblingView];
    XCTAssertTrue(rectEquals(40, 35, 40, 40, self.toPositionView.frame), @"");
}

- (void)testUnderSiblingCentered {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionUnderCentered toView:self.siblingView];
    XCTAssertTrue(rectEquals(35, 125, 40, 40, self.toPositionView.frame), @"");
}

- (void)testUnderSiblingAlignRight {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionUnderAlignedRight toView:self.siblingView];
    XCTAssertTrue(rectEquals(40, 125, 40, 40, self.toPositionView.frame), @"");
}

- (void)testUnderSiblingAlignLeft {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionUnderAlignedLeft toView:self.siblingView];
    XCTAssertTrue(rectEquals(30, 125, 40, 40, self.toPositionView.frame), @"");
}

- (void)testToTheRightOfSiblingCentered {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionToTheRightCentered toView:self.siblingView];
    XCTAssertTrue(rectEquals(80, 80, 40, 40, self.toPositionView.frame), @"");
}

- (void)testToTheRightOfSiblingAlignTop {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionToTheRightAlignedTop toView:self.siblingView];
    XCTAssertTrue(rectEquals(80, 75, 40, 40, self.toPositionView.frame), @"");
}

- (void)testToTheRightOfSiblingAlignBottom {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionToTheRightAlignedBottom toView:self.siblingView];
    XCTAssertTrue(rectEquals(80, 85, 40, 40, self.toPositionView.frame), @"");
}

- (void)testToTheLeftOfSiblingCentered {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionToTheLeftCentered toView:self.siblingView];
    XCTAssertTrue(rectEquals(-10, 80, 40, 40, self.toPositionView.frame), @"");
}

- (void)testToTheLeftOfSiblingAlignBottom {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionToTheLeftAlignedBottom toView:self.siblingView];
    XCTAssertTrue(rectEquals(-10, 85, 40, 40, self.toPositionView.frame), @"");
}

- (void)testToTheLeftOfSiblingAlignTop {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionToTheLeftAlignedTop toView:self.siblingView];
    XCTAssertTrue(rectEquals(-10, 75, 40, 40, self.toPositionView.frame), @"");
}
@end
