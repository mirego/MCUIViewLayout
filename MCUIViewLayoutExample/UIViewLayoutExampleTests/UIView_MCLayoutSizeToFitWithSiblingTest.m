//
//  UIView_MCLayoutSizeToFitWithSiblingTest.m
//  UIViewLayoutExample
//
//  Created by Marc Lefrancois on 2013-08-21.
//  Copyright (c) 2013 Mirego, Inc. All rights reserved.
//

#import "UIView_MCLayoutSizeToFitWithSiblingTest.h"
#import "UIView+MCLayout.h"
#import "GeometryTestingHelper.h"

@interface UIView_MCLayoutSizeToFitWithSiblingTest ()
@property(nonatomic) UIView *containerView;
@property(nonatomic) UIView *toPositionView;
@property(nonatomic) UIView *siblingView;
@end

@implementation UIView_MCLayoutSizeToFitWithSiblingTest
- (void)setUp
{
    [super setUp];
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.toPositionView = [[UIView alloc] initWithFrame:CGRectMake(-50, -50, 40, 40)];
    self.siblingView = [[UIView alloc] initWithFrame:CGRectMake(30, 75, 50, 50)];
    [self.containerView addSubview:self.toPositionView];
    [self.containerView addSubview:self.siblingView];
}

- (void)tearDown
{
    [self.toPositionView removeFromSuperview];
    [self.siblingView removeFromSuperview];
    self.siblingView = nil;
    self.toPositionView = nil;
    self.containerView = nil;
    [super tearDown];
}

- (void)testLayoutUnderSiblingFitWidth
{
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionUnderCentered|MCViewPositionFitWidth toView:self.siblingView withMargins:UIEdgeInsetsMake(10, 5, 20, 15)];
    STAssertTrue(rectEquals(35, 135, 30, 40, self.toPositionView.frame), @"");
}
@end
