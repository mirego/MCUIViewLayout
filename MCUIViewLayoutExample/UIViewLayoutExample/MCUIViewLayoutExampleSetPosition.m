//
//  MCUIViewLayoutExampleSetPosition
//  UIViewLayoutExample
//
//  Created by mlefrancois on 2013-03-28
//  Copyright (c) 2013 Mirego Inc. All rights reserved.
//


#import "MCUIViewLayoutExampleSetPosition.h"
#import "UIView+MCLayout.h"
#import "MCUIViewExampleUIFactory.h"

static const int kMargin = 10;

//------------------------------------------------------------------------------
#pragma mark MCUIViewLayoutExampleSetPosition (Privates methods)
//------------------------------------------------------------------------------
@interface MCUIViewLayoutExampleSetPosition ()

@property(nonatomic, strong) UILabel *topLeft;
@property(nonatomic, strong) UILabel *top;
@property(nonatomic, strong) UILabel *topRight;
@property(nonatomic, strong) UILabel *left;
@property(nonatomic, strong) UILabel *centered;
@property(nonatomic, strong) UILabel *right;
@property(nonatomic, strong) UILabel *bottomLeft;
@property(nonatomic, strong) UILabel *bottom;
@property(nonatomic, strong) UILabel *bottomRight;
@end

//------------------------------------------------------------------------------
#pragma mark - MCUIViewLayoutExampleSetPosition implementation
//------------------------------------------------------------------------------
@implementation MCUIViewLayoutExampleSetPosition
//------------------------------------------------------------------------------
#pragma mark Constructors and destructor
//------------------------------------------------------------------------------
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        self.topLeft = [MCUIViewExampleUIFactory addLabelWithTitle:@"topLeft" inView:self];
        self.top = [MCUIViewExampleUIFactory addLabelWithTitle:@"top" inView:self];
        self.topRight = [MCUIViewExampleUIFactory addLabelWithTitle:@"topRight" inView:self];

        self.left = [MCUIViewExampleUIFactory addLabelWithTitle:@"leftCentered" inView:self];
        self.centered = [MCUIViewExampleUIFactory addLabelWithTitle:@"centered" inView:self];
        self.right = [MCUIViewExampleUIFactory addLabelWithTitle:@"rightCentered" inView:self];

        self.bottomLeft = [MCUIViewExampleUIFactory addLabelWithTitle:@"bottomLeft" inView:self];
        self.bottom = [MCUIViewExampleUIFactory addLabelWithTitle:@"bottom" inView:self];
        self.bottomRight = [MCUIViewExampleUIFactory addLabelWithTitle:@"bottomRight" inView:self];

        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)] ];
    }
    return self;
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

    [self.topLeft mc_setPosition:MCViewPositionTopLeft withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.top mc_setPosition:MCViewPositionTop withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.topRight mc_setPosition:MCViewPositionTopRight withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];

    [self.left mc_setPosition:MCViewPositionCenterLeft withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.centered mc_setPosition:MCViewPositionCenter withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.right mc_setPosition:MCViewPositionCenterRight withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];

    [self.bottomLeft mc_setPosition:MCViewPositionBottomLeft withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.bottom mc_setPosition:MCViewPositionBottom withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.bottomRight mc_setPosition:MCViewPositionBottomRight withMargins:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
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
