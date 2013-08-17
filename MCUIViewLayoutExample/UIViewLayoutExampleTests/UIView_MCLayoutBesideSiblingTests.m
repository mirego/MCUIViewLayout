//
//  UIView_MCLayoutBesideSiblingTests.m
//  UIViewLayoutExample
//
//  Created by Marc Lefrancois on 2013-08-16.
//  Copyright (c) 2013 Mirego, Inc. All rights reserved.
//

#import "UIView_MCLayoutBesideSiblingTests.h"
#import "UIView+MCLayout.h"
#import "RectHelper.h"

@interface UIView_MCLayoutBesideSiblingTests ()
@property(nonatomic) UIView *containerView;
@property(nonatomic) UIView *toPositionView;
@property(nonatomic) UIView *siblingView;
@end

@implementation UIView_MCLayoutBesideSiblingTests
- (void)setUp
{
    [super setUp];
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.toPositionView = [[UIView alloc] initWithFrame:CGRectMake(-50, -50, 40, 40)];
    self.siblingView = [[UIView alloc] initWithFrame:CGRectMake(75, 75, 50, 50)];
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

- (void) testAboveSiblingCentered {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionAboveCentered toView:self.siblingView];
    STAssertTrue(rectEquals(80, 0, 40, 40, self.toPositionView.frame), @"");
}
@end
