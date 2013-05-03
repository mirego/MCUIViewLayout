// Copyright (c) 2013, Mirego
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// - Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
// - Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
// - Neither the name of the Mirego nor the names of its contributors may
//   be used to endorse or promote products derived from this software without
//   specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

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
