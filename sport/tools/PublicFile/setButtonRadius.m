//
//  setButtonRadius.m
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/17.
//  Copyright © 2019 Mac. All rights reserved.
//
#import "setButtonRadius.h"

@implementation setButtonRadius


- (void)viewRadius:(CGFloat)radius RectCorner:(UIRectCorner)corner view:(UIView *)view
{
    
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = path.CGPath;
    view.layer.mask = maskLayer;
}
@end
