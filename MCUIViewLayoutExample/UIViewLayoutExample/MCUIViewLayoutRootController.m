//
//  MCUIViewLayoutRootController
//  UIViewLayoutExample
//
//  Created by mlefrancois on 2013-03-28
//  Copyright (c) 2013 Mirego Inc. All rights reserved.
//


#import "MCUIViewLayoutRootController.h"
#import "MCUIViewLayoutExampleRootView.h"

//------------------------------------------------------------------------------
#pragma mark MCUIViewLayoutRootController (privates methods)
//------------------------------------------------------------------------------
@interface MCUIViewLayoutRootController ()

@end

//------------------------------------------------------------------------------
#pragma mark - MCUIViewLayoutRootController implementation
//------------------------------------------------------------------------------
@implementation MCUIViewLayoutRootController
//------------------------------------------------------------------------------
#pragma mark Constructors and destructor
//------------------------------------------------------------------------------
- (id) init {

    self = [super init];
    if (self) {

    }
    return self;
}

- (void)deallocViews {
}

- (void)dealloc {
    [self deallocViews];
}
//------------------------------------------------------------------------------
#pragma mark Setters and getters
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
#pragma mark Controller events
//------------------------------------------------------------------------------
- (void)loadView {
    self.view = [[MCUIViewLayoutExampleRootView alloc] init];


}

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//}

- (void)viewDidUnload {
    [self deallocViews];
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//}

//- (void) viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//}

//- (void) viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//}

//- (void) viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//}

//------------------------------------------------------------------------------
#pragma mark Memory management
//------------------------------------------------------------------------------
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//}

//------------------------------------------------------------------------------
#pragma mark Orientation management
//------------------------------------------------------------------------------
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}

//------------------------------------------------------------------------------
#pragma mark Public methods
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
#pragma mark Private methods
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
#pragma mark Control events
//------------------------------------------------------------------------------

@end
