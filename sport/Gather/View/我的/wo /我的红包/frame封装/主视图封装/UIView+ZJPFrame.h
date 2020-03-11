//
//  UIView+ZJPFrame.h
//  Button加bottomView
//
//  Created by test on 2020/2/12.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/*
 分类里只能声明方法，不能声成员变量
 在分类声明属性是没有成员变量的，只有getter和setter方法
 */
@interface UIView (ZJPFrame)
// x值
@property CGFloat yj_x;
// y值
@property CGFloat yj_y;
// 宽度
@property CGFloat yj_width;
// 高度
@property CGFloat yj_height;
// centerX
@property CGFloat yj_centerX;
// centerY
@property CGFloat yj_centerY;
@end

NS_ASSUME_NONNULL_END
