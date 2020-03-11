//
//  UserFocusVC.h
//  QCGlobalSport
//
//  Created by test on 2020/2/12.
//  Copyright © 2020 com.qqty. All rights reserved.
//



#pragma mark 个人中心-足球
#import <UIKit/UIKit.h>
#import "means.h"
#import "XLBasePageController.h"
NS_ASSUME_NONNULL_BEGIN

@interface UserFocusVC :  UIViewController
@property(nonatomic,strong)means *firstLevelView;
@property(nonatomic,strong)IBOutlet UIImageView *HeadPortrait;
@property(nonatomic,strong)IBOutlet UILabel*FocusCount;//关注数量
@property(nonatomic,strong)IBOutlet UILabel* UserFans;//粉丝数
@property(nonatomic,strong)IBOutlet UILabel* userName;//名字
@property(nonatomic,strong)IBOutlet UILabel* userSignature;//签名
@end



NS_ASSUME_NONNULL_END
