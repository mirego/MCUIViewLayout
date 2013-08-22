//
//  MCUIViewLayoutExampleSetPositionSizeToFit
//  UIViewLayoutExample
//
//  Created by mlefrancois on 2013-08-21
//  Copyright (c) 2013 Mirego Inc. All rights reserved.
//


#import "MCUIViewLayoutExampleSetPositionSizeToFit.h"
#import "MCUIViewExampleUIFactory.h"
#import "UIView+MCLayout.h"

//------------------------------------------------------------------------------
#pragma mark - MCUIViewLayoutExampleSetPositionSizeToFit
//------------------------------------------------------------------------------
@interface MCUIViewLayoutExampleSetPositionSizeToFit ()

@property(nonatomic, strong) UILabel *top;
@property(nonatomic, strong) UILabel *left;
@property(nonatomic, strong) UILabel *centered;
@property(nonatomic, strong) UILabel *right;
@property(nonatomic, strong) UILabel *bottom;

@end

@implementation MCUIViewLayoutExampleSetPositionSizeToFit

//------------------------------------------------------------------------------
#pragma mark constructors and destructor
//------------------------------------------------------------------------------
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor darkGrayColor];

        self.top = [MCUIViewExampleUIFactory addLabelWithTitle:@"top" inView:self];
        self.top.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];

        self.left = [MCUIViewExampleUIFactory addLabelWithTitle:@"leftCentered" inView:self];
        self.left.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
        self.centered = [MCUIViewExampleUIFactory addLabelWithTitle:@"centered" inView:self];
        self.centered.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.3];
        self.right = [MCUIViewExampleUIFactory addLabelWithTitle:@"rightCentered" inView:self];
        self.right.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];

        self.bottom = [MCUIViewExampleUIFactory addLabelWithTitle:@"bottom" inView:self];
        self.bottom.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)] ];
    }

    return self;
}
//------------------------------------------------------------------------------
#pragma mark setters and getters
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
#pragma mark public methods
//------------------------------------------------------------------------------
- (void)layoutSubviews
{
    [super layoutSubviews];
    UIEdgeInsets insets = UIEdgeInsetsMake(5, 10, 15, 20);

    [self.top mc_setPosition:MCViewPositionTopHCenter|MCViewPositionFitWidth withMargins:insets];
    [self.left mc_setPosition:MCViewPositionVCenterLeft|MCViewPositionFitHeight withMargins:insets];
    [self.bottom mc_setPosition:MCViewPositionBottomHCenter|MCViewPositionFitWidth withMargins:insets];
    [self.right mc_setPosition:MCViewPositionVCenterRight|MCViewPositionFitHeight withMargins:insets];
    [self.centered mc_setPosition:MCViewPositionCenters|MCViewPositionFitHeight|MCViewPositionFitWidth withMargins:insets];
}

//------------------------------------------------------------------------------
#pragma mark private methods
//------------------------------------------------------------------------------
- (void)close
{
    [self removeFromSuperview];
}
@end