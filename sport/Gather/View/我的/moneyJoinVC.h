//
//  moneyJoinVC.h
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//
#pragma mark 充值
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface moneyJoinVC : UIViewController
{
    NSMutableArray *storageArr;
    NSMutableArray *hintText;
    //
    NSMutableArray *imageArray;
    NSInteger isSelect;//选中
    
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)customNavigationBar *NavBar;
@property(nonatomic,strong)NSArray *cellTitle;
@end



NS_ASSUME_NONNULL_END
