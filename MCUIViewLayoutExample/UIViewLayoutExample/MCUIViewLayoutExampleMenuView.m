//
//  MCUIViewLayoutExampleMenuView
//  UIViewLayoutExample
//
//  Created by mlefrancois on 2013-03-29
//  Copyright (c) 2013 Mirego Inc. All rights reserved.
//


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

    [self.buttonSetRelativePosition mc_setPosition:MCViewRelativePositionUnderCentered
                                    relativeToView:self.buttonSetPosition withMargins:UIEdgeInsetsMake(15.0f, 0, 0, 0)];
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