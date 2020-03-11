//
//  CustomLine.m
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/14.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "CustomLine.h"

@implementation CustomLine

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 3);  //线宽
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetRGBStrokeColor(context, 255.0 / 255.0, 255.0 / 255.0, 255.0 / 255.0, 1.0);  //线的颜色
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, 0, 0);  //起点坐标
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height);   //终点坐标
    
    CGContextStrokePath(context);
    
    
    
    
}


@end
