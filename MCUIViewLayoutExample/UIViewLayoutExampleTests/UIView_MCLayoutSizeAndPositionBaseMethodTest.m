// Copyright (c) 2013, Mirego
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

@interface UIView_MCLayoutSizeAndPositionBaseMethodTest : XCTestCase
@property(nonatomic) UIView *containerView;
@property(nonatomic) UIView *toMesureView;
@end

@implementation UIView_MCLayoutSizeAndPositionBaseMethodTest

- (void)setUp
{
    [super setUp];
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.toMesureView = [[UIView alloc] initWithFrame:CGRectMake(10, 15, 40, 40)];
    [self.containerView addSubview:self.toMesureView];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    [self.toMesureView removeFromSuperview];
    self.containerView = nil;
    self.toMesureView = nil;
    [super tearDown];
}

- (void)testMCGetSize
{
    CGSize size = [self.toMesureView mc_size];
    XCTAssertTrue(sizeEquals(40, 40, size), @"");
}

- (void)testMCSetSize
{
    [self.toMesureView mc_setSize:CGSizeMake(50, 50)];
    XCTAssertTrue(sizeEquals(50, 50, [self.toMesureView mc_size]), @"");
}

- (void)testMCSetSizeWithDecimalDimensionsBelowPointFiveShouldCeilToTheHighestValue
{
    [self.toMesureView mc_setSize:CGSizeMake(50.04, 50.6)];
    XCTAssertTrue(sizeEquals(51, 51, [self.toMesureView mc_size]), @"");
}

- (void)testMCGetHeight
{
    CGFloat height = [self.toMesureView mc_height];
    XCTAssertEqual(40.0f, height, @"");
}

- (void)testMCSetHeight
{
    [self.toMesureView mc_setHeight:46.0f];
    XCTAssertEqual(46.0f, [self.toMesureView mc_height], @"");
}

- (void)testMCSetHeightWithDecimalDimensionsBelowPointFiveShouldCeilToTheHighestValue
{
    [self.toMesureView mc_setHeight:46.001f];
    XCTAssertEqual(47.0f, [self.toMesureView mc_height], @"");
}

- (void)testMCGetWidth
{
    CGFloat width = [self.toMesureView mc_width];
    XCTAssertEqual(40.0f, width, @"");
}

- (void)testMCSetWidth
{
    [self.toMesureView mc_setWidth:48.0f];
    XCTAssertEqual(48.0f, [self.toMesureView mc_width], @"");
}

- (void)testMCSetWidthWithDecimalDimensionsBelowPointFiveShouldCeilToTheHighestValue
{
    [self.toMesureView mc_setWidth:46.001f];
    XCTAssertEqual(47.0f, [self.toMesureView mc_width], @"");
}

- (void)testMCGetOrigin
{
    CGPoint origin = [self.toMesureView mc_origin];
    XCTAssertTrue(pointEquals(10, 15, origin), @"");
}

- (void)testMCSetOrigin
{
    [self.toMesureView mc_setOrigin:CGPointMake(200,200)];
    XCTAssertTrue(pointEquals(200, 200, [self.toMesureView mc_origin]), @"");
}

- (void)testMCGetXPosition
{
    CGFloat xPosition = [self.toMesureView mc_xPosition];
    XCTAssertEqual(10.0f, xPosition, @"");
}

- (void)testMCGetYPosition
{
    CGFloat yPosition = [self.toMesureView mc_yPosition];
    XCTAssertEqual(15.0f, yPosition, @"");
}

@end
