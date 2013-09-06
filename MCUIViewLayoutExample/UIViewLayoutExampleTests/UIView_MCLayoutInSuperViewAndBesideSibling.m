//
//  UIView_MCLayoutInSuperViewAndBesideSibling.m
//  UIViewLayoutExample
//
//  Created by Marc Lefrancois on 2013-09-05.
//  Copyright (c) 2013 Mirego, Inc. All rights reserved.
//

#import "UIView_MCLayoutInSuperViewAndBesideSibling.h"
#import "UIView+MCLayout.h"
#import "GeometryTestingHelper.h"

@interface UIView_MCLayoutInSuperViewAndBesideSibling ()
@property(nonatomic) UIView *containerView;
@property(nonatomic) UIView *siblingView1;
@property(nonatomic) UIView *siblingView2;
@property(nonatomic) UIView *siblingView3;
@end

@implementation UIView_MCLayoutInSuperViewAndBesideSibling
- (void)setUp
{
    [super setUp];
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(7, 7, 201, 105)];
    self.siblingView1 = [[UIView alloc] initWithFrame:CGRectMake(-50, -50, 43, 41)];
    self.siblingView2 = [[UIView alloc] initWithFrame:CGRectMake(-100, -100, 53, 51)];
    self.siblingView3 = [[UIView alloc] initWithFrame:CGRectMake(-200, -200, 77, 77)];
    [self.containerView addSubview:self.siblingView1];
    [self.containerView addSubview:self.siblingView2];
    [self.containerView addSubview:self.siblingView3];
}

- (void)tearDown
{
    [self.siblingView1 removeFromSuperview];
    [self.siblingView2 removeFromSuperview];
    [self.siblingView3 removeFromSuperview];
    self.siblingView3 = nil;
    self.siblingView2 = nil;
    self.siblingView1 = nil;
    self.containerView = nil;
    [super tearDown];
}

- (void)testFirstViewAlignLeftSiblingsAlignedCenteredWithPrecedingView {
    [self.siblingView1 mc_setPosition:MCViewPositionLeft | MCViewPositionFitHeight withMargins:UIEdgeInsetsMake(1, 3, 1, 0)];
    STAssertTrue(rectEquals(3, 1, 43, 103, self.siblingView1.frame), @"");
    [self.siblingView2 mc_setRelativePosition:MCViewRelativePositionToTheRightCentered |MCViewPositionFitHeight toView:self.siblingView1];
    STAssertTrue(rectEquals(46, 1, 53, 103, self.siblingView2.frame), @"");
    [self.siblingView3 mc_setRelativePosition:MCViewRelativePositionToTheRightCentered |MCViewPositionFitHeight toView:self.siblingView2];
    STAssertTrue(rectEquals(99, 1, 77, 103, self.siblingView3.frame), @"");
}
@end
