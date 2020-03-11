


#import "thirdViewController.h"

#import "MyCollectionViewCell.h"
#define ChooseColor UIColor.whiteColor
#import "RightTableViewCell.h"
@interface thirdViewController ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSArray *textLabel;
@property(nonatomic,strong)NSArray *collectionCounts;
@property(nonatomic,strong)NSArray * firstOneArr;
@property(nonatomic,strong)NSArray * firstTwoArr;
@end
@implementation thirdViewController
-(NSArray*)firstOneArr{
    if(_firstOneArr == nil){
        _firstOneArr=@[@"利物浦",@"莱斯特城",@"曼城",@"切尔西",@"曼联",@"热刺",@"狼队",@"谢菲尔德联",@"水晶宫",@"黄岩队 ",@"狼队",@"漫威",@"杀破狼队",@"黄超队",@"啦啦队",@"黑马队",@"中联队"];
    }
    return _firstOneArr;
}
-(NSArray*)firstTwoArr{
    if(_firstTwoArr == nil){
        _firstTwoArr = @[@"中超",@"中甲",@"西曼"];
    }
    return _firstTwoArr;
}
-(UITableView*)LeftTableView
{
    if(!_LeftTableView){
        _LeftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0*KWIDTH,180*KWIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _LeftTableView.delegate=self;
        _LeftTableView.dataSource=self;
        _LeftTableView.backgroundColor = color(242, 242, 242);//color(242, 242, 242);
        // _tableView.dataSource = self;
        _LeftTableView.scrollEnabled = NO;
        _LeftTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _LeftTableView.separatorColor = tableSeparatorColor;
        _LeftTableView.rowHeight = 88*KWIDTH;
       // IOS11;
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
        _RightTableView.scrollEnabled = YES;
        //_RightTableView.alwaysBounceVertical=NO;//总是垂直弹
        //_RightTableView.bounces=NO;//反弹
        //_RightTableView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT + 100);
       //  IOS11;
       
    }
    return _RightTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = color(242, 242, 242);
    [self loadSub];
    [self addLabel];
    _leftTabArr = @[@"进球",@"射门"];
}
-(void)loadSub{
    [self.view addSubview:self.LeftTableView];
    [self.view addSubview:self.RightTableView];
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
   
    if(tableView == self.LeftTableView || tableView == self.RightTableView){
        return 1;
    }
    return 0;
}
//每组的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == self.LeftTableView){
        return _leftTabArr.count;
    }else if (tableView == self.RightTableView){
        if(isSel == 0){
          return   self.firstOneArr.count;
        }else if (isSel == 1){
           return  self.firstTwoArr.count;
        }
    }
    return 0;
}
//组之间的距离
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(tableView == self.LeftTableView || tableView == self.RightTableView){
        return 0.1*KWIDTH;
    }
    return 0.1;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
   
    if(tableView == self.LeftTableView || tableView == self.RightTableView){
        return 0.1*KWIDTH;
    }
    return 0.1;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   

    if(tableView == self.LeftTableView){
        return 88*KWIDTH;
    }else if (tableView == self.RightTableView){
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
        if(isSel == 0)
        {
            if(indexPath.row == 0){
                cell.backgroundColor = ChooseColor;
            }else{
                cell.backgroundColor = color(242, 242, 242);
            }
        }else if (isSel == 1){
            
            if(indexPath.row == 1){
                cell.backgroundColor = ChooseColor;
            }else{
                cell.backgroundColor = color(242, 242, 242);
            }
        }
        cell.textLabel.text = self.leftTabArr[indexPath.row];
    }
    else if(tableView == _RightTableView)
    {
        static NSString *identifier = @"df";
        RightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil){
            cell =[[RightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        if(isSel == 0)
        {
         
            [cell addImgPath:@"8" TexStr:self.firstOneArr[indexPath.row] tNumber:@"38"];
        }else if (isSel == 1){
             [cell addImgPath:@"8" TexStr:self.firstTwoArr[indexPath.row] tNumber:@"38"];
        
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
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
    if(tableView ==  self.LeftTableView || tableView == self.RightTableView){
        isSel = indexPath.row;
        switch (isSel) {
            case 0:
            {
                NSLog(@"1");
                [self.LeftTableView reloadData];
                [self.RightTableView reloadData];
                break;
            }
            case 1:{
                NSLog(@"10");
                 [self.LeftTableView reloadData];
                [self.RightTableView reloadData];
                break;
            }
            default:
                break;
        }
        [self.RightTableView reloadData];
    }
    if(tableView== self.RightTableView){
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        PlayerAnalysisVC *PlayerAnalysisVCChildVC = [[PlayerAnalysisVC alloc]init];
        [self.navigationController pushViewController:PlayerAnalysisVCChildVC animated:YES];
    }
        NSLog(@"%ld  %ld",_firstIndex,indexPath.row);
}
@end
