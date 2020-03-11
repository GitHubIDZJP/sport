//
//  UIButton+Icon.h
//  masAddTab
//
//  Created by test on 2020/2/3.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Icon)
// 回参

/*
 ImageWithTitle:图片
 Title: 文字
 position: 位置
 font：字体
 forState：状态
 
 */
- (void)setImageWithTitle:(UIImage *)image withTitle:(NSString *)title position:(NSString *)_position font:(UIFont *)_font forState:(UIControlState)stateType;

@end

NS_ASSUME_NONNULL_END
