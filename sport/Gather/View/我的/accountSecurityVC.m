//
//  accountSecurityVC.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "accountSecurityVC.h"

@interface accountSecurityVC ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation accountSecurityVC
-(NSMutableArray *)ViewGroup
{
    //二维:
    if(!_ViewGroup){
        //手机号设置 accountSettingsVC
        //密码设置  replacePhoneNumber
         accountSettingsVC *numberSetting = [[accountSettingsVC alloc]init];
        passwordSetVC *pwS = [[passwordSetVC alloc]init];
        _ViewGroup = [NSMutableArray arrayWithObjects:numberSetting,pwS,nil];
        
        
    }
    return _ViewGroup;
    
}
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self addNavigationController];
    [self.view addSubview:self.tableView];
    
    //self.tableView.backgroundColor = [UIColor redColor];
    
}
-(void)addNavigationController{
    
    [self.view addSubview:self.NavBar];
    
    [self.NavBar setRightButtonIsHidden:YES];
    [self.NavBar setCenterText:@"账号与安全"];
   // [self.NavBar setCenterTextColor:UIColor.whiteColor];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        NSLog(@"导航条按钮");
       // [vc dismissViewControllerAnimated:NO completion:nil];
        [vc.navigationController popViewControllerAnimated:YES];
    }];
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0 || section == 1){
        return 30*KWIDTH;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section == 0 || section == 1){
        return 0.1*KWIDTH;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if(section == 0 && section == 1){
//        return 2;
//    } return 0;
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88*KWIDTH;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ident = @"it's cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:ident];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        
    }
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    
    
    NSArray *CellTextLabel = @[@"手机号设置",@"密码设置"];
    NSArray *PaymentText = @[@"微信",@"支付宝"];
    NSArray *BindingJudgement = @[@"未绑定",@"已绑定"];
    if(indexPath.section ==0){
        cell.textLabel.text =  CellTextLabel[indexPath.row];
    }else{
        cell.textLabel.text =  PaymentText[indexPath.row];
        UILabel *bjLabel =getLabel(RECT(600*KWIDTH,35*KWIDTH,100*KWIDTH,27*KWIDTH), BindingJudgement[indexPath.row], colorWithHexString(@"#999999"), Font14);
        [cell addSubview:bjLabel];
        
        
        
        
        
    }
    
    
    //设置属性
    cell.textLabel.textColor = colorWithHexString(@"#333333");
    cell.textLabel.font = Font14;
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    //  NSLog(@"第:ld组第:ld行",indexPath.section,indexPath.row);
    NSLog(@"滑到了第 %ld 组 %ld个",indexPath.section, indexPath.row);
    
    
    
    
    if(indexPath.section == 0){
        
        __block  UIViewController *vc = self;
        vc.modalPresentationStyle = 0;
        //[vc presentViewController:self.ViewGroup[indexPath.row] animated:NO completion:nil];
        [vc.navigationController pushViewController:self.ViewGroup[indexPath.row] animated:YES];
        /*
        switch (indexPath.row) {
            case 0:
                
                break;
            case 1:
                
                break;
            case 2:
                
                break;
            case 3:
                
                break;
                
            default:
                break;
        }*/
    }else{
        
        // NSLog(@"d第2组");
        
    }
    
    
}



@end
