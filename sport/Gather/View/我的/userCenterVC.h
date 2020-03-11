//
//  userCenterVC.h
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#pragma mark 个人中心 

#import <UIKit/UIKit.h>
#import "userCenterHeaderView.h"
NS_ASSUME_NONNULL_BEGIN

@interface userCenterVC : UIViewController
@property(nonatomic,strong)UIScrollView *scrSuperView;
@property(nonatomic,retain)userCenterHeaderView *firstLevelView;
@end

NS_ASSUME_NONNULL_END
