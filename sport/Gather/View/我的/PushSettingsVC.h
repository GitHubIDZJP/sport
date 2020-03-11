//
//  PushSettingsVC.h
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#pragma mark 推送设置
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PushSettingsVC : UIViewController
@property(nonatomic,strong)customNavigationBar *NavBar;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic, strong) UISwitch *pushSwitch;
@property(nonatomic, strong) UISwitch *articlepushSwitch;
@property(nonatomic, strong) UISwitch *livePushSwitch;
@end


NS_ASSUME_NONNULL_END
