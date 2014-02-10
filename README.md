# MCUIViewLayout - Layouting enhancements to UIView
[![Badge w/ Version](https://cocoapod-badges.herokuapp.com/v/MCUIViewLayout/badge.png)](https://cocoadocs.org/docsets/MCUIViewLayout)
[![Badge w/ Platform](https://cocoapod-badges.herokuapp.com/p/MCUIViewLayout/badge.png)](https://cocoadocs.org/docsets/MCUIViewLayout)
[![Build Status](https://travis-ci.org/mirego/MCUIViewLayout.png?branch=master)](https://travis-ci.org/mirego/MCUIViewLayout)
[![Coverage Status](https://coveralls.io/repos/mirego/MCUIViewLayout/badge.png?branch=master)](https://coveralls.io/r/mirego/MCUIViewLayout?branch=master)

MCUIViewLayout is a category added over [`UIView`](http://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIView_Class/)
to make layouting the views easier. It provide shortcut methods to set width, height, position based without the need
to always resort to using [`CGGeometry`](https://developer.apple.com/library/mac/#documentation/graphicsimaging/reference/CGGeometry/Reference/reference.html)
functions.


## Using

All methods are prefixed `mc_` at the moment. This is to avoid colisions as described in
[Programming with Objective-C](http://developer.apple.com/library/ios/#documentation/cocoa/conceptual/ProgrammingWithObjectiveC/CustomizingExistingClasses/CustomizingExistingClasses.html).


### Change z-ordering of a view

You've just added a view and need it bellow all other views or the other way
around? Don't need to play with the `subviews` array of the `superview`.

```objective-c
- (void)funWithZOrdering
{
  UIView *view = [[UIView alloc] init];

  [view mc_bringToFront];
  [view mc_sendToBack];
}
```

### Managing the size of the view

Using `setFrame:` or `setBounds:` just to change the size is a pain because
one need to preserve positioning. Here are some convinience methods to do so.

```objective-c
- (void)funWithSize
{
  UIView *view = [[UIView alloc] init];

  // set only width
  view.mc_width = 42;
  [view mc_setWidth:42];

  // set only height
  view.mc_height = 12;
  [view mc_setHeight:12];

  // Set both with and height
  view.mc_size = CGSizeMake(42,12);
  [view mc_setSize:CGSizeMake(42,12)];
}
```

### Absolute positioning

Using `setFrame:` or `setBounds:` just to change the position is wonky because
one needs to preserve the size.

```objective-c
- (void)funWithPositions
{
  UIView *view = [[UIView alloc] init];

  // X position
  view.mc_xPosition = 44;
  [view mc_positionAtX:44];

  // Y position
  view.mc_yPosition = 22;
  [view mc_positionAtY:22];

  // Set both x and y position
  view.mc_origin = CGPointMake(44,22);
  [view mc_setOrigin:CGSizeMake(44,22)];

  // ... or use combo methods
  [view mc_positionAtX:44 andY:22];
  [view mc_positionAtX:44 andY:22 withWidth:42];
  [view mc_positionAtX:44 andY:22 withHeight:12];
  [view mc_positionAtX:44 withHeight:12];
}
```

### Positioning in superview

```objective-c
- (void)funWithSuperview
{
  UIView *view = [[UIView alloc] init];

  // +---------------------+
  // |             ***     |
  // |             ***     |
  // |                     |
  // +---------------------+
  [view mc_positionRightOfSuperViewWithSpacing:5];

  // +---------------------+
  // |     ***             |
  // |     ***             |
  // |                     |
  // +---------------------+
  [view mc_positionLeftOfSuperViewWithSpacing:5];

  // +---------------------+
  // |                     |
  // |                     |
  // |***                  |
  // |***                  |
  // |                     |
  // |                     |
  // |                     |
  // |                     |
  // +---------------------+
  [view mc_positionTopOfSuperViewWithSpacing:2];

  // +---------------------+
  // |                     |
  // |                     |
  // |                     |
  // |                     |
  // |***                  |
  // |***                  |
  // |                     |
  // |                     |
  // +---------------------+
  [view mc_positionBottomOfSuperViewWithSpacing:2];


  // +---------------------+
  // |                     |
  // |                     |
  // |         ***         |
  // |         ***         |
  // |                     |
  // |                     |
  // +---------------------+
  [view mc_centerInSuperView];

  // Centered minus 1/8th of the height of the superview
  [view mc_centerInSuperView];
}
```


Or if you prefer being more specific about your positions use MCViewPosition and
[`UIEdgeInsets`](http://developer.apple.com/library/ios/#documentation/uikit/reference/UIKitDataTypesReference/Reference/reference.html)
thanks to [`UIEdgeInsetMake(top,left,bottom,right)`](http://developer.apple.com/library/ios/#documentation/uikit/reference/UIKitFunctionReference/Reference/reference.html#//apple_ref/c/func/UIEdgeInsetsMake)
and [`UIEdgeInsetZero`](http://developer.apple.com/library/ios/#documentation/uikit/reference/UIKitConstantsReference/Reference/reference.html#//apple_ref/c/data/UIEdgeInsetsZero)

```objective-c
- (void)evenMoreFunWithPositioningAndSuperviews
{
  UIView *view = [[UIView alloc] init];

  // Just position
  [view mc_setPosition:MCViewPositionCenter withMargins:UIEdgeInsetZero] // Same as mc_centerInSuperView

  // Position and size in one.
  [view mc_setPosition:MCViewPositionBottomRight withMargins:UIEdgeInsetMake(0,0,10,20) size:CGSizeMake(100,200)];
  // Above is equivalent to:
  // [view mc_setWidth:100];
  // [view mc_setHeight:200];
  // [view mc_positionRightOfSuperViewWithSpacing:20];
  // [view mc_positionBottomOfSuperViewWithSpacing:10];
}
```

The different MCViewPosition options:

```objective-c
// MCViewPosition
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
```


### Positioning view relative to other views


```objective-c
- (void)funWithRelativePositioning
{
  UIView *view = [[UIView alloc] init];
  UIView *otherView = [[UIView alloc] init];

  // centers "view" directly above "otherView" with no margin
  [view mc_setPosition:MCViewRelativePositionAboveCentered relativeToView:otherView withMargins:UIEdgeInsetZero];

  // position "view" left of "otherView" centered horizontally.
  [view mc_setPosition:MCViewRelativePositionToTheLeftCentered relativeToView:otherView withMargins:UIEdgeInsetZero size:CGSizeMake(100,200)];


  // center view inside otherview
  [view mc_setPosition:MCViewPositionCenter inView:otherView withMargins:UIEdgeInsetZero]
  // ... same with size
  [view mc_setPosition:MCViewPositionCenter inView:otherView withMargins:UIEdgeInsetZero size:CGSizeMake(100,200)];
}
```

For all relative view positioning options

```objective-c
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
```


### And more...

Not all the positioning methods are described here. This is still a work in progress. Find all the positiong methods in
[`UIView.MCLayout.h`](https://github.com/mirego/MCUIViewLayout/blob/master/MCUIViewLayout/UIView%2BMCLayout.h).


## Adding to your project

If you're using [`CocoaPods`](http://cocoapods.org/), there's nothing simpler.
Add the following to your [`Podfile`](http://docs.cocoapods.org/podfile.html)
and run `pod install`

```
pod 'MCUIViewLayout', :git => 'https://github.com/mirego/MCUIViewLayout.git'
```

Don't forget to `#import "UIView+MCLayout.h"` where it's needed.


## License

MCUIViewLayout is © 2013 [Mirego](http://www.mirego.com) and may be freely
distributed under the [New BSD license](http://opensource.org/licenses/BSD-3-Clause).
See the [`LICENSE.md`](https://github.com/mirego/MCUIViewLayout/blob/master/LICENSE.md) file.

## About Mirego

[Mirego](http://mirego.com) is a team of passionate people who believe that work is a place where you can innovate and have fun. We're a team of [talented people](http://life.mirego.com) who imagine and build beautiful Web and mobile applications. We come together to share ideas and [change the world](http://mirego.org).

We also [love open-source software](http://open.mirego.com) and we try to give back to the community as much as we can.
