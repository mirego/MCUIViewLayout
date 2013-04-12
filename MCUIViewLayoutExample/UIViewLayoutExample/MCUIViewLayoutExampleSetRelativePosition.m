//
//  MCUIViewLayoutExampleSetRelativePosition
//  UIViewLayoutExample
//
//  Created by mlefrancois on 2013-03-29
//  Copyright (c) 2013 Mirego Inc. All rights reserved.
//


#import "MCUIViewLayoutExampleSetRelativePosition.h"
#import "MCUIViewExampleUIFactory.h"
#import "UIView+MCLayout.h"

//------------------------------------------------------------------------------
#pragma mark MCUIViewLayoutExampleSetRelativePosition (Privates methods)
//------------------------------------------------------------------------------
@interface MCUIViewLayoutExampleSetRelativePosition ()
@property(nonatomic) UIView *centeredSibling;
@property(nonatomic) UILabel * aboveCentered;
@property(nonatomic) UILabel *belowCentered;
@property(nonatomic, strong) UILabel *leftCentered;
@property(nonatomic, strong) UILabel *rightCentered;
@property(nonatomic, strong) UIView *topLeftSibling;
@property(nonatomic, strong) UILabel *aboveLeft;
@property(nonatomic, strong) UILabel *belowLeft;
@property(nonatomic, strong) UILabel *leftTop;
@property(nonatomic, strong) UILabel *rightTop;
@property(nonatomic, strong) UIView *bottomRightSibling;
@property(nonatomic, strong) UILabel *aboveRight;
@property(nonatomic, strong) UILabel *belowRight;
@property(nonatomic, strong) UILabel *leftBottom;
@property(nonatomic, strong) UILabel *rightBottom;
@end

//------------------------------------------------------------------------------
#pragma mark - MCUIViewLayoutExampleSetRelativePosition implementation
//------------------------------------------------------------------------------
@implementation MCUIViewLayoutExampleSetRelativePosition
//------------------------------------------------------------------------------
#pragma mark Constructors and destructor
//------------------------------------------------------------------------------
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)]];
        [self addCenteredExamples];
        [self addTopLeftExamples];
        [self addBottomRightExamples];

    }
    return self;
}

- (void)addBottomRightExamples {
    self.bottomRightSibling = [[UIView alloc] initWithFrame:CGRectZero];
    self.bottomRightSibling.backgroundColor = [UIColor blueColor];

    self.aboveRight = [MCUIViewExampleUIFactory addLabelWithTitle:@"AboveRight"
                                               inView:self];
    self.belowRight = [MCUIViewExampleUIFactory addLabelWithTitle:@"BelowRight"
                                               inView:self];
    self.leftBottom = [MCUIViewExampleUIFactory addLabelWithTitle:@"LeftBottom"
                                             inView:self];
    self.rightBottom = [MCUIViewExampleUIFactory addLabelWithTitle:@"RightBottom"
                                              inView:self];
    [self addSubview:self.bottomRightSibling];
}

- (void)addTopLeftExamples {
    self.topLeftSibling = [[UIView alloc] initWithFrame:CGRectZero];
    self.topLeftSibling.backgroundColor = [UIColor blueColor];

    self.aboveLeft = [MCUIViewExampleUIFactory addLabelWithTitle:@"AboveLeft"
                                                   inView:self];
    self.belowLeft = [MCUIViewExampleUIFactory addLabelWithTitle:@"BelowLeft"
                                                   inView:self];
    self.leftTop = [MCUIViewExampleUIFactory addLabelWithTitle:@"LeftTop"
                                                  inView:self];
    self.rightTop = [MCUIViewExampleUIFactory addLabelWithTitle:@"RightTop"
                                                   inView:self];
    [self addSubview:self.topLeftSibling];
}

- (void)addCenteredExamples {
    self.centeredSibling = [[UIView alloc] initWithFrame:CGRectZero];
    self.centeredSibling.backgroundColor = [UIColor blueColor];

    self.aboveCentered = [MCUIViewExampleUIFactory addLabelWithTitle:@"Abovecentered"
                                                   inView:self];
    self.belowCentered = [MCUIViewExampleUIFactory addLabelWithTitle:@"Belowcentered"
                                                   inView:self];
    self.leftCentered = [MCUIViewExampleUIFactory addLabelWithTitle:@"LCentered"
                                                  inView:self];
    self.rightCentered = [MCUIViewExampleUIFactory addLabelWithTitle:@"RCentered"
                                                   inView:self];
    [self addSubview:self.centeredSibling];
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
    [self layoutCenteredExamples];
    [self layouTopLeftExamples];
    [self layoutBottomRightExamples];
}

- (void)layoutBottomRightExamples {
    UIEdgeInsets margins = UIEdgeInsetsMake(50, 15, 50, 25);
    [self.bottomRightSibling mc_setPosition:MCViewPositionBottom withMargins:margins
                                                          size:CGSizeMake(30, 30)];
    margins = UIEdgeInsetsMake(2, 4, 6, 8);
    [self.aboveRight mc_setPosition:MCViewRelativePositionAboveAlignedRight relativeToView:self.bottomRightSibling
                                                                          withMargins:margins];
    [self.belowRight mc_setPosition:MCViewRelativePositionUnderAlignedRight relativeToView:self.bottomRightSibling
                                                                          withMargins:margins];
    [self.leftBottom mc_setPosition:MCViewRelativePositionToTheLeftAlignedBottom relativeToView:self.bottomRightSibling
                                                                           withMargins:margins];
    [self.rightBottom mc_setPosition:MCViewRelativePositionToTheRightAlignedBottom relativeToView:self.bottomRightSibling
                                                                             withMargins:margins];
}

- (void)layouTopLeftExamples {
    UIEdgeInsets margins = UIEdgeInsetsMake(50, 15, 20, 25);
    [self.topLeftSibling mc_setPosition:MCViewPositionTop withMargins:margins
                                                              size:CGSizeMake(30, 30)];
    margins = UIEdgeInsetsMake(2, 4, 6, 8);
    [self.aboveLeft mc_setPosition:MCViewRelativePositionAboveAlignedLeft relativeToView:self.topLeftSibling
                                                                           withMargins:margins];
    [self.belowLeft mc_setPosition:MCViewRelativePositionUnderAlignedLeft relativeToView:self.topLeftSibling
                                                                           withMargins:margins];
    [self.leftTop mc_setPosition:MCViewRelativePositionToTheLeftAlignedTop relativeToView:self.topLeftSibling
                                                                               withMargins:margins];
    [self.rightTop mc_setPosition:MCViewRelativePositionToTheRightAlignedTop relativeToView:self.topLeftSibling
                                                                                withMargins:margins];
}

- (void)layoutCenteredExamples {
    UIEdgeInsets margins = UIEdgeInsetsMake(10, 15, 20, 25);
    [self.centeredSibling mc_setPosition:MCViewPositionCenter withMargins:margins
                                                              size:CGSizeMake(80, 40)];


    [self.aboveCentered mc_setPosition:MCViewRelativePositionAboveCentered relativeToView:self.centeredSibling
                                                                           withMargins:margins];
    [self.belowCentered mc_setPosition:MCViewRelativePositionUnderCentered relativeToView:self.centeredSibling
                                                                           withMargins:margins];
    [self.leftCentered mc_setPosition:MCViewRelativePositionToTheLeftCentered relativeToView:self.centeredSibling
                                                                              withMargins:margins];
    [self.rightCentered mc_setPosition:MCViewRelativePositionToTheRightCentered relativeToView:self.centeredSibling
                                                                                withMargins:margins];
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