//
//  blockButton.h
//  btc
//
//  Created by admin on 2019/8/13.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface blockButton : UIButton
//生命属性
@property (nonatomic, copy) void (^block)(UIButton *);
//添加带block的点击事件
- (void)addTapBlock:(void(^)(UIButton *button))block;

@end

NS_ASSUME_NONNULL_END
