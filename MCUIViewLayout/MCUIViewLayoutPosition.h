//
// Created by Mathieu Baron on 2013-05-17.
// Copyright (c) 2013 Mirego, Inc. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSInteger, MCViewPosition) {
    MCViewPositionToTheLeft        = (0x1 << 0),
    MCViewPositionLeft             = (0x1 << 1),
    MCViewPositionHorizontalCenter = (0x1 << 2),
    MCViewPositionRight            = (0x1 << 3),
    MCViewPositionToTheRight       = (0x1 << 4),

    MCViewPositionAbove            = (0x1 << 5),
    MCViewPositionTop              = (0x1 << 6),
    MCViewPositionVerticalCenter   = (0x1 << 7),
    MCViewPositionBottom           = (0x1 << 8),
    MCViewPositionUnder            = (0x1 << 9),

    MCViewPositionFitWidth         = (0x1 << 20),
    MCViewPositionFitHeight         = (0x1 << 21),

    // Position inside another rect
    MCViewPositionTopLeft       = MCViewPositionTop | MCViewPositionLeft,
    MCViewPositionTopHCenter    = MCViewPositionTop | MCViewPositionHorizontalCenter,
    MCViewPositionTopRight      = MCViewPositionTop | MCViewPositionRight,

    MCViewPositionBottomLeft    = MCViewPositionBottom | MCViewPositionLeft,
    MCViewPositionBottomHCenter = MCViewPositionBottom | MCViewPositionHorizontalCenter,
    MCViewPositionBottomRight   = MCViewPositionBottom | MCViewPositionRight,

    MCViewPositionVCenterLeft   = MCViewPositionVerticalCenter | MCViewPositionLeft,
    MCViewPositionCenters       = MCViewPositionVerticalCenter | MCViewPositionHorizontalCenter,
    MCViewPositionVCenterRight  = MCViewPositionVerticalCenter | MCViewPositionRight,

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

@end
