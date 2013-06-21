//
//  UIView_MCLayoutInSuperViewTests.m
//  UIView_MCLayoutInSuperViewTests
//
//  Created by Mathieu Baron on 2013-05-17.
//  Copyright (c) 2013 Mirego, Inc. All rights reserved.
//

#import "UIView_MCLayoutInSuperViewTests.h"
#import "RectHelper.h"
#import "UIView+MCLayout.h"

@interface UIView_MCLayoutInSuperViewTests ()
@property(nonatomic, strong) UIView *containerView;
@property(nonatomic, strong) UIView *toPositionView;
@end

@implementation UIView_MCLayoutInSuperViewTests

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
    [self.toPositionView mc_setPosition:MCViewPositionTop];
    STAssertTrue(rectEquals(80, 0, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetTopLeftPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionTop | MCViewPositionLeft];
    STAssertTrue(rectEquals(0, 0, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetTopRightPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionTop | MCViewPositionRight];
    STAssertTrue(rectEquals(160, 0, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetCenterLeftPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionCenter | MCViewPositionLeft];
    STAssertTrue(rectEquals(0, 80, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetCenterPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionCenter];
    STAssertTrue(rectEquals(80, 80, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetCenterRightPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionCenter | MCViewPositionRight];
    STAssertTrue(rectEquals(160, 80, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetBottomLeftPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionBottom | MCViewPositionLeft];
    STAssertTrue(rectEquals(0, 160, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetBottomPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionBottom];
    STAssertTrue(rectEquals(80, 160, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetBottomRightPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionBottom | MCViewPositionRight];
    STAssertTrue(rectEquals(160, 160, 40, 40, self.toPositionView.frame), @"");
}

@end
