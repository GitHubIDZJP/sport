//
//  opinionFeedbackVC.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "opinionFeedbackVC.h"

@interface opinionFeedbackVC ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource>
{
    
}
@end

@implementation opinionFeedbackVC
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
        
        _NavBar.backgroundColor =  colorWithHexString(@"#07913B");
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
        _tableView.separatorColor = color(251, 251,251);
        IOS11;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    VCBGCOLOR;
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.NavBar];
    [self.NavBar setRightButtonIsHidden:YES];
    [self.NavBar setCenterText:@"意见反馈"];
    [self.NavBar setCenterTextColor:UIColor.whiteColor];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        NSLog(@"导航条按钮");
     //   [vc dismissViewControllerAnimated:NO completion:nil];
          [vc.navigationController popViewControllerAnimated:YES];
    }];
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //获取数组的组数
    return 3;//self.contentDesc.count;
}
//每组的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    //获取二维数组每组的cell个数
    //  return 1;//([self.contentDesc[section]count]);
    
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1*KWIDTH;
    
    return section;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 100*KWIDTH;//heightForHeaderH;
}
// 返回组头部view的高度
//返回每组头部view

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    NSArray *HeaderText = @[@"反馈类型",@"问题描述",@"联系方式"];
    UIView *headerView = [[UIView alloc]init];
    headerView.frame  = RECT(0,0,SCREEN_WIDTH,70);
    // headerView.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]init];
    label.textColor = colorWithHexString(@"#999999");
    label.font = [UIFont systemFontOfSize:13];
    CGFloat ngixW = 400*KWIDTH;
    CGFloat ngixH =  80*KWIDTH;
    label.frame = CGRectMake(31*KWIDTH,10*KWIDTH,ngixW,ngixH);
    label.textAlignment = NSTextAlignmentLeft;
    [headerView addSubview:label];
    label.text = HeaderText[section];
    return headerView;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0 || indexPath.section == 2){
        return 88*KWIDTH;
    }else if (indexPath.section == 1){
       return  358*KWIDTH;
    }
    return 88*KWIDTH;
}

//数据源
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"it's cell data";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    if(indexPath.section == 0 || indexPath.section == 1){
        
        cell.userInteractionEnabled = NO;
    }
    if(indexPath.section == 2){
        cell.textLabel.text = @"手机号";
        cell.textLabel.textColor = colorWithHexString(@"#999999");
    }
    //start
    
    if(indexPath.row == 0){
        
        [self addBtn];
        
    }
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)addBtn{
    
    unitel = @[@"问题1",@"问题2",@"问题3"];
    for(int  i  = 0;i< unitel.count;i++){
        // row = 3
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat yy  =self.NavBar.height + self.NavBar.origin.y;
        btn.frame  = CGRectMake(30*KWIDTH+(i%3)*108*KWIDTH, yy +128*KWIDTH + (i/3)*40,88*KWIDTH,40*KWIDTH);
        [btn setTitle:unitel[i] forState:0];
        [btn setTitleColor:UIColor.whiteColor forState:0];
        [btn setTitleColor:UIColor.grayColor forState:1 << 2];//sel
        [btn addTarget:self action:@selector(click:) forControlEvents:1<< 6];
        btn.tag = i+100;
        btn.titleLabel.font = Font12;
        btn.layer.borderWidth =1;
        btn.layer.cornerRadius = 5;
        
        //btn.layer.borderColor= UIColor.blueColor.CGColor;//不选择时
        btn.backgroundColor =UIColor.whiteColor;//colorWithHexString(@"#07913B");
        [self.view addSubview:btn];
        
    }
    
}
-(void)click:(UIButton*)senderBtn{
    
    for(int i = 0;i< unitel.count;i++){
        if(senderBtn.tag == 100+i){
            senderBtn.selected = YES;
            senderBtn.layer.borderColor = UIColor.redColor.CGColor;
            senderBtn.layer.borderWidth = 2;
            senderBtn.backgroundColor = colorWithHexString(@"#07913B");
            continue;
            
        }
        UIButton *testBtn = (UIButton*)[self.view viewWithTag:i+100];
        testBtn.selected = NO;
        //testBtn.layer.borderColor =UIColor.blueColor.CGColor;
        testBtn.layer.borderWidth = 1;
        testBtn.backgroundColor = UIColor.redColor;
        
    }
    
    
}
@end
