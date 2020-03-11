//
//  recordsOfConsumptionVC.h
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#pragma mark 消费记录
#import <UIKit/UIKit.h>
#import "subscriptionRecordCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface recordsOfConsumptionVC : UIViewController
{
    NSArray *dataArr;
}

@property(nonatomic,strong)customNavigationBar *NavBar;
@property(nonatomic,strong)UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
