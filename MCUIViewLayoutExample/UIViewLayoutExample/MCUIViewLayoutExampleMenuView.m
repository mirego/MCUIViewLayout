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

#import "MCUIViewLayoutExampleMenuView.h"
#import "UIView+MCLayout.h"
//------------------------------------------------------------------------------
#pragma mark MCUIViewLayoutExampleRootView (Privates methods)

//------------------------------------------------------------------------------
@interface MCUIViewLayoutExampleMenuView ()
@property (nonatomic, readwrite) UIButton *buttonSetPosition;
@property (nonatomic, readwrite) UIButton *buttonSetPositionSwift;
@property (nonatomic, readwrite) UIButton *buttonSetRelativePosition;
@property (nonatomic, readwrite) UIButton *buttonSetPositionSizeToFit;
@property (nonatomic, readwrite) UIButton *buttonSpecialCases;
@property (nonatomic, readwrite) UIButton *buttonRelativeCenterInParent;
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
        UIColor* swiftColor = [self colorFromHexString:@"#dd4d20"];

        self.buttonSetPosition = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.buttonSetPosition setTitle:@"mc_setPosition" forState:UIControlStateNormal];
        [self.buttonSetPosition sizeToFit];
        [self addSubview:self.buttonSetPosition];

        self.buttonSetPositionSwift = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.buttonSetPositionSwift setTitle:@"setPosition [Swift]" forState:UIControlStateNormal];
        [self.buttonSetPositionSwift setTitleColor:swiftColor  forState:UIControlStateNormal];
        [self.buttonSetPositionSwift sizeToFit];
        [self addSubview:self.buttonSetPositionSwift];

        self.buttonSetRelativePosition = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.buttonSetRelativePosition setTitle:@"mc_setPositionRelative" forState:UIControlStateNormal];
        [self.buttonSetRelativePosition sizeToFit];
        [self addSubview:self.buttonSetRelativePosition];

        self.buttonSetPositionSizeToFit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.buttonSetPositionSizeToFit setTitle:@"mc_setPositionWithSizeToFit" forState:UIControlStateNormal];
        [self.buttonSetPositionSizeToFit sizeToFit];
        [self addSubview:self.buttonSetPositionSizeToFit];

        self.buttonSpecialCases = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.buttonSpecialCases setTitle:@"mc_specialCases" forState:UIControlStateNormal];
        [self.buttonSpecialCases sizeToFit];
        [self addSubview:self.buttonSpecialCases];

        self.buttonRelativeCenterInParent = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.buttonRelativeCenterInParent setTitle:@"mc_RelativeCenterInParent" forState:UIControlStateNormal];
        [self.buttonRelativeCenterInParent sizeToFit];
        [self addSubview:self.buttonRelativeCenterInParent];
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
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.buttonSetPosition mc_setPosition:MCViewPositionTopHCenter withMargins:UIEdgeInsetsMake(50, 0, 0, 0)];

    [self.buttonSetPositionSwift mc_setRelativePosition:MCViewRelativePositionUnderCentered
                                                    toView:self.buttonSetPosition withMargins:UIEdgeInsetsZero];

    [self.buttonSetRelativePosition mc_setRelativePosition:MCViewRelativePositionUnderCentered
                                                    toView:self.buttonSetPositionSwift withMargins:UIEdgeInsetsMake(15.0f, 0, 0, 0)];

    [self.buttonSetPositionSizeToFit mc_setRelativePosition:MCViewRelativePositionUnderCentered
                                                     toView:self.buttonSetRelativePosition withMargins:UIEdgeInsetsMake(15.0f, 0, 0, 0)];
    [self.buttonSpecialCases mc_setRelativePosition:MCViewRelativePositionUnderCentered | MCViewPositionFitWidth
                                             toView:self.buttonSetPositionSizeToFit withMargins:UIEdgeInsetsMake(15.0f, 0, 0, 0)];
    [self.buttonRelativeCenterInParent mc_setRelativePosition:MCViewRelativePositionUnderCentered | MCViewPositionFitWidth
                                                       toView:self.buttonSpecialCases withMargins:UIEdgeInsetsMake(15.0f, 0, 0, 0)];
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

- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end