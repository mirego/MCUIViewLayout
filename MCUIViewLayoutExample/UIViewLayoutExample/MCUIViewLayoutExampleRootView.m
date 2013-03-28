//
//  MCUIViewLayoutExampleRootView
//  UIViewLayoutExample
//
//  Created by mlefrancois on 2013-03-28
//  Copyright (c) 2013 Mirego Inc. All rights reserved.
//


#import "MCUIViewLayoutExampleRootView.h"
#import "UIView+MCLayout.h"

static const int kMargin = 10;

//------------------------------------------------------------------------------
#pragma mark MCUIViewLayoutExampleRootView (Privates methods)
//------------------------------------------------------------------------------
@interface MCUIViewLayoutExampleRootView ()

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
#pragma mark - MCUIViewLayoutExampleRootView implementation
//------------------------------------------------------------------------------
@implementation MCUIViewLayoutExampleRootView
//------------------------------------------------------------------------------
#pragma mark Constructors and destructor
//------------------------------------------------------------------------------
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        self.topLeft = [self addLabelWithTitle:@"topLeft"];
        self.top = [self addLabelWithTitle:@"top"];
        self.topRight = [self addLabelWithTitle:@"topRight"];

        self.left = [self addLabelWithTitle:@"left"];
        self.centered = [self addLabelWithTitle:@"centered"];
        self.right = [self addLabelWithTitle:@"right"];

        self.bottomLeft = [self addLabelWithTitle:@"bottomLeft"];
        self.bottom = [self addLabelWithTitle:@"bottom"];
        self.bottomRight = [self addLabelWithTitle:@"bottomRight"];
    }
    return self;
}

- (UILabel *)addLabelWithTitle:(NSString *)title {
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    [label sizeToFit];
    [self addSubview:label];
    return label;
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

    [self.topLeft mc_placeAtPosition:MCViewPositionTopLeft withInset:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.top mc_placeAtPosition:MCViewPositionTop withInset:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.topRight mc_placeAtPosition:MCViewPositionTopRight withInset:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];

    [self.left mc_placeAtPosition:MCViewPositionLeft withInset:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.centered mc_placeAtPosition:MCViewPositionCenter withInset:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.right mc_placeAtPosition:MCViewPositionRight withInset:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];

    [self.bottomLeft mc_placeAtPosition:MCViewPositionBottomLeft withInset:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.bottom mc_placeAtPosition:MCViewPositionBottom withInset:UIEdgeInsetsMake(kMargin,
            kMargin, kMargin, kMargin)];
    [self.bottomRight mc_placeAtPosition:MCViewPositionBottomRight withInset:UIEdgeInsetsMake(kMargin,
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
