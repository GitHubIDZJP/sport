//
//  articleVC.m
//  Sports
//
//  Created by test on 2020/1/8.
//  Copyright © 2020 test. All rights reserved.
//

#import "articleVC.h"
#import "articleVCCell.h"
@interface articleVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation articleVC
-(UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0*KWIDTH,SCREEN_WIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
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
-(NSArray*)dataSource
{
    
    if(!_dataSource){
        _dataSource = @[@"世体:1232345667789898990890",@"世体:dfhsdhjhsdhghsdghsgdsd"];
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor =UIColor.purpleColor;
    [self.view addSubview:self.tableView];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 80*KWIDTH;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *groupHead = [[UIView alloc]init];
    groupHead.backgroundColor = [UIColor whiteColor];
    groupHead.frame= RECT(0,0,SCREEN_WIDTH,80*KWIDTH);
    UIView *shelter = [[UIView alloc]initWithFrame:RECT(0,0*KWIDTH,SCREEN_WIDTH,30*KWIDTH)];
    shelter.backgroundColor = color(240, 240, 240);
    [groupHead addSubview:shelter];
    UIImageView *groupHeadImg =[[UIImageView alloc]init];
    groupHeadImg.backgroundColor = [UIColor purpleColor];
    CGFloat imgH = 15*KWIDTH;
    CGFloat imgY  = 51*KWIDTH;//groupHead.height/2 - imgH/2;
    groupHeadImg.frame = RECT(36*KWIDTH,imgY,imgH,imgH);
    [groupHead  addSubview:groupHeadImg];
    
    UILabel *title  = getLabel(RECT(groupHeadImg.x + groupHeadImg.width + 10*KWIDTH,45*KWIDTH,150*KWIDTH,26*KWIDTH), @"他的文章", colorWithHexString(@"#333333"), Font14);
    title.textAlignment = NSTextAlignmentLeft;
    [groupHead addSubview:title];
 
//    [groupHead.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if([obj isKindOfClass:[UILabel class]] && [obj isKindOfClass:[UIImageView class]])
//        {
//           // obj.backgroundColor = UIColor.clearColor;
//            [obj addSubview:title];
//            [obj addSubview:groupHeadImg];
//        }
//    }];
    
    return groupHead;
    
    
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120*KWIDTH;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *ident = @"it's cell";
    articleVCCell *cell =[tableView dequeueReusableCellWithIdentifier:ident];
    if(!cell){
        cell = [[articleVCCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ident];
        
        
        
    }
    //假数据 后期从后台调取
    NSArray *Comper = [NSArray arrayWithObjects:@"米下个山东黄金的发生的规划十多个",@"必扫山东黄金时代黄齑淡饭", nil];
    [cell getVersonText:self.dataSource[indexPath.row] versonDescText:Comper[indexPath.row] skimText:@"2019-01 11:11"];
    
    
    
    
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
