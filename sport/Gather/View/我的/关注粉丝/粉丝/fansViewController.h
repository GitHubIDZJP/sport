//
//  addAttentionVC.h
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#pragma mark 关注
#import <UIKit/UIKit.h>
#import "mySelfFansViewControllerTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface fansViewController : UIViewController
{
    
    UIButton *btn;
    UIButton *btn1;
    UISegmentedControl *segmentedControl;
    NSInteger selecIndex;
    NSInteger tagFirst;
    NSInteger tagSecond;
    NSInteger tagThird;
    NSInteger tagFourth;
}
@property(nonatomic,strong)UITableView *tableView;
@end


NS_ASSUME_NONNULL_END
