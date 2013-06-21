//
// Created by Mathieu Baron on 2013-05-17.
// Copyright (c) 2013 Mirego, Inc. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSInteger, MCViewPosition) {
    MCViewPositionCenter    = (0x1 << 0), // => 0x00000001
    MCViewPositionTop       = (0x1 << 1), // => 0x00000010
    MCViewPositionBottom    = (0x1 << 2), // => 0x00000100
    MCViewPositionLeft      = (0x1 << 3), // => 0x00001000
    MCViewPositionRight     = (0x1 << 4), // => 0x00010000
    MCViewPositionTopLeft     = MCViewPositionTop | MCViewPositionLeft,
    MCViewPositionTopRight    = MCViewPositionTop | MCViewPositionRight,
    MCViewPositionBottomLeft  = MCViewPositionBottom | MCViewPositionLeft,
    MCViewPositionBottomRight = MCViewPositionBottom | MCViewPositionRight,
    MCViewPositionCenterLeft  = MCViewPositionCenter | MCViewPositionLeft,
    MCViewPositionCenterRight = MCViewPositionCenter | MCViewPositionRight
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