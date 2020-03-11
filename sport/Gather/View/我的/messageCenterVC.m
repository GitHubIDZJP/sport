//
//  messageCenterVC.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "messageCenterVC.h"
#import "NotificationCenterCell.h"
#import "imgOrTitleBtn.h"
@interface messageCenterVC ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource>

@end




@implementation messageCenterVC
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
        
        _NavBar.backgroundColor = UIColor.whiteColor;
    }
    return _NavBar;
}
-(UITableView *)tableView{
    
    if(!_tableView){

        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,309*KWIDTH,SCREEN_WIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
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
    self.view.backgroundColor = color(243, 243, 243);
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.NavBar];
    [self.NavBar setRightButtonIsHidden:YES];
    [self.NavBar setCenterText:@"消息中心"];
    //[self.NavBar setCenterTextColor:UIColor.blackColor];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        NSLog(@"导航条按钮");
      //  [vc dismissViewControllerAnimated:NO completion:nil];
        [vc.navigationController popViewControllerAnimated:YES];
    }];
    
    //指示文字
   // UILabel *indicate = UILabel.new;
    
    
    
    NSString *richText= @"|  重要通知";
    //富文本
    NSRange rangStrA = [richText rangeOfString:@"重要通知"];
    NSRange rangStrB = [richText rangeOfString:@"|"];
    NSMutableAttributedString *str_describe = [[NSMutableAttributedString alloc] initWithString:richText];
    [str_describe addAttribute:NSForegroundColorAttributeName value:colorWithHexString(@"#333333") range:rangStrA];//Foreground前景
    [str_describe addAttribute:NSForegroundColorAttributeName value:colorWithHexString(@"#4CB13B") range:rangStrB];
   self.indicate= [[UILabel alloc]initWithFrame:CGRectMake(30*KWIDTH,249*KWIDTH+zjpTest,SCREEN_WIDTH,90)];
    self.indicate.textAlignment =NSTextAlignmentLeft;
    self.indicate.attributedText= str_describe;
    
    [self.view addSubview:self.indicate];
    
    [self addBtn];
}
-(void)addBtn{
    
    
    self.bearView = UIView.new;
    self.bearView.frame = RECT(30*KWIDTH,self.NavBar.height + self.NavBar.y+ 20*KWIDTH,SCREEN_WIDTH - 60*KWIDTH,144*KWIDTH);
    self.bearView.layer.cornerRadius = 5;
    self.bearView.layer.masksToBounds = YES;
    self.bearView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.bearView];
    
    
    
    
    NSArray *titles = @[@"我的通知",@"系统消息",@"收藏",@"动态"];
    NSArray *icon = [NSArray arrayWithObjects:@"通知@2x",@"通知(1)@2x",@"收 藏@2x",@"人事动态@2x", nil];
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        imgOrTitleBtn *addM = imgOrTitleBtn.new;
        CGFloat w = (SCREEN_WIDTH -60*KWIDTH)/4;
        addM.frame = RECT(0+ idx * w,30*KWIDTH,w,w);
       
        [addM setTitleColor:colorWithHexString(@"#333333")];
       // addM.backgroundColor  = RandomColor;
        //[addM setImgY:90*KWIDTH];
        [self.bearView addSubview:addM];
        [addM setImg:icon[idx] title:titles[idx]];
        if(idx == 0){
            [addM addTapBlock:^(UIButton * _Nonnull button) {
                NSLog(@"我的通知");

            }];
        }
    }];
        
    
    

    
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //获取数组的组数
    return 2;//self.contentDesc.count;
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

    NSArray *HeaderText = @[@"2019年10月30日 15:35",@"2019年10月30日 21:02"];
    UIView *headerView = [[UIView alloc]init];
    headerView.frame  = RECT(0,0,SCREEN_WIDTH,70);
   // headerView.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]init];
    label.textColor = colorWithHexString(@"#333333");
    label.font = [UIFont systemFontOfSize:13];
    CGFloat ngixW = 400*KWIDTH;
    CGFloat ngixH =  80*KWIDTH;
    label.frame = CGRectMake(SCREEN_WIDTH/2 - ngixW/2,10*KWIDTH,ngixW,ngixH);
    label.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:label];
    label.text = HeaderText[section];
    return headerView;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 296*KWIDTH;
}
//数据源
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"it's cell data";
    NotificationCenterCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        cell = [[ NotificationCenterCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    
   
    
    
    
   // [cell setOrderNotIContext:@"订单通知" callTime:@"30分钟通话服务" clickTopicText:@"点击查看详情"];
   
    //有Bug 
    
    NSArray *arr = @[@"国台办：民进党’挟洋自重‘到头只能是’一场春梦‘",@"孙杨2020首秀遭逆转丢冠：200米自由泳屈居亚军"];
    NSArray *desc =@[@"海外网1月15日电 1月15日上午",@"2020国际泳联冠军系列赛首站比赛在深圳进行"];
    NSArray *icon = [NSArray arrayWithObjects:@"play",@"play", nil];
    [cell setVariableHead:icon[indexPath.section] TextNoti:arr[indexPath.section] redPackets:desc[indexPath.section]];
    if(indexPath.row == 0){
    
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.section == 0){
        
        
        
      
        
    }else if (indexPath.section == 1){
        
        Class class=NSClassFromString(@"nil");
        
        if(class) {
            
            UIViewController *ctrl =class.new;
            ctrl.modalPresentationStyle = 0;
          //  [self presentViewController:ctrl animated:NO completion:nil];
              [ self.navigationController pushViewController:ctrl  animated:YES];
        }
        
        
        
    }
    
    
    
}


@end
