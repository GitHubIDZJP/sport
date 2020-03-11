



#import "userRecommendedVC.h"
#import "userRecommendedCell.h"
@interface userRecommendedVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation userRecommendedVC
-(NSArray *)dataSource
{
    if(!_dataSource){
        _dataSource = @[@"推文1:sdhjsdfhgjdf--pig",@"推文2:sdhjdfhjdfhjdf",@"y推文3:谢谢哦小偶像噢嘻嘻"];
    }
    return _dataSource;
}

    
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    VCBGCOLOR;
    [self addTopBar];
}
-(void)addTopBar{
    [self.view addSubview:self.NavBar];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 30*KWIDTH;
    }return 1*KWIDTH;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 156*KWIDTH;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ident = @"it's cell";
    userRecommendedCell *cell =[tableView dequeueReusableCellWithIdentifier:ident];
    if(!cell){
        cell = [[userRecommendedCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ident];
    }
    [cell getTweetText:self.dataSource[indexPath.row] timerStr:@"12:43 2019/10 /5 "];
    
   
    [cell setMyBlock:^{
        NSLog(@"sd");
        static NSInteger click = 68;
        click = click+1;
        self->stringInt = [NSString stringWithFormat:@"%ld",click];
    }];
    
     [cell setclickAddCurrentValuebackgroundImage:@"点赞" currentLabelText:@"100"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    
    
}
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
       // _NavBar.backgroundColor =  colorWithHexString(@"#07913B");
        [_NavBar setRightButtonIsHidden:YES];
        [_NavBar setCenterText:@"我的推荐"];
       // [_NavBar setCenterTextColor:UIColor.whiteColor];
        __block  UIViewController *vc = self;
        [_NavBar setBackBlock:^{
            NSLog(@"导航条按钮");
            //[vc dismissViewControllerAnimated:NO completion:nil];
              [vc.navigationController popViewControllerAnimated:YES];
        }];
    }
    return _NavBar;
}
-(UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,self.NavBar.height + self.NavBar.y,SCREEN_WIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
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
@end
