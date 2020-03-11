//
//  fourthViewController.m
//  SectionChooseVC
//
//  Created by test on 2020/1/9.
//  Copyright © 2020 lujh. All rights reserved.
//



//赛程-->
#import "fourthViewController.h"
#import "scheduleCell.h"//赛程
@interface fourthViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray*buttons;
@property (strong,nonatomic)UITableView *tableView;
@end




@implementation fourthViewController
-(NSMutableArray*)buttons
{
    if(!_buttons){
        _buttons = [NSMutableArray arrayWithObjects:@"上一轮",@"下一轮", nil];
    }
    return _buttons;
    
}
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
  
    [self.view addSubview:self.tableView];
    
    
    
    
    

   
    
    
    
    
    
    
    
   
    
//
//    //数据轮播左按钮
//    navButton *dataShufflingLeftBtn = [[navButton alloc]init];
//    dataShufflingLeftBtn.backgroundColor = UIColor.redColor;
//    dataShufflingLeftBtn.frame = CGRectMake(100,200,200,200);
//    [self.view addSubview:dataShufflingLeftBtn];
//    [dataShufflingLeftBtn setTopImg:@"youjiantou.png" andBottomLable:@"我才你妈"];
//    [dataShufflingLeftBtn addTapBlock:^(UIButton * _Nonnull button) {
//       NSLog(@"你是傻逼ლ(′◉❥◉｀ლ) ")
//
//    }];
   
//
   
    
    self.headView = [[UIView alloc]init];
    self.headView.frame = CGRectMake(0,0,SCREEN_WIDTH,80*KWIDTH);
    self.headView.backgroundColor = colorWithHexString(@"#F3F6F4");
    self.tableView.tableHeaderView = self.headView;
    
    
    [self.buttons enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat margin_Left = 30*KWIDTH;
        CGFloat bannerBtnW  = 90*KWIDTH;
        CGFloat space = ((SCREEN_WIDTH)/2)+2*bannerBtnW;
        CGFloat  y = self.headView.height / 2 - 15*KWIDTH;
        RotaryButton *bannerBtn = [[RotaryButton alloc]init];
        bannerBtn.frame = CGRectMake(margin_Left + idx*(bannerBtnW + space), y, bannerBtnW, 30*KWIDTH);
        bannerBtn.tag =  100+idx;
        //bannerBtn.backgroundColor = RandomColor;
        // [self.view addSubview:bannerBtn];
        if(idx == 0){
            [bannerBtn setRotaryBtnImgPath:@"zuojiantou.png" labelText:@"上一轮"];
        }else
        {
            [bannerBtn setRotaryBtnImgPath:@"youjiantou.png" labelText:@"下一轮"];
            [bannerBtn changeLabelCoordinateX:-20*KWIDTH imgHCoordinateX: 50*KWIDTH ];
        }
        [self.headView addSubview:bannerBtn];
        [bannerBtn addTarget:self action:@selector(dataCarousel:) forControlEvents:1<< 6];
        
    }];
    
}



-(void)dataCarousel:(UIButton*)carousel{
   
    UIButton *firstBtn = (UIButton*)[carousel viewWithTag:100];
    UIButton *secondBtn = (UIButton*)[carousel viewWithTag:101];
    if(carousel ==firstBtn){
         NSLog(@"数据轮播1");
    }else if (carousel == secondBtn){
         NSLog(@"数据轮播2");
        
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/* 这个函数是显示tableview的章节数*/
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100*KWIDTH;
}
/* 这个函数是指定显示多少cells*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4; //这个是指定加载数据的多少即显示多少个cell，如过这个地方弄错了会崩溃的哟
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier =@"Cell";
    //定义cell的复用性当处理大量数据时减少内存开销
    scheduleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell ==nil)
    {
        //cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefaultreuseIdentifier:CellIdentifier];
      //  cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell= [[[NSBundle mainBundle]loadNibNamed:@"scheduleCell" owner:nil options:nil]lastObject];
    }
    
    
    
   // cell.textLabel.text = self.teamName[indexPath.row];
    [cell setDateLabel:@"01-11 04：00" TeamAlabel:@"利物浦" tLogoA:@"8" vsLabelText:@"VS" teamLogoB:@"49" teambText:@"莱斯城"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"点击了第%ld行",indexPath.row);
}


@end
