

#import "HXArticlesViewController.h"
#import "articleVCCell.h"
@interface HXArticlesViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation HXArticlesViewController
-(UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0*KWIDTH,SCREEN_WIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = color(243,243,243);
        // _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //_tableView.separatorColor = colorWithHexString(@"#000000");//color(251, 251,251);
        IOS11;
    }
    return _tableView;
}
-(NSArray*)dataSource
{
    
    if(!_dataSource){
        _dataSource = @[@"世体：托迪博将租借离开巴萨 合同中不会包含买断条款胸衣",@"世体：托迪博将租借离开巴萨 合同中不会包含买断条款胸衣"];
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor =UIColor.purpleColor;
    [self.view addSubview:self.tableView];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    //96+30
    return 100*KWIDTH;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    
    UIView *groupHead = [[UIView alloc]init];
    groupHead.backgroundColor = [UIColor whiteColor];
    groupHead.frame= RECT(0,0,SCREEN_WIDTH,100*KWIDTH);
   
    UIView *shelter = [[UIView alloc]initWithFrame:RECT(0,0*KWIDTH,SCREEN_WIDTH,30*KWIDTH)];
    shelter.backgroundColor = color(240, 240, 240);
    [groupHead addSubview:shelter];
    UIImageView *groupHeadImg =[[UIImageView alloc]init];
  
   // groupHeadImg.backgroundColor = [UIColor purpleColor];
    groupHeadImg.frame = RECT(30*KWIDTH,56*KWIDTH,26*KWIDTH,26*KWIDTH);
      groupHeadImg.image = [UIImage imageNamed:@"diamondIcon"];
    [groupHead  addSubview:groupHeadImg];
    
    
    
    
    UILabel *title  = getLabel(RECT(groupHeadImg.x + groupHeadImg.width + 10*KWIDTH,groupHeadImg.y,150*KWIDTH,26*KWIDTH), @"他的文章", colorWithHexString(@"#333333"), Font14);
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
    return 164*KWIDTH;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    static NSString *ident = @"it's cell";
    articleVCCell *cell =[tableView dequeueReusableCellWithIdentifier:ident];
    if(!cell){
        cell = [[articleVCCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ident];
        
      
        
        
    }
    //假数据 后期从后台调取
    NSArray *Comper = [NSArray arrayWithObjects:@"据西班牙《世界体育报》报道，法国中卫托迪博将在冬季转会窗地就",@"据西班牙《世界体育报》报道，法国中卫托迪博将在冬季转会窗更换", nil];
    [cell getVersonText:self.dataSource[indexPath.row] versonDescText:Comper[indexPath.row] skimText:@"2019-01 11:11"];
    
    
    //虚线
    UILabel *DottedLine = [[UILabel alloc]initWithFrame:CGRectMake(20*KWIDTH,cell.height*2 - 10*KWIDTH,SCREEN_WIDTH-40*KWIDTH,2*KWIDTH)];
    DottedLine.text = @"------------------------------------------------";
   // DottedLine.backgroundColor =UIColor.redColor;//colorWithHexString(@"#FFFFFF");
      DottedLine.backgroundColor =colorWithHexString(@"#FFFFFF");
  
    if(indexPath.row == 0){
          [cell addSubview:DottedLine];
    }else if (indexPath.row == self.dataSource.count -1){
        DottedLine.hidden = YES;
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


