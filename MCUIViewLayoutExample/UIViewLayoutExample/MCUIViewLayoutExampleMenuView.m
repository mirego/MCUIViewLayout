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

#import "MCUIViewLayoutExampleMenuView.h"
#import "UIView+MCLayout.h"
//------------------------------------------------------------------------------
#pragma mark MCUIViewLayoutExampleRootView (Privates methods)
//------------------------------------------------------------------------------
@interface MCUIViewLayoutExampleMenuView ()
@property(nonatomic, readwrite) UIButton *buttonSetPosition;
@property(nonatomic, readwrite) UIButton *buttonSetRelativePosition;
@end

//------------------------------------------------------------------------------
#pragma mark - MCUIViewLayoutExampleRootView implementation
//------------------------------------------------------------------------------
@implementation MCUIViewLayoutExampleMenuView
//------------------------------------------------------------------------------
#pragma mark Constructors and destructor
//------------------------------------------------------------------------------
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.buttonSetPosition = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.buttonSetPosition setTitle:@"mc_setPosition" forState:UIControlStateNormal];
        [self.buttonSetPosition sizeToFit];
        [self addSubview:self.buttonSetPosition];

        self.buttonSetRelativePosition = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.buttonSetRelativePosition setTitle:@"mc_setPositionRelative" forState:UIControlStateNormal];
        [self.buttonSetRelativePosition sizeToFit];
        [self addSubview:self.buttonSetRelativePosition];

    }
    return self;
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
    [self.buttonSetPosition mc_setPosition:MCViewPositionTop withMargins:UIEdgeInsetsMake(15, 0, 0, 0)];

    [self.buttonSetRelativePosition mc_setRelativePosition:MCViewRelativePositionUnderCentered
                                                    toView:self.buttonSetPosition withMargins:UIEdgeInsetsMake(15.0f, 0, 0, 0)];
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