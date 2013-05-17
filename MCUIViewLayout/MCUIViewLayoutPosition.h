//
// Created by Mathieu Baron on 2013-05-17.
// Copyright (c) 2013 Mirego, Inc. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MCViewPosition) {
    MCViewPositionCenter,
    MCViewPositionTop,
    MCViewPositionBottom,
    MCViewPositionCenterRight,
    MCViewPositionCenterLeft,
    MCViewPositionTopLeft,
    MCViewPositionTopRight,
    MCViewPositionBottomLeft,
    MCViewPositionBottomRight,
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
+ (CGRect)positionRect:(CGRect)rect atPosition:(enum MCViewPosition)position inRect:(CGRect)targetRect withMargin:(UIEdgeInsets const)margin;
@end