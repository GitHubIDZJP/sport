
#import "SecondViewController.h"
#import "MyCollectionViewCell.h"
#import "RightTableViewCell.h"
@interface SecondViewController ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSArray *textLabel;
@property(nonatomic,strong)NSArray *collectionCounts;
@end

@implementation SecondViewController
-(NSArray *)collectionCounts{
    
    if(!_collectionCounts){
        _collectionCounts = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39"];
    }
    return _collectionCounts;
}



-(NSArray*)textLabel{
    
    if(!_textLabel){
        
        _textLabel = @[@"国际赛事",@"沙滩赛事"];
    }
    return _textLabel;
    
}
-(UITableView *)TableView{
    
    if(!_LeftTableView){
        
        //IOS11;
    }
    return _LeftTableView;
}
-(UITableView*)LeftTableView
{
    if(!_LeftTableView){
        _LeftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0*KWIDTH,177*KWIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _LeftTableView.delegate=self;
        _LeftTableView.dataSource=self;
        _LeftTableView.backgroundColor = color(242, 242, 242);//color(242, 242, 242);
        // _tableView.dataSource = self;
        _LeftTableView.scrollEnabled = NO;
        _LeftTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _LeftTableView.separatorColor = tableSeparatorColor;
        _LeftTableView.rowHeight = 88*KWIDTH;
    }
    return _LeftTableView;
}
-(UITableView*)RightTableView
{
    if(!_RightTableView){
        _RightTableView = [[UITableView alloc]initWithFrame:CGRectMake(_LeftTableView.x+_LeftTableView.width,_LeftTableView.frame.origin.y,SCREEN_WIDTH - 177*KWIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _RightTableView.delegate=self;
        _RightTableView.dataSource=self;
        _RightTableView.backgroundColor =color(242, 242, 242) ;//color(242, 242, 242);
        // _tableView.dataSource = self;
        _RightTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _RightTableView.separatorColor = tableSeparatorColor;
        _RightTableView.rowHeight = 88*KWIDTH;
        _RightTableView.scrollEnabled = NO;
        // IOS11;
        //重写
    }
    return _RightTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = color(242, 242, 242);
    [self loadSub];
    
    
    [self addLabel];
    
    //新加的
    _firstIndex=0;
    
    /*
     table1:
     背景色 color(245,245,245)
     table1:
     背景色 color(245,245,245)
     */
    
    // _dicData=@{@"进球":@[@"深圳",@"广州",@"东莞"],@"射门":@[@"驻马店",@"周口",@"郑州",@"黄麟",@"于都"]};
  _dicData=@{@"进球":@[@"利物浦",@"莱斯特城",@"曼城",@"切尔西",@"曼联",@"热刺",@"狼队",@"谢菲尔德联",@"水晶宫    ",@"中超",@"中甲",@"南甲",@"北甲",@"天甲"],@"射门":@[@"西甲",@"利物浦",@"莱斯特城",@"曼联",@"切尔西",@"狼队",@"水晶宫 ",@"狼队",@"漫威",@"杀破狼队",@"黄超队",@"啦啦队",@"黑马队",@"中联队"]};
    
}
-(void)loadSub{
    
    [self.view addSubview:self.LeftTableView];
    [self.view addSubview:self.RightTableView];
    
    //  [UITableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    
    //  [_LeftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
}





-(void)addLabel{
    UIView *titleBar = UIView.new;
    titleBar.backgroundColor =color(242, 242, 242);
    [self.view addSubview:titleBar];
    [titleBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(42);
        make.topMargin.mas_equalTo(0);
        
    }];
    UIView *ious = [[UIView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,9)];
    ious.backgroundColor = UIColor.whiteColor;
    [titleBar addSubview:ious];
    NSArray *titles = @[@"球队",@"总计"];
    
    
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        self.headLabel = getLabel(RECT(303*KWIDTH+ idx* 160,35*KWIDTH,80*KWIDTH,35*KWIDTH), titles[idx], colorWithHexString(@"#333333"), Font11);
        // self.headLabel.backgroundColor= QCRandomColor;
        self.headLabel.textAlignment = NSTextAlignmentCenter;
        [titleBar addSubview:self.headLabel];
    }];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    
    //return 1;
    if([tableView isEqual:self.LeftTableView]){
        return 1;
    }else if([tableView isEqual:self.RightTableView]){
        return 1;
    }
    
    return 0;
}
//每组的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==self.LeftTableView) {
        return _dicData.allKeys.count;
    }
    else if (tableView==self.RightTableView)
    {
        NSString *key=[_dicData.allKeys objectAtIndex:_firstIndex];
        NSArray *arr=[_dicData objectForKey:key];
        return arr.count;
    }
    /*
     if([tableView isEqual:self.LeftTableView]){
     return 2;
     }else if([tableView isEqual:self.RightTableView]){
     return 20;
     }
     */
    
    return 0;
    // return  self.textLabel.count;
}
//组之间的距离
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if([tableView isEqual:self.LeftTableView]|| [tableView isEqual:self.RightTableView]){
        return 0.1*KWIDTH;
    }
    return 0.1;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if([tableView isEqual:self.LeftTableView]|| [tableView isEqual:self.RightTableView]){
        return 0.1*KWIDTH;
    }
    return 0.1;
    
    
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if([tableView isEqual:self.LeftTableView]){
        return 88*KWIDTH;
    }else if([tableView isEqual:self.RightTableView]){
        return 100*KWIDTH;
    }
    return 0;
    
    
    
}

//数据源
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }

    
    
    
    //选中table1
    if (tableView==_LeftTableView)
    {
        cell.backgroundColor = color(242, 242, 242);
        if (indexPath.row == _firstIndex ) {
            //不选中cell的背景色--红色
            cell.backgroundColor=UIColor.whiteColor;
            
        }
        else
        {
            //不选中cell的颜色
            cell.backgroundColor = color(242, 242, 242);
        }
        //把字典的可以值一次赋值到cell里
        cell.textLabel.text=[_dicData.allKeys objectAtIndex:indexPath.row];
        
        //新加的:]
        
        
    }
    else if(tableView == _RightTableView)
    {
        static NSString *identifier = @"df";
        RightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil){
            cell =[[RightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        //tab2背景色为灰色
        cell.backgroundColor=UIColor.whiteColor;
        //获取所有可以的里的value值
        NSString *key=[_dicData.allKeys objectAtIndex:_firstIndex];//dicData字典左右key中得某一个元素
        //通过数组保存起来 再依次赋值到cell里
        NSArray *arr=[_dicData objectForKey:key];
        
        [cell addImgPath:@"8" TexStr:[arr objectAtIndex:indexPath.row] tNumber:@"58"];
        
        
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
    
    return cell;
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //[self.collection reloadData];
    
    if (tableView == _LeftTableView) {
        
        _firstIndex=indexPath.row;
        [_RightTableView reloadData];
        [_LeftTableView reloadData];
        
        
        
    }
    
    else if(tableView == _RightTableView){
        NSLog(@"%ld  %ld",_firstIndex,indexPath.row);
        //  [_LeftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0] animated:NO scrollPosition:UITableViewScrollPositionBottom];
        //做跳转事件
        /*
        if(indexPath.row  ==0 || indexPath.row == 1 || indexPath.row == 2)
            
        {
            Class class=NSClassFromString(@"PlayerAnalysisVC");
            
            if(class) {
                
                UIViewController *ctrl =class.new;
                ctrl.modalPresentationStyle = 0;
                [self presentViewController:ctrl animated:NO completion:nil];
                
                
            }
            
        }*/
        PlayerAnalysisVC *PlayerAnalysisVCChildVC = [[PlayerAnalysisVC alloc]init];
        [self.navigationController pushViewController:PlayerAnalysisVCChildVC animated:YES];
        
    }
    
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
#ifdef __IPHONE_8_0
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
#endif
}




@end
