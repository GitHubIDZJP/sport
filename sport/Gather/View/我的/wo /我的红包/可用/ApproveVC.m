
#import "ApproveVC.h"
#import "UnifiedCell.h"
@interface ApproveVC ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)UITableView *tableView;
@end

@implementation ApproveVC
-(UITableView *)tableView{
    
    if(!_tableView){
        //64+ 60
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH,SCREEN_HEIGHT-JH_TabBarHeight) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = color(242, 242, 242);
        // _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = tableSeparatorColor;
        // _tableView.rowHeight = 88*KWIDTH;
        _tableView.rowHeight = 240*KWIDTH;
        IOS11;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;//行数
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 15*KWIDTH;
    }
    return 15*KWIDTH;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];//个人觉得用clearColor可能会出问题,比如离屏渲染什么的.但是我现在还没有碰到过..
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"Cell data";
    UnifiedCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil)
    {
        //  cell=[[XibCustomCellT alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //注册一个XIBcell
        cell=[[[NSBundle mainBundle]loadNibNamed:@"UnifiedCell" owner:nil options:nil]lastObject];
       // cell.food=self.dataArray[indexPath.row];
       // cell.backgroundColor= UIColor.redColor;
    }
    return cell;
}


@end
