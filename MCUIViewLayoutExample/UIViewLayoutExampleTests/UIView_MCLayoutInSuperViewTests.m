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
    [self.toPositionView mc_setPosition:MCViewPositionCenterLeft];
    STAssertTrue(rectEquals(0, 80, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetCenterPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionCenter];
    STAssertTrue(rectEquals(80, 80, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetCenterRightPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionCenterRight];
    STAssertTrue(rectEquals(160, 80, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetBottomLeftPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionBottomLeft];
    STAssertTrue(rectEquals(0, 160, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetBottomPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionBottom];
    STAssertTrue(rectEquals(80, 160, 40, 40, self.toPositionView.frame), @"");
}

- (void)testSetBottomRightPositionNoMarginsNoSize
{
    [self.toPositionView mc_setPosition:MCViewPositionBottomRight];
    STAssertTrue(rectEquals(160, 160, 40, 40, self.toPositionView.frame), @"");
}

@end
