//
//  userProfileVC.h
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//



#pragma mark 个人信息 
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface userProfileVC : UIViewController
{
    NSMutableArray *storageArr;
    NSMutableArray *hintText;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)customNavigationBar *NavBar;
@end

NS_ASSUME_NONNULL_END
