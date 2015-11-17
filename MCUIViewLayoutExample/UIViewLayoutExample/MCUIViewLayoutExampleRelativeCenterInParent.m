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

#import "MCUIViewLayoutExampleRelativeCenterInParent.h"
#import "UIView+MCLayout.h"

@interface MCUIViewLayoutExampleRelativeCenterInParent ()
@property (nonatomic) UIView *anchor;
@property (nonatomic) UIView *viewToPosition;
@property (nonatomic) UIView *viewToPosition2;
@end

@implementation MCUIViewLayoutExampleRelativeCenterInParent
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)]];

        _anchor = [[UIView alloc] init];
        _anchor.backgroundColor = [UIColor blackColor];
        [self addSubview:_anchor];

        _viewToPosition = [[UIView alloc] init];
        _viewToPosition.backgroundColor = [UIColor cyanColor];
        [self addSubview:_viewToPosition];

        _viewToPosition2 = [[UIView alloc] init];
        _viewToPosition2.backgroundColor = [UIColor yellowColor];
        [self addSubview:_viewToPosition2];
    }

    return self;
}

- (void)close {
    [self removeFromSuperview];
}

- (void)layoutSubviews {
    [self.anchor mc_setPosition:MCViewPositionTopLeft withMargins:UIEdgeInsetsMake(30, 30, 0, 0) size:CGSizeMake(100, 50)];
    [self.viewToPosition mc_setPosition:MCViewPositionUnder | MCViewPositionFitParentWidth inView:self.anchor withMargins:UIEdgeInsetsMake(40, 0, 0, 0) size:CGSizeMake(30, 30)];
    [self.viewToPosition2 mc_setPosition:MCViewPositionUnder | MCViewPositionHCenterInParent inView:self.anchor withMargins:UIEdgeInsetsMake(240, 0, 0, 0) size:CGSizeMake(30, 30)];
}

@end
