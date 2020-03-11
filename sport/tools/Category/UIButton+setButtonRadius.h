//
//  UIButton+setButtonRadius.h
//  Sport
//
//  Created by test on 2020/2/24.
//  Copyright © 2020 test. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//枚举
typedef NS_OPTIONS(NSUInteger, UIBorderSideType) {
    UIBorderSideTypeAll  = 0,
    UIBorderSideTypeTop = 1 << 0,
    UIBorderSideTypeBottom = 1 << 1,
    UIBorderSideTypeLeft = 1 << 2,
    UIBorderSideTypeRight = 1 << 3,
};
@interface UIButton (setButtonRadius)
- (void)viewRadius:(CGFloat)radius RectCorner:(UIRectCorner)corner view:(UIView *)view;
- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType;
//-(Boolean)isShadow:(Boolean)s;

-(void)setShaddowColor:(UIColor*)sC;//设置颜色
-(void)setShadowOffSetX:(float)sizeX ShadowOffSetY:(float)sizeY;//设置偏移量
-(void)setShadowOpacity:(float)shadowOpacity;//设置透明度
-(void)changeFrameX:(int)frameX  FrameW:(int)frameW ;
/*

使用;


setButtonRadius *btn = [[setButtonRadius alloc]initWithFrame:CGRectMake(10,200,100,100)];

btn.backgroundColor = [UIColor redColor];


[btn viewRadius:20 RectCorner:UIRectCornerBottomRight | UIRectCornerBottomLeft view:btn];
[self.view addSubview:btn];

*/
@end

NS_ASSUME_NONNULL_END
