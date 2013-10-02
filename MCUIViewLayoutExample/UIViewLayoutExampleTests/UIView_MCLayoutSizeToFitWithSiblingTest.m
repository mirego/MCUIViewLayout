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

- (void)testLayoutUnderSiblingCenterFitWidth
{
    [self.toPositionView mc_setRelativePosition:MCViewRelativePositionUnderCentered|MCViewPositionFitWidth toView:self.siblingView withMargins:UIEdgeInsetsMake(10, 5, 20, 15)];
    STAssertTrue(rectEquals(35, 135, 30, 40, self.toPositionView.frame), @"");
}

- (void)testLayoutUnderSiblingFitWidth
{
    [self.toPositionView mc_setRelativePosition:MCViewPositionUnder|MCViewPositionFitWidth toView:self.siblingView withMargins:UIEdgeInsetsMake(10, 5, 20, 15)];
    STAssertTrue(rectEquals(35, 135, 30, 40, self.toPositionView.frame), @"");
}

- (void)testLayoutUnderAboveFitWidth
{
    [self.toPositionView mc_setRelativePosition:MCViewPositionAbove|MCViewPositionFitWidth toView:self.siblingView withMargins:UIEdgeInsetsMake(10, 5, 20, 15)];
    STAssertTrue(rectEquals(35, 15, 30, 40, self.toPositionView.frame), @"");
}
@end
