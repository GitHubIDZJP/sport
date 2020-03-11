//
//  moneyJoinVC.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "moneyJoinVC.h"
#import "PayMnetCustomCell.h"
#import "money.h"
#import "btnClick.h"
@interface moneyJoinVC ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)money *m;
@property(nonatomic,strong)UIView *ChargeMoneyView;

@end

@implementation moneyJoinVC
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,  JH_NavBarHeight)];
        _NavBar.backgroundColor = colorWithHexString(@"#07913B");//color(64,143,68);
    }
    return _NavBar;
}
-(UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,506*KWIDTH,SCREEN_WIDTH,SCREEN_HEIGHT-JH_TabBarHeight) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = color(242, 242, 242);
        // _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = tableSeparatorColor;
        _tableView.rowHeight = 88*KWIDTH;
        IOS11;
    }
    return _tableView;
}
-(money*)m{
    
    if(!_m){
        _m = [[money alloc]init];
        _m.frame = RECT(30*KWIDTH,self.NavBar.y + self.NavBar.height+ 30*KWIDTH,SCREEN_WIDTH-60*KWIDTH,88*KWIDTH);
        _m.backgroundColor = UIColor.whiteColor;
        _m.layer.cornerRadius = 10*KWIDTH;
        _m.layer.masksToBounds = YES;
        
    }
    return _m;
}
-(UIView*)ChargeMoneyView
{
    if(!_ChargeMoneyView){
        _ChargeMoneyView = UIView.new;
        _ChargeMoneyView.frame = RECT(0,_m.y+ _m.height + 30*KWIDTH,SCREEN_WIDTH,268*KWIDTH);
        _ChargeMoneyView.backgroundColor = UIColor.whiteColor;
        _ChargeMoneyView.userInteractionEnabled = YES;
        [self addBtns];
        
    }
    return _ChargeMoneyView;
}
-(NSArray*)cellTitle
{
    
    if(!_cellTitle){
        
        _cellTitle =   @[@"支付宝支付",@"微信支付"];
    }
    return _cellTitle;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = color(242, 242, 242);
    
    [self.view addSubview:self.m];
    [self.m getprice:@"8888"];
   // [self.view addSubview:self.ChargeMoneyView];
    
    [self.view addSubview:self.NavBar];
    [self.view addSubview:self.tableView];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
       // [vc dismissViewControllerAnimated:false completion:nil];
          [vc.navigationController popViewControllerAnimated:YES];
        NSLog(@"返回上一个页面");
    }];
    self.NavBar.backgroundColor= UIColor.whiteColor;
    [self.NavBar setRightButtonIsHidden:YES];
    [self.NavBar setCenterText: @"充值"];
    [self.NavBar setCenterTextColor:UIColor.blackColor];
    hintText =  [NSMutableArray arrayWithObjects:@"头像",@"昵称",@"性别",@"简介", nil];
    [self addBottomPayBtn];
    //Start payment
    [self addBtns];
}
-(void)addBtns{
    
    NSArray *customButtonTitle = @[@"50￥",@"100￥",@"500￥",@"5000￥",@"5￥",@"10￥"];
    NSArray *icon = [NSArray arrayWithObjects:@"50球币",@"100球币",@"500球币",@"5000球币",@"50球币",@"100￥", nil];
    
    [icon enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSInteger index = idx % 3;
        NSInteger page = idx / 3;
        CGFloat w = 220*KWIDTH;
        CGFloat h = 114*KWIDTH;
        CGFloat space = 15*KWIDTH;
        CGFloat verticalSpacing = 16*KWIDTH;
      
        btnClick *btn = [[btnClick alloc]initWithFrame:RECT(index*(w+space)+30*KWIDTH,page*(h + verticalSpacing)+self.m.height + self.m.y + 20*KWIDTH,w,h)];
        btn.backgroundColor = White;
        [btn setTText:customButtonTitle[idx] bText:icon[idx]];
                         [self.view addSubview:btn];
    }];

    
}
-(void)addBottomPayBtn{
  
    UIButton *PayButton = getButton(RECT(0,SCREEN_HEIGHT- xbottomHeight - 88*KWIDTH,SCREEN_WIDTH,88*KWIDTH), @"立即支付", UIColor.whiteColor, Font15, colorWithHexString(@"#07913B"));
    [self.view addSubview:PayButton];
                                        
    [PayButton addAction:^(id  _Nonnull sender) {
        NSLog(@"start payMent");
    }];
    
    
    

 
 }
//组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
//每组的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if(section == 0){
//        return 3;
//    }
//    return section;
    return 1;// _cellTitle.count;
}
//组之间的距离
/*-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
 {
 if(section == 0){
 return 0.00000001;
 }else if (section == 1){
 //return 30;
 
 }
 return section;
 

 }
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 0){
         return @"支付方式";
    }
    return nil;
   
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    return nil;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00000001;
    
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90*KWIDTH;
}


//数据源
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"it's cell data";
    PayMnetCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        //初始化
        cell = [[PayMnetCustomCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        // cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    cell.layer.cornerRadius = 10*KWIDTH;
    cell.layer.masksToBounds = YES;
    NSArray *titles = @[@"支付宝支付",@"微信支付",];
    NSArray *imgs = [NSArray arrayWithObjects:@"支付宝",@"微信",nil];
    [cell setIconViewImg:imgs[indexPath.section] andTitleLabelText:titles[indexPath.section] ];
    if(isSelect == indexPath.section){
        
        [cell setBtnIcon:@"组 6"];
    }else{
        [cell setBtnIcon:@"椭圆 1 拷贝 3"];
        
    }
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    isSelect = indexPath.section;
    switch (isSelect) {
        case 0:
        {
            
            break;
        }
        case 1:
        {
            
            break;
        }
        default:
            break;
    }
    [self.tableView reloadData];
}

@end
