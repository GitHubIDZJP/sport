//
//  GeneralSettingsVC.m
//  Sports
//
//  Created by test on 2020/1/6.
//  Copyright © 2020 test. All rights reserved.
//

#import "GeneralSettingsVC.h"

@interface GeneralSettingsVC ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation GeneralSettingsVC
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
        _tableView.backgroundColor = color(243,243,243);
        // _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
         _tableView.separatorColor = color(230, 230, 230);
        IOS11;
    }
    return _tableView;
}


/**
 * 懒加载按钮开关
 */
- (UISwitch *)pushSwitch {
    if (_pushSwitch == nil) {
        _pushSwitch = [[UISwitch alloc] init];
        //位置的x,y可以改，但是按钮宽、高不可以改，就算设置了也没效果
        _pushSwitch.frame = CGRectMake(SCREEN_WIDTH - 140*KWIDTH, 10*KWIDTH, 80*KWIDTH, 40*KWIDTH);
        //设置按钮在屏幕中心
        //_pushSwitch.center = CGPointMake(self.view.center.x, self.view.center.y);
        _pushSwitch.backgroundColor = UIColor.whiteColor;
        [_pushSwitch setOnTintColor:UIColor.redColor];
    }
    return _pushSwitch;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = color(243, 243, 243);
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.NavBar];
    [self.NavBar setRightButtonIsHidden:YES];
    [self.NavBar setCenterText:@"通用"];
    //[self.NavBar setCenterTextColor:UIColor.whiteColor];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        NSLog(@"导航条按钮");
       // [vc dismissViewControllerAnimated:NO completion:nil];
          [vc.navigationController popViewControllerAnimated:YES];
    }];
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 30*KWIDTH;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88*KWIDTH;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *ident = @"it's cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:ident];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ident];
        
        
        
    }
    
    
    
    
    
    
    
    //假数据 后期从后台调取
    NSArray *Comper = [NSArray arrayWithObjects:@"移动网络无图模式",@"清理缓存", nil];
//    SubscriptionMode *model = [[SubscriptionMode alloc]initWithHeadPortrait:userAvatars[indexPath.row] Members:userVip[indexPath.row] MemberLength:userVipTime[indexPath.row] currentTime:userMembershipDeadline[indexPath.row]];
//    cell.sModel = model;
    cell.textLabel.text = Comper[indexPath.row];
    if(indexPath.row == 1){
        cell.detailTextLabel.text = @"66.6MB";
    }else if (indexPath.row== 0){
        [cell addSubview:self.pushSwitch];
        [self.pushSwitch addTarget:self action:@selector(isOn:) forControlEvents:UIControlEventValueChanged];
    }
    
    
    
    
    
    return cell;
}
-(void)isOn:(UISwitch*)SW{
    if(SW.on == YES){
        NSLog(@"开");
    }else if (SW.on == NO){
         NSLog(@"关");
        
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    
    
}
@end


