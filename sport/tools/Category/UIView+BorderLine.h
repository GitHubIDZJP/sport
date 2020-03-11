//
//  UIView+BorderLine.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/16.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
//枚举
typedef NS_OPTIONS(NSUInteger, UIBorderSideType) {
    UIBorderSideTypeAll  = 0,
    UIBorderSideTypeTop = 1 << 0,
    UIBorderSideTypeBottom = 1 << 1,
    UIBorderSideTypeLeft = 1 << 2,
    UIBorderSideTypeRight = 1 << 3,
};
NS_ASSUME_NONNULL_BEGIN

@interface UIView (BorderLine)
//设置border颜色  宽度  类型  
- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType;
//-(Boolean)isShadow:(Boolean)s;

-(void)setShaddowColor:(UIColor*)sC;//设置颜色
-(void)setShadowOffSetX:(float)sizeX ShadowOffSetY:(float)sizeY;//设置偏移量
-(void)setShadowOpacity:(float)shadowOpacity;//设置透明度
-(void)changeFrameX:(int)frameX  FrameW:(int)frameW ;
@end

NS_ASSUME_NONNULL_END
