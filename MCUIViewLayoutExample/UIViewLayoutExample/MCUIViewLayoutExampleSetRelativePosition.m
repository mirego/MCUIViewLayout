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

#import "MCUIViewLayoutExampleSetRelativePosition.h"
#import "MCUIViewExampleUIFactory.h"
#import "UIView+MCLayout.h"

//------------------------------------------------------------------------------
#pragma mark MCUIViewLayoutExampleSetRelativePosition (Privates methods)
//------------------------------------------------------------------------------
@interface MCUIViewLayoutExampleSetRelativePosition ()
@property(nonatomic) UIView *centeredSibling;
@property(nonatomic) UILabel * aboveCentered;
@property(nonatomic) UILabel *belowCentered;
@property(nonatomic, strong) UILabel *leftCentered;
@property(nonatomic, strong) UILabel *rightCentered;
@property(nonatomic, strong) UIView *topLeftSibling;
@property(nonatomic, strong) UILabel *aboveLeft;
@property(nonatomic, strong) UILabel *belowLeft;
@property(nonatomic, strong) UILabel *leftTop;
@property(nonatomic, strong) UILabel *rightTop;
@property(nonatomic, strong) UIView *bottomRightSibling;
@property(nonatomic, strong) UILabel *aboveRight;
@property(nonatomic, strong) UILabel *belowRight;
@property(nonatomic, strong) UILabel *leftBottom;
@property(nonatomic, strong) UILabel *rightBottom;
@end

//------------------------------------------------------------------------------
#pragma mark - MCUIViewLayoutExampleSetRelativePosition implementation
//------------------------------------------------------------------------------
@implementation MCUIViewLayoutExampleSetRelativePosition
//------------------------------------------------------------------------------
#pragma mark Constructors and destructor
//------------------------------------------------------------------------------
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)]];
        [self addCenteredExamples];
        [self addTopLeftExamples];
        [self addBottomRightExamples];

    }
    return self;
}

- (void)addBottomRightExamples {
    self.bottomRightSibling = [[UIView alloc] initWithFrame:CGRectZero];
    self.bottomRightSibling.backgroundColor = [UIColor blueColor];

    self.aboveRight = [MCUIViewExampleUIFactory addLabelWithTitle:@"AboveRight"
                                               inView:self];
    self.belowRight = [MCUIViewExampleUIFactory addLabelWithTitle:@"BelowRight"
                                               inView:self];
    self.leftBottom = [MCUIViewExampleUIFactory addLabelWithTitle:@"LeftBottom"
                                             inView:self];
    self.rightBottom = [MCUIViewExampleUIFactory addLabelWithTitle:@"RightBottom"
                                              inView:self];
    [self addSubview:self.bottomRightSibling];
}

- (void)addTopLeftExamples {
    self.topLeftSibling = [[UIView alloc] initWithFrame:CGRectZero];
    self.topLeftSibling.backgroundColor = [UIColor blueColor];

    self.aboveLeft = [MCUIViewExampleUIFactory addLabelWithTitle:@"AboveLeft"
                                                   inView:self];
    self.belowLeft = [MCUIViewExampleUIFactory addLabelWithTitle:@"BelowLeft"
                                                   inView:self];
    self.leftTop = [MCUIViewExampleUIFactory addLabelWithTitle:@"LeftTop"
                                                  inView:self];
    self.rightTop = [MCUIViewExampleUIFactory addLabelWithTitle:@"RightTop"
                                                   inView:self];
    [self addSubview:self.topLeftSibling];
}

- (void)addCenteredExamples {
    self.centeredSibling = [[UIView alloc] initWithFrame:CGRectZero];
    self.centeredSibling.backgroundColor = [UIColor blueColor];

    self.aboveCentered = [MCUIViewExampleUIFactory addLabelWithTitle:@"Abovecentered"
                                                   inView:self];
    self.belowCentered = [MCUIViewExampleUIFactory addLabelWithTitle:@"Belowcentered"
                                                   inView:self];
    self.leftCentered = [MCUIViewExampleUIFactory addLabelWithTitle:@"LCentered"
                                                  inView:self];
    self.rightCentered = [MCUIViewExampleUIFactory addLabelWithTitle:@"RCentered"
                                                   inView:self];
    [self addSubview:self.centeredSibling];
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
    [self layoutCenteredExamples];
    [self layouTopLeftExamples];
    [self layoutBottomRightExamples];
}

- (void)layoutBottomRightExamples {
    UIEdgeInsets margins = UIEdgeInsetsMake(50, 15, 50, 25);
    [self.bottomRightSibling mc_setPosition:MCViewPositionBottom withMargins:margins
                                                          size:CGSizeMake(30, 30)];
    margins = UIEdgeInsetsMake(2, 4, 6, 8);
    [self.aboveRight mc_setRelativePosition:MCViewRelativePositionAboveAlignedRight toView:self.bottomRightSibling
                                withMargins:margins];
    [self.belowRight mc_setRelativePosition:MCViewRelativePositionUnderAlignedRight toView:self.bottomRightSibling
                                withMargins:margins];
    [self.leftBottom mc_setRelativePosition:MCViewRelativePositionToTheLeftAlignedBottom toView:self.bottomRightSibling
                                withMargins:margins];
    [self.rightBottom mc_setRelativePosition:MCViewRelativePositionToTheRightAlignedBottom toView:self.bottomRightSibling
                                 withMargins:margins];
}

- (void)layouTopLeftExamples {
    UIEdgeInsets margins = UIEdgeInsetsMake(50, 15, 20, 25);
    [self.topLeftSibling mc_setPosition:MCViewPositionTop withMargins:margins
                                                              size:CGSizeMake(30, 30)];
    margins = UIEdgeInsetsMake(2, 4, 6, 8);
    [self.aboveLeft mc_setRelativePosition:MCViewRelativePositionAboveAlignedLeft toView:self.topLeftSibling
                               withMargins:margins];
    [self.belowLeft mc_setRelativePosition:MCViewRelativePositionUnderAlignedLeft toView:self.topLeftSibling
                               withMargins:margins];
    [self.leftTop mc_setRelativePosition:MCViewRelativePositionToTheLeftAlignedTop toView:self.topLeftSibling
                             withMargins:margins];
    [self.rightTop mc_setRelativePosition:MCViewRelativePositionToTheRightAlignedTop toView:self.topLeftSibling
                              withMargins:margins];
}

- (void)layoutCenteredExamples {
    UIEdgeInsets margins = UIEdgeInsetsMake(10, 15, 20, 25);
    [self.centeredSibling mc_setPosition:MCViewPositionCenter withMargins:margins
                                                              size:CGSizeMake(80, 40)];


    [self.aboveCentered mc_setRelativePosition:MCViewRelativePositionAboveCentered toView:self.centeredSibling
                                   withMargins:margins];
    [self.belowCentered mc_setRelativePosition:MCViewRelativePositionUnderCentered toView:self.centeredSibling
                                   withMargins:margins];
    [self.leftCentered mc_setRelativePosition:MCViewRelativePositionToTheLeftCentered toView:self.centeredSibling
                                  withMargins:margins];
    [self.rightCentered mc_setRelativePosition:MCViewRelativePositionToTheRightCentered toView:self.centeredSibling
                                   withMargins:margins];
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