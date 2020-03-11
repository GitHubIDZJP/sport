//
//  BallDataVC.m
//  Sports
//
//  Created by test on 2020/1/10.
//  Copyright © 2020 test. All rights reserved.
//

#import "TotalScoreVC.h"
#import "dataTableCell.h"
@interface TotalScoreVC ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic)UITableView *tableView;
@property (nonatomic,copy)NSArray *teamName;
@property (nonatomic,copy) NSArray *buttonTitles;
@end



@implementation TotalScoreVC
-(NSArray *)teamName
{
    if(!_teamName){
        
        //_teamName = [@"利物浦",@"莱斯特城",@"曼城",@"切尔西",@"曼联",@"热刺",@"狼队",@"谢菲尔德联",@"水晶宫",@"西班牙球队"];
        _teamName = @[@"利物浦",@"莱斯特城",@"曼城",@"切尔西",@"曼联",@"热刺",@"狼队",@"谢菲尔德联",@"水晶宫",@"利物浦",@"11",@"12",@"13",@"14"];
    }
    return _teamName;
    
}
- (NSArray *)buttonTitles
{
    if (!_buttonTitles) {
        //@"20",@"19",@"1",@"0",@"4",@"4",@"4",@"58"
        //_buttonTitles = @[@[@"不限",@"情感挽回",@"失恋挽回",@"职场减压",@"家庭关系",@"亲子关系",@"个人成长",@"情感疏导",@"人际关系"],@[@"不限",@"60后",@"70后",@"80后",@"90后"],@[@"不限",@"白羊座",@"金牛座",@"双子座",@"巨蟹座",@"处女座",@"天秤座",@"天蝎座",@"狮子座",@"射手座",@"魔蝎座",@"水瓶座",@"双鱼座"],@[@"不限",@"A型",@"B型",@"AB型",@"O型"],@[@"不限",@"中",@"高",@"低"]];
        // _buttonTitles = @[@[],@[],@[],@[],@[],@[],@[],@[],@[],@[],];
        _buttonTitles = @[@[@"20",@"19",@"1",@"0",@"4",@"4",@"4",@"58"],@[@"20",@"19",@"1",@"0",@"4",@"4",@"4",@"58"],@[@"20",@"19",@"1",@"0",@"4",@"4",@"4",@"58"],@[@"20",@"19",@"1",@"0",@"4",@"4",@"4",@"58"],@[@"20",@"19",@"1",@"0",@"4",@"4",@"4",@"58"],@[@"20",@"19",@"1",@"0",@"4",@"4",@"4",@"58"],@[@"20",@"19",@"1",@"0",@"4",@"4",@"4",@"58"],@[@"20",@"19",@"1",@"0",@"4",@"4",@"4",@"58"],@[@"20",@"19",@"1",@"0",@"4",@"4",@"4",@"58"],@[@"20",@"19",@"1",@"0",@"4",@"4",@"4",@"58"]];
    }
    return _buttonTitles;
}

-(UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,self.view.frame.size.height) style:UITableViewStyleGrouped];
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
   [self.view addSubview:self.tableView];
    
    //self.view.backgroundColor = UIColor.redColor;
    
    /*
     UILabel *VIEW  = UILabel.new;
     VIEW.text = @"dfdffgfgfggfgfgffg";
     VIEW.frame = RECT(100,140,100,100);
     VIEW.backgroundColor  = UIColor.redColor;
     [self.view addSubview:VIEW];
     
     UIButton *btn = [[UIButton alloc]init];
     btn.frame  = CGRectMake(210,140,100,100);
     [btn setTitle:@"按钮" forState:0];
     btn.backgroundColor = UIColor.purpleColor;
     [self.view addSubview:btn];
     [btn addAction:^(id  _Nonnull sender) {
     NSLog(@"按钮点击");
     }];
     */
}
/* 这个函数是显示tableview的章节数*/
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}
/* 这个函数是指定显示多少cells*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.buttonTitles.count;//self.teamName.count; //这个是指定加载数据的多少即显示多少个cell，如过这个地方弄错了会崩溃的哟
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if(section == 0){
        return 80*KWIDTH;
    }
    return 0.1*KWIDTH;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = colorWithHexString(@"#F3F6F4");
    UILabel *label = [[UILabel alloc]init];//h:80
    label.frame = CGRectMake(91*KWIDTH,0*KWIDTH,104*KWIDTH,80*KWIDTH);
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = colorWithHexString(@"#333333");
    label.text = @"球队";
    label.font = Font11;
    [headerView addSubview:label];
    
    
    
    
    
    NSArray *labelTitles = @[@"赛",@"上",@"平",@"下",@"赢",@"走",@"输",@"净胜"];
    [labelTitles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *label = [[UILabel  alloc]init];
        label.frame = RECT(332*KWIDTH + (SCREEN_WIDTH - 332*KWIDTH)/8.0*(idx%8) ,0*KWIDTH,52*KWIDTH,80*KWIDTH);
        label.textColor = colorWithHexString(@"#333333");
        label.text = labelTitles[idx];
        label.font = Font11;
        //label.backgroundColor = UIColor.yellowColor;
        label.textAlignment = NSTextAlignmentCenter;
        //label.font = [UIFont systemFontOfSize:13];
        [headerView addSubview:label];
    }];
    
    
    
    return headerView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier =@"Cell";
    //定义cell的复用性当处理大量数据时减少内存开销
    dataTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell ==nil)
    {
        //cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefaultreuseIdentifier:CellIdentifier];
        cell=[[dataTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell getBallImageName:@"8" BallNameText:self.teamName[indexPath.row]];
    // cell.textLabel.text = self.teamName[indexPath.row];
    //    if(self.teamName.count>0){
    //        [cell setDataLabelTextArray:self.teamName[indexPath.row]];
    //
    
    
    NSArray *num =@[@"22",@"33",@"45",@"67",@"13",@"4",@"6",@"7"];
    
   
    if(self.teamName.count>0){
        
        [cell setDataLabelTextArray:self.buttonTitles[indexPath.section]];
    }
    
    UIColor *color = colorWithHexString(@"#FFDF4C");
    indexPath.row == 0? [cell setBootTextBGColor:colorWithHexString(@"#FF5325")] : indexPath.row == 1? [cell setBootTextBGColor:colorWithHexString(@"#FFB525")]:  indexPath.row == 2? [cell setBootTextBGColor:color]:[cell setBootTextBGColor:UIColor.clearColor] ;
    [cell setBootTextStr:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    if(indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2){
       // cell.backgroundColor = UIColor.redColor;
        [cell setBootTextTextColor:UIColor.whiteColor];
        [cell setBootTextCornerRadius:15*KWIDTH ];
        [cell setMaskToBounds:YES];
        
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"点击了第%ld行",indexPath.row);
}


@end
