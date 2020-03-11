//
//  userAubscribeVC.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "userAubscribeVC.h"
#import "SubscriptionTableViewCell.h"
@interface userAubscribeVC ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)customNavigationBar *NavBar;

@end

@implementation userAubscribeVC
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
        
        //_NavBar.backgroundColor =  colorWithHexString(@"#07913B");
    }
    return _NavBar;
}
-(UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,JH_NavBarHeight,SCREEN_WIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = VCBGCOLOR;
        // _tableView.dataSource = self;
       _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = color(230, 230, 230);
        IOS11;
        
    }
    return _tableView;
}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = color(242, 242, 242);
    [self.view addSubview:self.NavBar];
    [self.view addSubview:self.tableView];
    [self.NavBar setRightButtonIsHidden:YES];
    [self.NavBar setCenterText:@"我的订阅"];
   // [self.NavBar setCenterTextColor:UIColor.whiteColor];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        NSLog(@"导航条按钮");
       // [vc dismissViewControllerAnimated:NO completion:nil];
          [vc.navigationController popViewControllerAnimated:YES];
    }];
   // [ self createSegMentController];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
        if(section ==0){
            return 30*KWIDTH;
        }else
        {
            return 10*KWIDTH;
            
        }
    
}
//
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if(section == 0){
        return 15*KWIDTH;
    }
    return 10*KWIDTH;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 144*KWIDTH;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ident = @"it's cell";
    SubscriptionTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:ident];
    if(!cell){
        cell = [[SubscriptionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        cell.backgroundColor = White;
    }
    

    
    //假数据 后期从后台调取
    NSArray *userAvatars = [NSArray arrayWithObjects:@"订阅图标",@"订阅图标", nil];
    NSArray *userVip = @[@"大V推送会员",@"大鸡哥VIP"];
    NSArray *userVipTime = @[@"黄金会员-连续包月(12个月)",@"普通会员-季度包月(3个月)"];
    NSArray *userMembershipDeadline = @[@"2021年1月到期",@"到期时间\n2020年3月到期"];
    SubscriptionMode *model = [[SubscriptionMode alloc]initWithHeadPortrait:userAvatars[indexPath.row] Members:userVip[indexPath.row] MemberLength:userVipTime[indexPath.row] currentTime:userMembershipDeadline[indexPath.row] TimeStopHint:@"到期时间"];
    cell.sModel = model;
    
 
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    
    
}
@end
