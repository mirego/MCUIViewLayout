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
#import "UIView+MCLayoutCalculation.h"

@interface UIView_MCLayoutCalculationsTest : XCTestCase
@property (nonatomic) UIView *containerView;
@property (nonatomic) UIView *toPositionView;
@property (nonatomic) UIView *siblingView;
@property (nonatomic) UIView *orphanView;
@end

@implementation UIView_MCLayoutCalculationsTest

- (void)setUp {
    [super setUp];
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.toPositionView = [[UIView alloc] initWithFrame:CGRectMake(-50, -50, 40, 40)];
    self.siblingView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    self.orphanView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 500, 500)];
    [self.containerView addSubview:self.siblingView];
    [self.containerView addSubview:self.toPositionView];
}

- (void)tearDown {
    // Tear-down code here.
    [self.toPositionView removeFromSuperview];
    self.containerView = nil;
    self.toPositionView = nil;
    [super tearDown];
}

- (void)testGetRectForPosition {
    CGRect rect = [self.toPositionView mc_getRectForPosition:MCViewPositionTopHCenter];
    XCTAssertTrue(rectEquals(80, 0, 40, 40, rect), @"");
}

- (void)testGetRectForPositionWithMargins {
    CGRect rect = [self.toPositionView mc_getRectForPosition:MCViewPositionTopHCenter withMargins:UIEdgeInsetsMake(10, 10, 10, 10)];
    XCTAssertTrue(rectEquals(80, 10, 40, 40, rect), @"");
}

- (void)testGetRectForPositionWithMarginsAndSize {
    CGRect rect = [self.toPositionView mc_getRectForPosition:MCViewPositionTopHCenter withMargins:UIEdgeInsetsMake(10, 10, 10, 10) size:CGSizeMake(50, 50)];
    XCTAssertTrue(rectEquals(75, 10, 50, 50, rect), @"");
}

- (void)testGetRectForPositionInView {
    CGRect rect = [self.toPositionView mc_getRectForPosition:MCViewPositionCenters inView:self.siblingView];
    XCTAssertTrue(rectEquals(40, 40, 40, 40, rect), @"");
}

- (void)testGetRectForPositionInViewWithMargins {
    CGRect rect = [self.toPositionView mc_getRectForPosition:MCViewPositionBottomRight inView:self.siblingView withMargins:UIEdgeInsetsMake(0, 0, 5, 5)];
    XCTAssertTrue(rectEquals(65, 65, 40, 40, rect), @"");
}

- (void)testGetRectForPositionNoSiblingNorParent {
    @try {
        [self.toPositionView mc_getRectForPosition:MCViewPositionBottomRight inView:self.orphanView];
        XCTFail("Should've thrown an exception");
    } @catch (NSException *exception) {
    }
}

- (void)testGetRelativeRectForPositionToView {
    CGRect rect = [self.toPositionView mc_getRectForRelativePosition:MCViewRelativePositionUnderCentered toView:self.siblingView];
    XCTAssertTrue(rectEquals(40, 110, 40, 40, rect), @"");
}

- (void)testGetRelativeRectForPositionToViewWithMargins {
    CGRect rect = [self.toPositionView mc_getRectForRelativePosition:MCViewRelativePositionUnderCentered toView:self.siblingView withMargins:UIEdgeInsetsMake(15, 15, 0, 0)];
    XCTAssertTrue(rectEquals(55, 125, 40, 40, rect), @"");
}

@end
