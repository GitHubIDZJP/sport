//
//  opinionFeedbackVC.h
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#pragma mark 意见反馈
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface opinionFeedbackVC : UIViewController
{
    NSArray *unitel;
    UIView *view;
    UIButton *btn;
}
@property(nonatomic,strong)customNavigationBar *NavBar;
@property(nonatomic,strong)UITableView *tableView;


@end

NS_ASSUME_NONNULL_END
