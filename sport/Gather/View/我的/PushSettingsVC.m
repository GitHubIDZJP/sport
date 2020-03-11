//
//  PushSettingsVC.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "PushSettingsVC.h"

@interface PushSettingsVC ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource>

@end



@implementation  PushSettingsVC
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
        
       // _NavBar.backgroundColor =  colorWithHexString(@"#07913B");
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
        [_pushSwitch setOn:YES];
        //_pushSwitch.center = CGPointMake(self.view.center.x, self.view.center.y);
        _pushSwitch.backgroundColor = UIColor.whiteColor;
        [_pushSwitch setOnTintColor:color(67, 133, 55)];
    }
    return _pushSwitch;
}
- (UISwitch *)articlepushSwitch {
    if (_articlepushSwitch == nil) {
        _articlepushSwitch = [[UISwitch alloc] init];
        //位置的x,y可以改，但是按钮宽、高不可以改，就算设置了也没效果
        _articlepushSwitch.frame = CGRectMake(SCREEN_WIDTH - 140*KWIDTH, 10*KWIDTH, 80*KWIDTH, 40*KWIDTH);
        //设置按钮在屏幕中心
        //_pushSwitch.center = CGPointMake(self.view.center.x, self.view.center.y);
        _articlepushSwitch.backgroundColor = UIColor.whiteColor;
        [_articlepushSwitch setOnTintColor:UIColor.redColor];
    }
    return _articlepushSwitch;
}
- (UISwitch *)livePushSwitch {
    if (_livePushSwitch == nil) {
        _livePushSwitch = [[UISwitch alloc] init];
        //位置的x,y可以改，但是按钮宽、高不可以改，就算设置了也没效果
        _livePushSwitch.frame = CGRectMake(SCREEN_WIDTH - 140*KWIDTH, 10*KWIDTH, 80*KWIDTH, 40*KWIDTH);
        //设置按钮在屏幕中心
          [_livePushSwitch setOn:YES];
        //_pushSwitch.center = CGPointMake(self.view.center.x, self.view.center.y);
        _livePushSwitch.backgroundColor = UIColor.whiteColor;
     //   [_livePushSwitch setOnTintColor:UIColor.redColor];
         [_livePushSwitch setOnTintColor:color(67, 133, 55)];
    }
    return _livePushSwitch;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = color(243, 243, 243);
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.NavBar];
    [self.NavBar setRightButtonIsHidden:YES];
    [self.NavBar setCenterText:@"通用"];
   // [self.NavBar setCenterTextColor:UIColor.whiteColor];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        NSLog(@"导航条按钮");
       // [vc dismissViewControllerAnimated:NO completion:nil];
        [vc.navigationController popViewControllerAnimated:YES];
    }];
    
   // NSArray *arrSwitch = [NSArray arrayWithObjects:@"", nil];
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 30*KWIDTH;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
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
    NSArray *Comper = [NSArray arrayWithObjects:@"评论推送",@"文章推送",@"直播推送", nil];
    cell.textLabel.text = Comper[indexPath.row];
   if (indexPath.row == 0){
        [cell addSubview:self.pushSwitch];
        [self.pushSwitch addTarget:self action:@selector(isOn:) forControlEvents:UIControlEventValueChanged];
    }else if (indexPath.row == 1){
        [cell addSubview:self.articlepushSwitch];
        [self.articlepushSwitch addTarget:self action:@selector(articlePush:) forControlEvents:UIControlEventValueChanged];
    }else if (indexPath.row == 2){
        [cell addSubview:self.livePushSwitch];
   [self.livePushSwitch addTarget:self action:@selector(livePush:) forControlEvents:UIControlEventValueChanged];
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
-(void)articlePush:(UISwitch*)p{

    if(p.on == YES){
        NSLog(@"开");
    }else if (p.on == NO){
        NSLog(@"关");

    }
}
-(void)livePush:(UISwitch *)lP{
    if(lP.on == YES){
        NSLog(@"开");
    }else if (lP.on == NO){
        NSLog(@"关");

    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    
    
}
@end

