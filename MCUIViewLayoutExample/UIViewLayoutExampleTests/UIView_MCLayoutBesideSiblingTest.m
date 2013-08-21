//
//  UIView_MCLayoutBesideSiblingTest.m
//  UIViewLayoutExample
//
//  Created by Marc Lefrancois on 2013-08-16.
//  Copyright (c) 2013 Mirego, Inc. All rights reserved.
//

#import "UIView_MCLayoutBesideSiblingTest.h"
#import "UIView+MCLayout.h"
#import "GeometryTestingHelper.h"

@interface UIView_MCLayoutBesideSiblingTest ()
@property(nonatomic) UIView *containerView;
@property(nonatomic) UIView *toPositionView;
@property(nonatomic) UIView *siblingView;
@end

@implementation UIView_MCLayoutBesideSiblingTest
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

- (void) testAboveSiblingCentered {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionAboveCentered toView:self.siblingView];
    STAssertTrue(rectEquals(35, 35, 40, 40, self.toPositionView.frame), @"");
}

- (void) testAboveSiblingAlignLeft {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionAboveAlignedLeft toView:self.siblingView];
    STAssertTrue(rectEquals(30, 35, 40, 40, self.toPositionView.frame), @"");
}

- (void) testAboveSiblingAlignRight {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionAboveAlignedRight toView:self.siblingView];
    STAssertTrue(rectEquals(40, 35, 40, 40, self.toPositionView.frame), @"");
}

- (void) testUnderSiblingCentered {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionUnderCentered toView:self.siblingView];
    STAssertTrue(rectEquals(35, 125, 40, 40, self.toPositionView.frame), @"");
}

- (void) testUnderSiblingAlignRight {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionUnderAlignedRight toView:self.siblingView];
    STAssertTrue(rectEquals(40, 125, 40, 40, self.toPositionView.frame), @"");
}

- (void) testUnderSiblingAlignLeft {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionUnderAlignedLeft toView:self.siblingView];
    STAssertTrue(rectEquals(30, 125, 40, 40, self.toPositionView.frame), @"");
}

- (void) testToTheRightOfSiblingCentered {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionToTheRightCentered toView:self.siblingView];
    STAssertTrue(rectEquals(80, 80, 40, 40, self.toPositionView.frame), @"");
}

- (void) testToTheRightOfSiblingAlignTop {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionToTheRightAlignedTop toView:self.siblingView];
    STAssertTrue(rectEquals(80, 75, 40, 40, self.toPositionView.frame), @"");
}

- (void) testToTheRightOfSiblingAlignBottom {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionToTheRightAlignedBottom toView:self.siblingView];
    STAssertTrue(rectEquals(80, 85, 40, 40, self.toPositionView.frame), @"");
}

- (void) testToTheLeftOfSiblingCentered {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionToTheLeftCentered toView:self.siblingView];
    STAssertTrue(rectEquals(-10, 80, 40, 40, self.toPositionView.frame), @"");
}

- (void) testToTheLeftOfSiblingAlignBottom {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionToTheLeftAlignedBottom toView:self.siblingView];
    STAssertTrue(rectEquals(-10, 85, 40, 40, self.toPositionView.frame), @"");
}

- (void) testToTheLeftOfSiblingAlignTop {
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionToTheLeftAlignedTop toView:self.siblingView];
    STAssertTrue(rectEquals(-10, 75, 40, 40, self.toPositionView.frame), @"");
}
@end
