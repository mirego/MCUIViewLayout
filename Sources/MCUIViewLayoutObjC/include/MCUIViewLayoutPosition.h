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

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, MCViewPosition) {
    MCViewPositionToTheLeft         = (0x1 << 0),
    MCViewPositionLeft              = (0x1 << 1),
    MCViewPositionHorizontalCenter  = (0x1 << 2),
    MCViewPositionRight             = (0x1 << 3),
    MCViewPositionToTheRight        = (0x1 << 4),
    
    MCViewPositionAbove             = (0x1 << 5),
    MCViewPositionTop               = (0x1 << 6),
    MCViewPositionVerticalCenter    = (0x1 << 7),
    MCViewPositionBottom            = (0x1 << 8),
    MCViewPositionUnder             = (0x1 << 9),
    
    MCViewPositionFitWidth          = (0x1 << 20),
    MCViewPositionFitHeight         = (0x1 << 21),
    
    MCViewPositionFitParentHeight   = (0x1 << 25),
    MCViewPositionFitParentWidth    = (0x1 << 26),
    MCViewPositionHCenterInParent   = (0x1 << 27),
    MCViewPositionVCenterInParent   = (0x1 << 28),
    
    // Position inside another rect
    MCViewPositionTopLeft = MCViewPositionTop | MCViewPositionLeft,
    MCViewPositionTopHCenter = MCViewPositionTop | MCViewPositionHorizontalCenter,
    MCViewPositionTopRight = MCViewPositionTop | MCViewPositionRight,
    
    MCViewPositionBottomLeft = MCViewPositionBottom | MCViewPositionLeft,
    MCViewPositionBottomHCenter = MCViewPositionBottom | MCViewPositionHorizontalCenter,
    MCViewPositionBottomRight = MCViewPositionBottom | MCViewPositionRight,
    
    MCViewPositionVCenterLeft = MCViewPositionVerticalCenter | MCViewPositionLeft,
    MCViewPositionCenters = MCViewPositionVerticalCenter | MCViewPositionHorizontalCenter,
    MCViewPositionVCenterRight = MCViewPositionVerticalCenter | MCViewPositionRight,
    
    // Position outside another rect
    MCViewRelativePositionAboveAlignedLeft = MCViewPositionAbove | MCViewPositionLeft,
    MCViewRelativePositionAboveCentered = MCViewPositionAbove | MCViewPositionHorizontalCenter,
    MCViewRelativePositionAboveAlignedRight = MCViewPositionAbove | MCViewPositionRight,
    
    MCViewRelativePositionToTheRightAlignedTop = MCViewPositionTop | MCViewPositionToTheRight,
    MCViewRelativePositionToTheRightCentered = MCViewPositionVerticalCenter | MCViewPositionToTheRight,
    MCViewRelativePositionToTheRightAlignedBottom = MCViewPositionBottom | MCViewPositionToTheRight,
    
    MCViewRelativePositionToTheLeftAlignedTop = MCViewPositionToTheLeft | MCViewPositionTop,
    MCViewRelativePositionToTheLeftCentered = MCViewPositionToTheLeft | MCViewPositionVerticalCenter,
    MCViewRelativePositionToTheLeftAlignedBottom = MCViewPositionToTheLeft | MCViewPositionBottom,
    
    MCViewRelativePositionUnderAlignedLeft = MCViewPositionLeft | MCViewPositionUnder,
    MCViewRelativePositionUnderCentered = MCViewPositionHorizontalCenter | MCViewPositionUnder,
    MCViewRelativePositionUnderAlignedRight = MCViewPositionRight | MCViewPositionUnder
};

@interface MCUIViewLayoutPosition : NSObject

+ (CGRect)positionRect:(CGRect)rect atPosition:(MCViewPosition)position inRect:(CGRect)targetRect withMargins:(UIEdgeInsets const)margins;

+ (CGRect)relativePositionRect:(CGRect)rect atPosition:(MCViewPosition)position inRect:(CGRect)targetRect withMargins:(UIEdgeInsets const)margins;

+ (CGFloat)ceilFloatToDisplayScale:(CGFloat)number;

+ (CGFloat)roundFloatToDisplayScale:(CGFloat)number;

+ (CGFloat)floorFloatToDisplayScale:(CGFloat)number;

@end
