//
//  UIView_MCLayoutSizeAndPositionBaseMethodTest.m
//  UIViewLayoutExample
//
//  Created by Marc Lefrancois on 2013-08-16.
//  Copyright (c) 2013 Mirego, Inc. All rights reserved.
//

#import "UIView_MCLayoutSizeAndPositionBaseMethodTest.h"
#import "UIView+MCLayout.h"
#import "GeometryTestingHelper.h"

@interface UIView_MCLayoutSizeAndPositionBaseMethodTest ()
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
    STAssertTrue(sizeEquals(40, 40, size), @"");
}

- (void)testMCSetSize
{
    [self.toMesureView mc_setSize:CGSizeMake(50, 50)];
    STAssertTrue(sizeEquals(50, 50, [self.toMesureView mc_size]), @"");
}

- (void)testMCSetSizeWithDecimalDimensionsBelowPointFiveShouldCeilToTheHighestValue
{
    [self.toMesureView mc_setSize:CGSizeMake(50.04, 50.6)];
    STAssertTrue(sizeEquals(51, 51, [self.toMesureView mc_size]), @"");
}

- (void)testMCGetHeight
{
    CGFloat height = [self.toMesureView mc_height];
    STAssertEquals(40.0f, height, @"");
}

- (void)testMCSetHeight
{
    [self.toMesureView mc_setHeight:46.0f];
    STAssertEquals(46.0f, [self.toMesureView mc_height], @"");
}

- (void)testMCSetHeightWithDecimalDimensionsBelowPointFiveShouldCeilToTheHighestValue
{
    [self.toMesureView mc_setHeight:46.001f];
    STAssertEquals(47.0f, [self.toMesureView mc_height], @"");
}

- (void)testMCGetWidth
{
    CGFloat width = [self.toMesureView mc_width];
    STAssertEquals(40.0f, width, @"");
}

- (void)testMCSetWidth
{
    [self.toMesureView mc_setWidth:48.0f];
    STAssertEquals(48.0f, [self.toMesureView mc_width], @"");
}

- (void)testMCSetWidthWithDecimalDimensionsBelowPointFiveShouldCeilToTheHighestValue
{
    [self.toMesureView mc_setWidth:46.001f];
    STAssertEquals(47.0f, [self.toMesureView mc_width], @"");
}

- (void)testMCGetOrigin
{
    CGPoint origin = [self.toMesureView mc_origin];
    STAssertTrue(pointEquals(10, 15, origin), @"");
}

- (void)testMCSetOrigin
{
    [self.toMesureView mc_setOrigin:CGPointMake(200,200)];
    STAssertTrue(pointEquals(200, 200, [self.toMesureView mc_origin]), @"");
}

- (void)testMCGetXPosition
{
    CGFloat xPosition = [self.toMesureView mc_xPosition];
    STAssertEquals(10.0f, xPosition, @"");
}

- (void)testMCGetYPosition
{
    CGFloat yPosition = [self.toMesureView mc_yPosition];
    STAssertEquals(15.0f, yPosition, @"");
}

@end
