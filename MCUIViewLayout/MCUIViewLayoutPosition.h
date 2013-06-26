//
// Created by Mathieu Baron on 2013-05-17.
// Copyright (c) 2013 Mirego, Inc. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSInteger, MCViewPosition) {
    MCViewPositionHCenter       = (0x1 << 0),
    MCViewPositionVCenter       = (0x1 << 1),
    MCViewPositionTop           = (0x1 << 2),
    MCViewPositionBottom        = (0x1 << 3),
    MCViewPositionLeft          = (0x1 << 4),
    MCViewPositionRight         = (0x1 << 5),

    MCViewPositionTopLeft       = MCViewPositionTop | MCViewPositionLeft,
    MCViewPositionTopHCenter    = MCViewPositionTop | MCViewPositionHCenter,
    MCViewPositionTopRight      = MCViewPositionTop | MCViewPositionRight,

    MCViewPositionBottomLeft    = MCViewPositionBottom | MCViewPositionLeft,
    MCViewPositionBottomHCenter = MCViewPositionBottom | MCViewPositionHCenter,
    MCViewPositionBottomRight   = MCViewPositionBottom | MCViewPositionRight,

    MCViewPositionVCenterLeft   = MCViewPositionVCenter | MCViewPositionLeft,
    MCViewPositionCenters       = MCViewPositionVCenter | MCViewPositionHCenter,
    MCViewPositionVCenterRight  = MCViewPositionVCenter | MCViewPositionRight
};

typedef NS_ENUM(NSInteger, MCViewRelativePosition) {
    MCViewRelativePositionAboveAlignedLeft,
    MCViewRelativePositionAboveCentered,
    MCViewRelativePositionAboveAlignedRight,
    MCViewRelativePositionToTheRightAlignedTop,
    MCViewRelativePositionToTheRightCentered,
    MCViewRelativePositionToTheRightAlignedBottom,
    MCViewRelativePositionToTheLeftAlignedTop,
    MCViewRelativePositionToTheLeftCentered,
    MCViewRelativePositionToTheLeftAlignedBottom,
    MCViewRelativePositionUnderAlignedLeft,
    MCViewRelativePositionUnderCentered,
    MCViewRelativePositionUnderAlignedRight
};

@interface MCUIViewLayoutPosition : NSObject

+ (CGRect)positionRect:(CGRect)rect atPosition:(MCViewPosition)position inRect:(CGRect)targetRect withMargins:(UIEdgeInsets const)margins;

+ (CGRect)relativePositionRect:(CGRect)rect atPosition:(MCViewRelativePosition)position inRect:(CGRect)targetRect withMargins:(UIEdgeInsets const)margins;

@end
