//
//  MCUIViewLayoutRootController
//  UIViewLayoutExample
//
//  Created by mlefrancois on 2013-03-28
//  Copyright (c) 2013 Mirego Inc. All rights reserved.
//


#import "MCUIViewLayoutRootController.h"
#import "MCUIViewLayoutExampleSetPosition.h"
#import "MCUIViewLayoutExampleMenuView.h"
#import "MCUIViewLayoutExampleSetRelativePosition.h"

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
    MCUIViewLayoutExampleMenuView *rootview = [[MCUIViewLayoutExampleMenuView alloc] init];
    [rootview.buttonSetPosition addTarget:self action:@selector(showSetPositionExample) forControlEvents:UIControlEventTouchUpInside];
    [rootview.buttonSetRelativePosition addTarget:self action:@selector(showSetRelativePositionExample) forControlEvents:UIControlEventTouchUpInside];
    self.view = rootview;
}

- (void)showSetRelativePositionExample {
    [self.view addSubview:[[MCUIViewLayoutExampleSetRelativePosition alloc] initWithFrame:self.view.bounds]];
}

- (void)showSetPositionExample {
    [self.view addSubview:[[MCUIViewLayoutExampleSetPosition alloc] initWithFrame:self.view.bounds]];
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
