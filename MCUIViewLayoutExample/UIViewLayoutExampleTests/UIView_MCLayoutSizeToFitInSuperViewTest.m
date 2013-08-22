//
//  UIView_MCLayoutSizeToFitInSuperViewTest.m
//  UIViewLayoutExample
//
//  Created by Marc Lefrancois on 2013-08-21.
//  Copyright (c) 2013 Mirego, Inc. All rights reserved.
//

#import "UIView_MCLayoutSizeToFitInSuperViewTest.h"
#import "UIView+MCLayout.h"
#import "GeometryTestingHelper.h"

@interface UIView_MCLayoutSizeToFitInSuperViewTest ()
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
    STAssertTrue(rectEquals(5, 5, 190, 40, self.toPositionView.frame), @"");
}

- (void)testAlignTopExpandWidthUnequalMargins
{
    [self.toPositionView mc_setPosition:MCViewPositionTopHCenter|MCViewPositionFitWidth withMargins:UIEdgeInsetsMake(5, 10, 15, 20)];
    STAssertTrue(rectEquals(10, 5, 170, 40, self.toPositionView.frame), @"");
}

- (void)testAlignBottomExpandHeight
{
    [self.toPositionView mc_setPosition:MCViewPositionBottomHCenter|MCViewPositionFitHeight withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];
    STAssertTrue(rectEquals(80, 5, 40, 290, self.toPositionView.frame), @"");
}

- (void)testAlignLeftExpandHeight
{
    [self.toPositionView mc_setPosition:MCViewPositionVCenterLeft|MCViewPositionFitHeight withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];
    STAssertTrue(rectEquals(5, 5, 40, 290, self.toPositionView.frame), @"");
}

- (void)testAlignRightExpandWidth
{
    [self.toPositionView mc_setPosition:MCViewPositionVCenterRight|MCViewPositionFitWidth withMargins:UIEdgeInsetsMake(5, 5, 5, 5)];
    STAssertTrue(rectEquals(5, 130, 190, 40, self.toPositionView.frame), @"");
}

- (void)testAlignBottomFitWidth {
    [self.toPositionView mc_setPosition:MCViewPositionBottomHCenter|MCViewPositionFitWidth withMargins:UIEdgeInsetsMake(5, 10, 15, 20)];
    STAssertTrue(rectEquals(10, 245, 170, 40, self.toPositionView.frame), @"");
}

- (void)testAlignCentersFitAll {
    [self.toPositionView mc_setPosition:MCViewPositionCenters|MCViewPositionFitWidth |MCViewPositionFitHeight withMargins:UIEdgeInsetsMake(5, 10, 15, 20)];
    STAssertTrue(rectEquals(10, 5, 170, 280, self.toPositionView.frame), @"");
}

- (void)testAlignCentersFitWidth {
    [self.toPositionView mc_setPosition:MCViewPositionCenters|MCViewPositionFitWidth withMargins:UIEdgeInsetsMake(5, 10, 15, 20)];
    STAssertTrue(rectEquals(10, 120, 170, 40, self.toPositionView.frame), @"");
}

- (void)testAlignCentersFitHeight {
    [self.toPositionView mc_setPosition:MCViewPositionCenters|MCViewPositionFitHeight withMargins:UIEdgeInsetsMake(5, 10, 15, 20)];
    STAssertTrue(rectEquals(70, 5, 40, 280, self.toPositionView.frame), @"");
}

@end
