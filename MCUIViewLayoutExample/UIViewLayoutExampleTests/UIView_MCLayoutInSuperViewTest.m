//
//  UIView_MCLayoutInSuperViewTest.m
//  UIView_MCLayoutInSuperViewTest
//
//  Created by Mathieu Baron on 2013-05-17.
//  Copyright (c) 2013 Mirego, Inc. All rights reserved.
//

#import "UIView_MCLayoutInSuperViewTest.h"
#import "GeometryTestingHelper.h"
#import "UIView+MCLayout.h"

@interface UIView_MCLayoutInSuperViewTest ()
@property(nonatomic) UIView *containerView;
@property(nonatomic) UIView *toPositionView;
@end

@implementation UIView_MCLayoutInSuperViewTest

- (void)setUp
{
    [super setUp];
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.toPositionView = [[UIView alloc] initWithFrame:CGRectMake(-50, -50, 40, 40)];
    [self.containerView addSubview:self.toPositionView];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    [self.toPositionView removeFromSuperview];
    self.containerView = nil;
    self.toPositionView = nil;
    [super tearDown];
}

- (void)testSetTopPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionTopHCenter];
    STAssertTrue(rectEquals(80, 0, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetTopPositionWithMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionTopHCenter withMargins:UIEdgeInsetsMake(5, 10, 15, 20)];
    STAssertTrue(rectEquals(70, 5, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetTopLeftPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionTopLeft];
    STAssertTrue(rectEquals(0, 0, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetTopRightPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionTopRight];
    STAssertTrue(rectEquals(160, 0, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetCenterLeftPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionVCenterLeft];
    STAssertTrue(rectEquals(0, 80, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetCenterPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionCenters];
    STAssertTrue(rectEquals(80, 80, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetCenterRightPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionVCenterRight];
    STAssertTrue(rectEquals(160, 80, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetBottomLeftPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionBottomLeft];
    STAssertTrue(rectEquals(0, 160, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetBottomPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionBottomHCenter];
    STAssertTrue(rectEquals(80, 160, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetBottomRightPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionBottomRight];
    STAssertTrue(rectEquals(160, 160, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetPositionInViewCenterTwoSibblings
{
    UIView *sibblingView = [[UIView alloc] initWithFrame:CGRectMake(-100, -100, 40, 40)];
    [self.containerView addSubview:sibblingView];

    self.toPositionView.frame = CGRectMake(10, 10, 40, 40);
    [sibblingView mc_setPosition:MCViewPositionCenters inView:self.toPositionView];
    STAssertTrue(rectEquals(10, 10, 40, 40, sibblingView.frame), @"");
}

@end
