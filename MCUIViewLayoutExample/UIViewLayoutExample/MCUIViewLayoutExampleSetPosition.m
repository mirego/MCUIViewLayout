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

#import "MCUIViewLayoutExampleSetPosition.h"
#import "UIView+MCLayout.h"
#import "MCUIViewExampleUIFactory.h"

static const int kMargin = 10;

//------------------------------------------------------------------------------
#pragma mark MCUIViewLayoutExampleSetPosition (Privates methods)
//------------------------------------------------------------------------------
@interface MCUIViewLayoutExampleSetPosition ()

@property(nonatomic, strong) UILabel *topLeft;
@property(nonatomic, strong) UILabel *top;
@property(nonatomic, strong) UILabel *topRight;
@property(nonatomic, strong) UILabel *left;
@property(nonatomic, strong) UILabel *centered;
@property(nonatomic, strong) UILabel *right;
@property(nonatomic, strong) UILabel *bottomLeft;
@property(nonatomic, strong) UILabel *bottom;
@property(nonatomic, strong) UILabel *bottomRight;
@end

//------------------------------------------------------------------------------
#pragma mark - MCUIViewLayoutExampleSetPosition implementation
//------------------------------------------------------------------------------
@implementation MCUIViewLayoutExampleSetPosition
//------------------------------------------------------------------------------
#pragma mark Constructors and destructor
//------------------------------------------------------------------------------
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        self.topLeft = [MCUIViewExampleUIFactory addLabelWithTitle:@"topLeft" inView:self];
        self.top = [MCUIViewExampleUIFactory addLabelWithTitle:@"top" inView:self];
        self.topRight = [MCUIViewExampleUIFactory addLabelWithTitle:@"topRight" inView:self];

        self.left = [MCUIViewExampleUIFactory addLabelWithTitle:@"leftCentered" inView:self];
        self.centered = [MCUIViewExampleUIFactory addLabelWithTitle:@"centered" inView:self];
        self.right = [MCUIViewExampleUIFactory addLabelWithTitle:@"rightCentered" inView:self];

        self.bottomLeft = [MCUIViewExampleUIFactory addLabelWithTitle:@"bottomLeft" inView:self];
        self.bottom = [MCUIViewExampleUIFactory addLabelWithTitle:@"bottom" inView:self];
        self.bottomRight = [MCUIViewExampleUIFactory addLabelWithTitle:@"bottomRight" inView:self];

        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)] ];
    }
    return self;
}

- (void)close {
    [self removeFromSuperview];
}

//- (void)dealloc {
//
//}

//------------------------------------------------------------------------------
#pragma mark Getters and setters
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
#pragma mark Layout
//------------------------------------------------------------------------------
- (void) layoutSubviews {
    [super layoutSubviews];

    [self.topLeft mc_setPosition:MCViewPositionTopLeft withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.top mc_setPosition:MCViewPositionTopHCenter withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.topRight mc_setPosition:MCViewPositionTopRight withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];

    [self.left mc_setPosition:MCViewPositionVCenterLeft withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.centered mc_setPosition:MCViewPositionCenters withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.right mc_setPosition:MCViewPositionVCenterRight withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];

    [self.bottomLeft mc_setPosition:MCViewPositionBottomLeft withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.bottom mc_setPosition:MCViewPositionBottomHCenter withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.bottomRight mc_setPosition:MCViewPositionBottomRight withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
}

//------------------------------------------------------------------------------
#pragma mark Custom drawing
//------------------------------------------------------------------------------
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//}

//------------------------------------------------------------------------------
#pragma mark Public methods
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
#pragma mark Private methods
//------------------------------------------------------------------------------

@end
