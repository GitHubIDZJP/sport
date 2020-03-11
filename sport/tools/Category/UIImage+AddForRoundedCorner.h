//
//  UIImage+AddForRoundedCorner.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/28.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (AddForRoundedCorner)


/**
 设置一个四角圆角
 
 @param radius 圆角半径
 @param color  圆角背景色
 */
- (void)roundedCornerWithRadius:(CGFloat)radius cornerColor:(UIColor *)color;

/**
 设置一个普通圆角
 
 @param radius  圆角半径
 @param color   圆角背景色
 @param corners 圆角位置
 */
- (void)roundedCornerWithRadius:(CGFloat)radius cornerColor:(UIColor *)color corners:(UIRectCorner)corners;

/**
 设置一个带边框的圆角
 
 @param cornerRadii 圆角半径cornerRadii
 @param color       圆角背景色
 @param corners     圆角位置
 @param borderColor 边框颜色
 @param borderWidth 边框线宽
 */
- (void)roundedCornerWithCornerRadii:(CGSize)cornerRadii cornerColor:(UIColor *)color corners:(UIRectCorner)corners borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

@end

NS_ASSUME_NONNULL_END
