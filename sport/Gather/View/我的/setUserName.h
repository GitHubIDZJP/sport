//
//  setUserName.h
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//



#pragma mark 设置通用名 
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface setUserName : UIViewController

//反向传值；通知 block 代理 kvo 单例都行
@property(nonatomic,strong)customNavigationBar *NavBar;
@property(nonatomic,strong)UITextField *getUserName;








@end

NS_ASSUME_NONNULL_END
