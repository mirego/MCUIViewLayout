// Copyright (c) 2015, Mirego
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
#import "MCUIViewLayoutExampleSetPositionSizeToFit.h"
#import "MCUIViewExampleUIFactory.h"
#import "UIView+MCLayout.h"

//------------------------------------------------------------------------------
#pragma mark - MCUIViewLayoutExampleSetPositionSizeToFit

//------------------------------------------------------------------------------
@interface MCUIViewLayoutExampleSetPositionSizeToFit ()

@property (nonatomic, strong) UILabel *top;
@property (nonatomic, strong) UILabel *left;
@property (nonatomic, strong) UILabel *centered;
@property (nonatomic, strong) UILabel *right;
@property (nonatomic, strong) UILabel *bottom;

@end

@implementation MCUIViewLayoutExampleSetPositionSizeToFit

//------------------------------------------------------------------------------
#pragma mark constructors and destructor

//------------------------------------------------------------------------------
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor darkGrayColor];

        self.top = [MCUIViewExampleUIFactory addLabelWithTitle:@"top" inView:self];
        self.top.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];

        self.left = [MCUIViewExampleUIFactory addLabelWithTitle:@"leftCentered" inView:self];
        self.left.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
        self.centered = [MCUIViewExampleUIFactory addLabelWithTitle:@"centered" inView:self];
        self.centered.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.3];
        self.right = [MCUIViewExampleUIFactory addLabelWithTitle:@"rightCentered" inView:self];
        self.right.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];

        self.bottom = [MCUIViewExampleUIFactory addLabelWithTitle:@"bottom" inView:self];
        self.bottom.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)]];
    }

    return self;
}
//------------------------------------------------------------------------------
#pragma mark setters and getters
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
#pragma mark public methods

//------------------------------------------------------------------------------
- (void)layoutSubviews {
    [super layoutSubviews];
    UIEdgeInsets insets = UIEdgeInsetsMake(5, 10, 15, 20);

    [self.top mc_setPosition:MCViewPositionTopHCenter | MCViewPositionFitWidth withMargins:insets];
    [self.left mc_setPosition:MCViewPositionVCenterLeft | MCViewPositionFitHeight withMargins:insets];
    [self.bottom mc_setPosition:MCViewPositionBottomHCenter | MCViewPositionFitWidth withMargins:insets];
    [self.right mc_setPosition:MCViewPositionVCenterRight | MCViewPositionFitHeight withMargins:insets];
    [self.centered mc_setPosition:MCViewPositionCenters | MCViewPositionFitHeight | MCViewPositionFitWidth withMargins:insets];
}

//------------------------------------------------------------------------------
#pragma mark private methods

//------------------------------------------------------------------------------
- (void)close {
    [self removeFromSuperview];
}
@end