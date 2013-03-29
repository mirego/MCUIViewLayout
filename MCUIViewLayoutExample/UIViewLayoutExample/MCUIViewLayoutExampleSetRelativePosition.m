//
//  MCUIViewLayoutExampleSetRelativePosition
//  UIViewLayoutExample
//
//  Created by mlefrancois on 2013-03-29
//  Copyright (c) 2013 Mirego Inc. All rights reserved.
//


#import "MCUIViewLayoutExampleSetRelativePosition.h"

//------------------------------------------------------------------------------
#pragma mark MCUIViewLayoutExampleSetRelativePosition (Privates methods)
//------------------------------------------------------------------------------
@interface MCUIViewLayoutExampleSetRelativePosition ()
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