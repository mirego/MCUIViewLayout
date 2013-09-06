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

#import "MCUIViewLayoutExampleSpecialCases.h"
#import "MCUIViewExampleUIFactory.h"
#import "UIView+MCLayout.h"

//------------------------------------------------------------------------------
#pragma mark - MCUIViewLayoutExampleSpecialCases
//------------------------------------------------------------------------------
@interface MCUIViewLayoutExampleSpecialCases ()

@property(nonatomic) UILabel *container;
@property(nonatomic) UILabel *firstView;
@property(nonatomic) UILabel *secondView;
@property(nonatomic) UILabel *thirdView;
@end

@implementation MCUIViewLayoutExampleSpecialCases
{

}

//------------------------------------------------------------------------------
#pragma mark constructors and destructor
//------------------------------------------------------------------------------
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)]];
        self.backgroundColor = [UIColor darkGrayColor];
        self.container = [MCUIViewExampleUIFactory addLabelWithTitle:@"" inView:self];
        self.container.backgroundColor = [UIColor whiteColor];
        
        self.firstView = [MCUIViewExampleUIFactory addLabelWithTitle:@"first" inView:self.container];
        self.firstView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
        
        self.secondView = [MCUIViewExampleUIFactory addLabelWithTitle:@"second" inView:self.container];
        self.secondView.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.3];

        self.thirdView = [MCUIViewExampleUIFactory addLabelWithTitle:@"third" inView:self.container];
        self.thirdView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    }

    return self;
}

- (void)close
{
    [self removeFromSuperview];
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
- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.container mc_setPosition:MCViewPositionVerticalCenter|MCViewPositionFitWidth withMargins:UIEdgeInsetsMake(0, 15, 0, 15) size:CGSizeMake(100, 105)];
    [self.firstView mc_setPosition:MCViewPositionTopLeft| MCViewPositionFitHeight withMargins:UIEdgeInsetsMake(2, 0, 2, 0) size:CGSizeMake(55, 100)];
    [self.secondView mc_setRelativePosition:MCViewPositionToTheRight | MCViewPositionFitHeight toView:self.firstView withMargins:UIEdgeInsetsMake(0, 3, 0, 0) size:CGSizeMake(55, 100)];
    [self.thirdView mc_setRelativePosition:MCViewPositionToTheRight | MCViewPositionFitHeight toView:self.secondView withMargins:UIEdgeInsetsMake(0, 3, 0, 0) size:CGSizeMake(55, 100)];
}

//------------------------------------------------------------------------------
#pragma mark private methods
//------------------------------------------------------------------------------
@end