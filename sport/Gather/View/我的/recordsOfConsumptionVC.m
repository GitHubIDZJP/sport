//
//  recordsOfConsumptionVC.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "recordsOfConsumptionVC.h"
#import "subscriptionRecordModel.h"
@interface recordsOfConsumptionVC ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *Marr;
    
}
@end

@implementation recordsOfConsumptionVC
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
        
       // _NavBar.backgroundColor =  colorWithHexString(@"#07913B");
    }
    return _NavBar;
}
-(UITableView *)tableView{
    
    

    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0*KWIDTH,JH_NavBarHeight,SCREEN_WIDTH- 0*KWIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        //_tableView.backgroundColor = color(243,243,243);
        // _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//                _tableView.separatorColor = color(230, 230, 230);
//
//        _tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
        IOS11;
        
        
        
    
        
        
    }
    return _tableView;
}
//-(NSArray *)dataArr{
//    /*
//     @property(nonatomic,strong)NSString *RecordStr;
//     @property(nonatomic,strong)NSString *timeStr;
//     @property(nonatomic,strong)NSString *moneyStr;
//     */
//
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = color(243, 243, 243);
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.NavBar];
    [self.NavBar setRightButtonIsHidden:YES];
    [self.NavBar setCenterText:@"消费记录"];
    //[self.NavBar setCenterTextColor:UIColor.whiteColor];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        NSLog(@"导航条按钮");
      //  [vc dismissViewControllerAnimated:NO completion:nil];
        [vc.navigationController popViewControllerAnimated:YES];
    }];
    
    NSDictionary *dict = @{@"RecordStr":@"记录",@"timeStr":@"2019-06-06 15:15",@"moneyStr":@"+88.88"
                           };
    subscriptionRecordModel *model = [subscriptionRecordModel  modelWithDict:dict];
    NSMutableArray *arr = @[].mutableCopy;
    for(int i = 0;i< 10;i++){
        [arr addObject:model];
    }
    dataArr = arr;
   
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
    return dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88*KWIDTH;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ident = @"it's cell";
    subscriptionRecordCell *cell =[tableView dequeueReusableCellWithIdentifier:ident];
    if(!cell){
        cell = [[subscriptionRecordCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ident];
    }
    
    cell.model = dataArr[indexPath.row];
    CGFloat x = 30*KWIDTH;
     UILabel *line = [[UILabel alloc]initWithFrame:RECT(-1,7*KWIDTH+cell.height,ScreenWidth -2*x-20*KWIDTH,1)];
     line.backgroundColor  = color(230, 230, 230);
     [cell addSubview:line];

    if(indexPath.row == 1){
        
        cell.money.textColor  = colorWithHexString(@"#333333");
    }else if (indexPath.row == dataArr.count - 1){
        
        [self.tableView  setSeparatorColor :UIColor.redColor];
        
    }
    if(indexPath.row == dataArr.count -1)
       {
          
           line.hidden = YES;
       }
//    NSDictionary *index = dataArr[6];
//    if(index){
//        cell.time.text = @"12:00";
//    }
    
    return cell;
    
    
    

    
   
    
    
    
    
    
    
    
    
    return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat radius = 10*KWIDTH;
    NSInteger sectionCount = [tableView numberOfRowsInSection:indexPath.section] - 1;// section row 个数
    CGRect bounds = CGRectInset(cell.bounds, 12, 0); // 显示的cell 点击区域
    // 2.再盖一个 mask
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];// 用于蒙板
    // section 只有一个时。
    if (indexPath.row == 0 && indexPath.row == sectionCount) {
        [maskLayer setPath:[UIBezierPath bezierPathWithRoundedRect:bounds cornerRadius:radius].CGPath];
        
        // 第一个 row
    } else if (indexPath.row == 0) {
        [maskLayer setPath:[UIBezierPath bezierPathWithRoundedRect:bounds
                                                 byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)
                                                       cornerRadii:CGSizeMake(radius, radius)].CGPath];
        
        // 最后一个 row
    } else if (indexPath.row == sectionCount) {
        [maskLayer setPath:[UIBezierPath bezierPathWithRoundedRect:bounds
                                                 byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                       cornerRadii:CGSizeMake(radius, radius)].CGPath];
        // 中间 row
    } else {
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:bounds];
        [maskLayer setPath:path.CGPath];
        
    }
    // 2.mask
    [cell setMaskView:[[UIView alloc] initWithFrame:cell.bounds]];
    [cell.maskView.layer insertSublayer:maskLayer atIndex:0];
    [cell.maskView.layer setMasksToBounds:YES];
    [cell setClipsToBounds:YES];


}

@end
