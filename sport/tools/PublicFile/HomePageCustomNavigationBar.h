//
//  HomePageCustomNavigationBar.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/14.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "navButton.h"
NS_ASSUME_NONNULL_BEGIN
//0

//0
@class HomePageCustomNavigationBar;
//1
@protocol HomePageCustomNavigationBarDelegate <NSObject>

//2 跳转控制器
-(void)goToController;//按钮1
-(void)goToController1;//按钮2

@end




@interface HomePageCustomNavigationBar : UIView
//3 代理
@property(nonatomic,weak)id<HomePageCustomNavigationBarDelegate>delegate;

//4 另外一个选择:block选择

@property(nonatomic,copy)void(^myBlock)(void);//按钮1

@property(nonatomic,copy)void(^myBlock1)(void);//按钮2


// 5 初始化 2个按钮 
@property(nonatomic,strong)navButton *leftButtonLoading;
@property(nonatomic,strong)navButton *rightButtonLoading;




@end

NS_ASSUME_NONNULL_END
