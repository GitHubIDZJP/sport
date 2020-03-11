

#import "trendsDataVC.h"
#import "trendsDataCell.h"
@interface trendsDataVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation trendsDataVC
-(UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = color(243,243,243);
        // _tableView.dataSource = self;
        _tableView.rowHeight = 200*KWIDTH;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = colorWithHexString(@"#DDDDDD");//color(251, 251,251);
        IOS11;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    
    
}
//2个方法一起调用才行
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* sectionview = [[UIView alloc]init];
    
    return sectionview;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;//行数
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"Cell data";
    trendsDataCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil)
    {
        
        //  cell=[[XibCustomCellT alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //注册一个XIBcell
        cell=[[[NSBundle mainBundle]loadNibNamed:@"trendsDataCell" owner:nil options:nil]lastObject];
        //cell.food=self.dataArray[indexPath.row];
    }
    //load data
    NSString *str = @"大清洗?曝恒大准备兜售老将仅留郑智政策影响转会,大准备兜售老将仅留郑智政策影响转会";
    [cell setDescText:str  selBtn:@"new浏览@2x" supportText:@"88"];
    [cell setrightPictureImg:@"shaow"];
    
   //  [self addBorderToLayer:cell.rightPicture];
    [cell setAddSupportCountBtn:^(UIButton *count) {
        
        
        [self addCount:count];
    }];
    return cell;
}
//- (void)addBorderToLayer:(UIView *)view
//{
//    CAShapeLayer *border = [CAShapeLayer layer];
//    //  线条颜色
//    border.strokeColor = [UIColor blackColor].CGColor;
//
//    border.fillColor = nil;
//
//    border.path = [UIBezierPath bezierPathWithRect:view.bounds].CGPath;
//
//    border.frame = view.bounds;
//
//    // 不要设太大 不然看不出效果
//    border.lineWidth = 1;
//
//    border.lineCap = @"square";
//    
//    //  第一个是 线条长度   第二个是间距    nil时为实线
//    border.lineDashPattern = @[@1, @4];
//
//    [view.layer addSublayer:border];
//}
-(void)addCount:(UIButton*)sender{
    NSLog(@"点击按钮");
}










@end
