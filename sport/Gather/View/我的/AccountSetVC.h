//
//  AccountSetVC.h
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#pragma 账号设置
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccountSetVC : UIViewController
@property(nonatomic,strong)customNavigationBar *NavBar;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *ViewArray;
@end

NS_ASSUME_NONNULL_END
