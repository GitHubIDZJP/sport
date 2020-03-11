//
//  btnClick.h
//  Sports
//
//  Created by test on 2020/1/8.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface btnClick : UIButton
@property (nonatomic,strong)UILabel *topText;
@property (nonatomic,strong)UILabel *bottomText;
-(void)setTText:(NSString*)tt bText:(NSString*)bt;
@property (nonatomic, copy) void (^block)(UIButton *);
//添加带block的点击事件
- (void)addTapBlock:(void(^)(UIButton *button))block;

//添加带block的点击事件
- (void)addTapBlock:(void(^)(UIButton *button))block;


@end

NS_ASSUME_NONNULL_END
