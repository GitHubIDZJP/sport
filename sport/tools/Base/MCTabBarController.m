//
//  MCTabBarController.m
//  Sports
//
//  Created by test on 2019/12/31.
//  Copyright © 2019 test. All rights reserved.
//




\


#import "MCTabBarController.h"

@interface MCTabBarController ()<UITabBarControllerDelegate>
@end

@implementation MCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mcTabbar = [[MCTabBar alloc] init];
    [_mcTabbar.centerBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    //利用KVC 将自己的tabbar赋给系统tabBar
    [self setValue:_mcTabbar forKeyPath:@"tabBar"];
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// 重写选中事件， 处理中间按钮选中问题
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    _mcTabbar.centerBtn.selected = (tabBarController.selectedIndex == self.viewControllers.count/2);
    
    if (self.mcDelegate){
        [self.mcDelegate mcTabBarController:tabBarController didSelectViewController:viewController];
    }
}





- (void)buttonAction:(UIButton *)button{
    NSInteger count = self.viewControllers.count;
    self.selectedIndex = count/2;//关联中间按钮
    [self tabBarController:self didSelectViewController:self.viewControllers[self.selectedIndex]];
}
@end
