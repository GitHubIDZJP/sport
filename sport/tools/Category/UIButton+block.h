//
//  UIButton+block.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/15.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (block)
/**
 添加事件
 */
- (void)addControlEvents:(UIControlEvents)controlEvents withAction:(void(^)(id sender))action;

/**
 移除事件
 */
- (void)removeControlEvents:(UIControlEvents)controlEvents;

/**
 添加事件 for key
 */
- (void)addControlEvents:(UIControlEvents)controlEvents withAction:(void(^)(id sender))action forKey:(NSString *)key;

/**
 移除事件 for key
 */
- (void)removeControlEvents:(UIControlEvents)controlEvents forKey:(NSString *)key;

/**
 添加点击事件 UIControlEventTouchUpInside
 */
- (void)addAction:(void(^)(id sender))action;

/**
 移除点击事件 UIControlEventTouchUpInside
 */
- (void)removeAction;

/**
 移除全部事件
 */
- (void)removeAllActions;
@end

NS_ASSUME_NONNULL_END
/**
 用法:
 
 
 // 一行代码给按钮添加事件
 [btn addAction:^(id sender) {
 NSLog(@"你点了我");
 }];
 添加更多事件
 
 // 添加点击事件
 [btn addAction:^(id sender) {
 NSLog(@"你点了我");
 }];
 // 移除点击事件
 [btn removeAction];
 
 // 添加按下事件
 [btn addControlEvents:UIControlEventTouchDown withAction:^(id sender) {
 NSLog(@"你按到我了，快松开！");
 }];
 // 移除按下事件
 [btn removeControlEvents:UIControlEventTouchDown];
 
 
 */
