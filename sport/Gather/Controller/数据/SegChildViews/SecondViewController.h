//
//  thirdViewController.h
//  SectionChooseVC
//
//  Created by test on 2020/1/9.
//  Copyright © 2020 lujh. All rights reserved.
//

//q球员榜
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController
{
    NSInteger isSel;
    //UILabel *headLabel;
}
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,copy) NSString *titleStr;
@property(nonatomic,strong)UITableView *LeftTableView;
@property(nonatomic,strong)UITableView *RightTableView;
@property(nonatomic,strong)UILabel *headLabel;
//集合视图

//新加的
@property(nonatomic,strong) NSDictionary *dicData;//存数据
//第一个tableView选择的Index
@property (nonatomic,assign) NSInteger firstIndex;
@end

NS_ASSUME_NONNULL_END
