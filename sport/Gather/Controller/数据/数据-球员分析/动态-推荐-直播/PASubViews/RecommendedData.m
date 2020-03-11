


#import "RecommendedData.h"
#import "RecommendedDataHeaderView.h"
#import "RecommendedDataCell.h"
@interface RecommendedData ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray*buttons;
@property (strong,nonatomic)UITableView *tableView;
@end


@implementation RecommendedData
-(UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0*KWIDTH,SCREEN_WIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
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
    
    self.view.backgroundColor = UIColor.yellowColor;
    
   [self.view addSubview:self.tableView];
    
    RecommendedDataHeaderView *hv  = [[RecommendedDataHeaderView alloc]init];
    hv.frame = CGRectMake(0,0,SCREEN_WIDTH,250*KWIDTH);
    hv.backgroundColor = UIColor.whiteColor;
    self.tableView.tableHeaderView  = hv;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 60*KWIDTH;
    
}







- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headerView = [[UIView alloc] init];
    
    headerView.backgroundColor = [UIColor clearColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,60*KWIDTH)];
    label.text = @"  技术数据";
    label.font=  Font12;
    [headerView addSubview:label];
    return headerView;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 175*KWIDTH;
}
/* 这个函数是指定显示多少cells*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10; //这个是指定加载数据的多少即显示多少个cell，如过这个地方弄错了会崩溃的哟
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier =@"Cell";
    //定义cell的复用性当处理大量数据时减少内存开销
    RecommendedDataCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell ==nil)
    {
        //cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefaultreuseIdentifier:CellIdentifier];
        //  cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell= [[[NSBundle mainBundle]loadNibNamed:@"RecommendedDataCell" owner:nil options:nil]lastObject];
    }
    
    // cell.textLabel.text = self.teamName[indexPath.row];
    //[cell setDateLabel:@"01-11 04：00" TeamAlabel:@"曼联" tLogoA:@"微信" vsLabelText:@"VS" teamLogoB:@"支付宝" teambText:@"狼队"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"点击了第%ld行",indexPath.row);
}

@end
