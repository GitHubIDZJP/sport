//
//  UIButton+setButtonRadius.m
//  Sport
//
//  Created by test on 2020/2/24.
//  Copyright © 2020 test. All rights reserved.
//

#import "UIButton+setButtonRadius.h"

//#import <AppKit/AppKit.h>


@implementation UIButton (setButtonRadius)
- (void)viewRadius:(CGFloat)radius RectCorner:(UIRectCorner)corner view:(UIView *)view
{
    
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = path.CGPath;
    view.layer.mask = maskLayer;
    
}

- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType {
    
    if (borderType == UIBorderSideTypeAll) {
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = color.CGColor;
        return self;
    }
    
    
    /// 左侧
    if (borderType & UIBorderSideTypeLeft) {
        /// 左侧线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.f, 0.f) toPoint:CGPointMake(0.0f, self.frame.size.height) color:color borderWidth:borderWidth]];
    }
    
    /// 右侧
    if (borderType & UIBorderSideTypeRight) {
        /// 右侧线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(self.frame.size.width, 0.0f) toPoint:CGPointMake( self.frame.size.width, self.frame.size.height) color:color borderWidth:borderWidth]];
    }
    
    /// top
    if (borderType & UIBorderSideTypeTop) {
        /// top线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.0f, 0.0f) toPoint:CGPointMake(self.frame.size.width, 0.0f) color:color borderWidth:borderWidth]];
    }
    
    /// bottom
    if (borderType & UIBorderSideTypeBottom) {
        /// bottom线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.0f, self.frame.size.height) toPoint:CGPointMake( self.frame.size.width, self.frame.size.height) color:color borderWidth:borderWidth]];
    }
    
    return self;
}

- (CAShapeLayer *)addLineOriginPoint:(CGPoint)p0 toPoint:(CGPoint)p1 color:(UIColor *)color borderWidth:(CGFloat)borderWidth {
    
    /// 线的路径
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:p0];
    [bezierPath addLineToPoint:p1];
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor  = [UIColor clearColor].CGColor;
    /// 添加路径
    shapeLayer.path = bezierPath.CGPath;
    /// 线宽度
    shapeLayer.lineWidth = borderWidth;
    return shapeLayer;
}

-(void)setShaddowColor:(UIColor*)sC//设置颜色
{
    self.layer.shadowColor = sC.CGColor;
}
-(void)setShadowOffSetX:(float)sizeX ShadowOffSetY:(float)sizeY//设置偏移量
{
    self.layer.shadowOffset = CGSizeMake(sizeX, sizeY);
    
}
-(void)setShadowOpacity:(float)shadowOpacity//设置透明度
{
    
    self.layer.shadowOpacity = shadowOpacity;
    
    
}
-(void)changeFrameX:(int)frameX  FrameW:(int)frameW{
    
    CGRect frame = self.frame;
    frame.origin.x +=frameX;
    //frame.origin.y -=frameY;
    frame.size.width -=frameW;
  //  frame.size.height +=frameH;
    self.frame = frame;
}
@end
