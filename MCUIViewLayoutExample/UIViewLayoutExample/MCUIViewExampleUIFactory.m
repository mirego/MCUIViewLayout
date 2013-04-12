//
//  MCUIViewExampleUIFactory
//  UIViewLayoutExample
//
//  Created by mlefrancois on 2013-03-29
//  Copyright (c) 2013 Mirego Inc. All rights reserved.
//


#import "MCUIViewLayoutExampleSetPosition.h"
#import "MCUIViewExampleUIFactory.h"

//------------------------------------------------------------------------------
#pragma mark - MCUIViewExampleUIFactory
//------------------------------------------------------------------------------
@interface MCUIViewExampleUIFactory ()

@end

@implementation MCUIViewExampleUIFactory {

}

//------------------------------------------------------------------------------
#pragma mark constructors and destructor
//------------------------------------------------------------------------------
- (id)init {
    self = [super init];
    if (self) {

    }

    return self;
}

//- (void)dealloc { 
//
//}
//------------------------------------------------------------------------------
#pragma mark setters and getters
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
#pragma mark public methods
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
#pragma mark private methods
//------------------------------------------------------------------------------
+ (UILabel *)addLabelWithTitle:(NSString *)title inView:(UIView *)view {
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    [label sizeToFit];
    [view addSubview:label];
    return label;
}
@end