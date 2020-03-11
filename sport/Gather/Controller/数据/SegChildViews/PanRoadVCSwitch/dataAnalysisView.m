//
//  dataAnalysisView.m
//  Sports
//
//  Created by test on 2020/1/10.
//  Copyright © 2020 test. All rights reserved.
//
#pragma mark 数据分析--大小
#import "dataAnalysisView.h"

@interface dataAnalysisView()<UITableViewDelegate,UITableViewDataSource>
{
    
}
//申明
@property (strong,nonatomic)UITableView *tableView;
@property (strong,nonatomic)NSArray *teamName;

@end
@implementation dataAnalysisView
-(NSArray *)teamName
{
    if(!_teamName){
        
        //_teamName = [@"利物浦",@"莱斯特城",@"曼城",@"切尔西",@"曼联",@"热刺",@"狼队",@"谢菲尔德联",@"水晶宫",@"西班牙球队"];
        _teamName = @[@"1",@"2"];
    }
    return _teamName;
    
    
}
//懒加载
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

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        [self addSubview:self.tableView];
        
    }
    return self;
}
//代理事件
/* 这个函数是显示tableview的章节数*/
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
    
}
/* 这个函数是指定显示多少cells*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.teamName count];//这个是指定加载数据的多少即显示多少个cell，如过这个地方弄错了会崩溃的哟
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100*KWIDTH;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //定义个静态字符串为了防止与其他类的tableivew重复
    static NSString *CellIdentifier =@"Cell";
    //定义cell的复用性当处理大量数据时减少内存开销
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell ==nil)
    {
        //cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefaultreuseIdentifier:CellIdentifier];
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
   
    cell.textLabel.text = self.teamName[indexPath.row];
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"点击了第%ld行",indexPath.row);
}


@end
