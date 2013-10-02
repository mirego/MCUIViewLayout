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
