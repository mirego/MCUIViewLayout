//
//  UIView+MCLayoutCalculation.h
//  UIViewLayoutExample
//
//  Created by Marc Lefrancois on 2015-11-13.
//  Copyright © 2015 Mirego, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCUIViewLayoutPosition.h"

@interface UIView (MCLayoutCalculation)
- (CGRect)mc_getRectForPosition:(MCViewPosition)position;
- (CGRect)mc_getRectForPosition:(MCViewPosition)position withMargins:(UIEdgeInsets)margins;
- (CGRect)mc_getRectForPosition:(MCViewPosition)position withMargins:(UIEdgeInsets)margins size:(CGSize) size;

- (CGRect)mc_getRectForPosition:(MCViewPosition)position inView:(UIView *)view;
- (CGRect)mc_getRectForPosition:(MCViewPosition)position inView:(UIView *)view withMargins:(UIEdgeInsets)margins;
- (CGRect)mc_getRectForPosition:(MCViewPosition)position inView:(UIView *)view withMargins:(UIEdgeInsets)margins size:(CGSize) size;

- (CGRect)mc_getRectForRelativePosition:(MCViewPosition)position toView:(UIView *)view;
- (CGRect)mc_getRectForRelativePosition:(MCViewPosition)position toView:(UIView *)view withMargins:(UIEdgeInsets)margins;
- (CGRect)mc_getRectForRelativePosition:(MCViewPosition)position toView:(UIView *)view withMargins:(UIEdgeInsets)margins size:(CGSize) size;
@end
