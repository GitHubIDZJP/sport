

#import "InviteFriendsVC.h"
#import "HeadPictureSubView.h"
#import "InviteXIBCell.h"
@interface InviteFriendsVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)HeadPictureSubView *InviteView;
@property(nonatomic,strong)UIImageView *pImg;
@property(nonatomic,strong)UILabel *pLabel;
@property(nonatomic,strong)UITextView *TextView;
@end



@implementation InviteFriendsVC
-(UIImageView*)HeadPicture
{
    if(!_HeadPicture){
        _HeadPicture = UIImageView.new;
        _HeadPicture.frame = RECT(0,self.NavBar.height + self.NavBar.y,SCREEN_WIDTH,801*KWIDTH);
        //_HeadPicture.backgroundColor = UIColor.yellowColor;
        _HeadPicture.image = [UIImage imageNamed:@"title@2x"];
        _HeadPicture.backgroundColor =UIColor.whiteColor;
    }
    return _HeadPicture;
}
-(UIImageView *)gradient
{
    if(!_gradient){
        
        _gradient = UIImageView.new;
        _gradient.frame = CGRectMake(316*KWIDTH, _HeadPicture.height - 60*KWIDTH,117*KWIDTH,29*KWIDTH);
       _gradient.image = [UIImage imageNamed:@"奖励明细"];
       // _gradient.textAlignment = NSTextAlignmentCenter;
       // _gradient.text = @"奖励明细";
      //  _gradient.attributedText = [UIImage imageNamed:@"奖励明细"];
        //_gradient.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"奖励明细"]];
    }
    return _gradient;
    
    
}
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
        _NavBar.backgroundColor = colorWithHexString(@"#FFFFFF");//color(64,143,68);
    }
    return _NavBar;
}

-(UITableView*)tableView
{
    if(!_tableView){
        //64+ 60
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,self.NavBar.height + self.NavBar.y ,SCREEN_WIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = UIColor.whiteColor;//color(242, 242, 242);
        // _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = tableSeparatorColor;
        // _tableView.rowHeight = 88*KWIDTH;
        _tableView.rowHeight = 76*KWIDTH;
        IOS11;
    }
    return _tableView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.NavBar];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
      //  [vc dismissViewControllerAnimated:false completion:nil];
        [vc.navigationController popViewControllerAnimated:YES];
        NSLog(@"返回上一个页面");
    }];
    [self.NavBar setRightButtonIsHidden:YES];
    [self.NavBar setCenterText: @"邀请好友"];
    [self.NavBar setCenterTextColor:[UIColor blackColor]];
      [self.view addSubview:self.tableView];
    [self.tableView.tableHeaderView  addSubview: self.HeadPicture];
    
    
    
    
    
    
    
  //  [self.view addSubview:self.HeadPicture];
    [self.HeadPicture addSubview:self.gradient];
     
     
    self.tableView.tableHeaderView = self.HeadPicture;
    
    NSArray *leftIconArr = [NSArray arrayWithObjects:@"人头",@"人数",nil];
    NSArray *leftArrDesc = @[@"今日邀请",@"累计邀请"];
    NSArray *rleftArrPeopleCount =@[@"1",@"2"];
    
    
    for(int i = 0;i< 2;i++){
        _InviteView = [[HeadPictureSubView alloc]init];
        _InviteView.frame  = RECT(30*KWIDTH,438*KWIDTH+i*(120*KWIDTH+ 20*KWIDTH),335*KWIDTH,120*KWIDTH);
     
        [self.HeadPicture addSubview:self.InviteView];
        [_InviteView setImgNamePath:leftIconArr[i] imgDescText:leftArrDesc[i] peopleNumbers:rleftArrPeopleCount[i] suffixText:@"人"];
    }
    
    
    NSArray *rightIconArr = [NSArray arrayWithObjects:@"奖励",@"双人奖励",nil];
    NSArray *rightArrDesc = @[@"今日奖励",@"累计奖励"];
    NSArray *rightArrPeopleCount =@[@"10",@"20"];
    for(int j = 0;j< 2;j++){
        
        _InviteView = [[HeadPictureSubView alloc]init];
        CGFloat margin_left=385*KWIDTH;
        _InviteView.frame  = RECT(margin_left,438*KWIDTH+j*(120*KWIDTH+ 20*KWIDTH),335*KWIDTH,120*KWIDTH);
       
         [self.HeadPicture addSubview:self.InviteView];
        [_InviteView setImgNamePath:rightIconArr[j] imgDescText:rightArrDesc[j] peopleNumbers:rightArrPeopleCount[j] suffixText:@"球币"];
    }
    
    
    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;//行数
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1*KWIDTH;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* sectionview = [[UIView alloc]init];
    
    return sectionview;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 950*KWIDTH;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* sectionview = [[UIView alloc]init];
   // [sectionview addSubview:self.screenshotImg];
    UIImageView *iL = [[UIImageView alloc]initWithFrame:RECT(316*KWIDTH,30*KWIDTH,118*KWIDTH,29*KWIDTH)];
//    iL.text = @"邀请流程";
//    iL.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"邀请流程"]];
//    iL.font  = Font15;
//    iL.textAlignment = NSTextAlignmentCenter;
    iL.image= [UIImage imageNamed:@"邀请流程"];
    [sectionview addSubview:iL];
    UILabel *iLDesc = [[UILabel alloc]initWithFrame:RECT(0,iL.y + iL.height + 20*KWIDTH,SCREEN_WIDTH,29)];
    iLDesc.font = Font12;
    iLDesc.text = @"每成功邀请一名好友注册，你将立即获得10球币奖励";
    iLDesc.textAlignment = NSTextAlignmentCenter;
    iLDesc.textColor = colorWithHexString(@"#666666");
    [sectionview addSubview:iLDesc];
    
    NSArray *pIcon = [NSArray arrayWithObjects:@"链接",@"书写",@"金钱", nil];
    for(int p = 0;p < 3;p++){
        CGFloat pML  = 63*KWIDTH;
        CGFloat pW = 88*KWIDTH;
        CGFloat space = (SCREEN_WIDTH  -126*KWIDTH)/3.5;
        self.pImg = [[UIImageView alloc]initWithFrame:RECT(  pML + p *(pW + space) ,iLDesc.height  + iLDesc.y + 30*KWIDTH,pW,pW)];
        self.pImg.image =[UIImage imageNamed:pIcon[p]];
       // self.pImg.backgroundColor = RandomColor;
        [sectionview addSubview:self.pImg];
    }
    
    NSArray *arrText = @[@"1.分享链接",@"2.好友通过链接注册",@"3.获得奖励"];
    for ( int t= 0 ;t< 3;t++){
        CGFloat  s = (SCREEN_WIDTH -84*KWIDTH) /3;
        self.pLabel = [[UILabel alloc]initWithFrame:RECT(42*KWIDTH + t * s,self.pImg.height + self.pImg.y + 10*KWIDTH,s,23*KWIDTH)];
       // self.pLabel.backgroundColor = RandomColor;
        self.pLabel.text = arrText[t];
        self.pLabel.textColor = colorWithHexString(@"#17A03D");
        self.pLabel.font = Font12;
        [sectionview addSubview:self.pLabel];
        
        if(t == 1|| t == 2){
            self.pLabel.textAlignment = NSTextAlignmentCenter;
        }
        
        
        
    }
   
    
    self.TextView = UITextView.new;
    self.TextView.frame = RECT(30*KWIDTH,self.pLabel.height + self.pLabel.y + 30*KWIDTH,SCREEN_WIDTH - 60*KWIDTH,308*KWIDTH);
    self.TextView.font = Font12;
    self.TextView.layer.cornerRadius = 10*KWIDTH;
    self.TextView.layer.masksToBounds = YES;
    self.TextView.userInteractionEnabled= NO;
    self.TextView.textColor = colorWithHexString(@"#525B55");
    self.TextView.backgroundColor = colorWithHexString(@"#F3F6F1");
    self.TextView.text= @"\n\n\n1、新会员加入球频道注册成功即可获得100球币奖励。\n2、会员邀请好友加入球频道，注册会员成功后邀请者即可获得10球币。\n3、会员邀请好友人数达到10人时，邀请者额外获得100个礼物币";
    [sectionview addSubview:self.TextView];
    
    
    
    
    
    UIImageView *ActivityRules = UIImageView.new;
    ActivityRules.frame = RECT(286*KWIDTH, 20*KWIDTH,117*KWIDTH, 29*KWIDTH);
    ActivityRules.image = [UIImage imageNamed:@"活动规则"];
//    ActivityRules.textAlignment = NSTextAlignmentCenter;
//    ActivityRules.text = @"活动规则";
   // ActivityRules.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"活动规则"]];
    [self.TextView addSubview:ActivityRules];
    
    //立即分享
    UIButton *ShareImmediatelyBtn  = [[UIButton alloc]initWithFrame:RECT(30*KWIDTH,self.TextView.height + self.TextView.y + 30*KWIDTH,SCREEN_WIDTH - 60*KWIDTH,80*KWIDTH)];
    [ShareImmediatelyBtn setBackgroundImage:[UIImage imageNamed:@"立刻分享"] forState:0];
#pragma mark--- 分享
    [sectionview addSubview:ShareImmediatelyBtn];
    
    
    
    
    return sectionview;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"Cell data";
    InviteXIBCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil)
    {
       
       // cell=[[[NSBundle mainBundle]loadNibNamed:@"InviteXIBCell" owner:nil options:nil]lastObject];
         cell=[[InviteXIBCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
       // cell.backgroundColor = UIColor.purpleColor;
        
    }
    /*
     -(void)setUserNameTextColor:(UIColor *)tc;
     -(void)setRegistrationDateTextColor:(UIColor *)RD;
     -(void)setRewardAmountTextColor:(UIColor *)RA;
     */
    if(indexPath.row == 1 || indexPath.row == 2){
        [cell userName:@"黄金山泉" registrationDate:@"2020/01/11" rewardAmount:@"100"];
        cell.backgroundColor  = colorWithHexString(@"#FAFAFA");
        [cell setUserNameTextColor:colorWithHexString(@"#666666")];
        [cell setRegistrationDateTextColor:colorWithHexString(@"#666666")];
        [cell setRewardAmountTextColor:colorWithHexString(@"#666666")];
    }else if (indexPath.row == 0)
    {
        [cell userName:@"用户名称" registrationDate:@"注册时间" rewardAmount:@"球币奖励"];
       //colorWithHexString(@"#FAFAFA");
        cell.backgroundColor  =color(243, 243, 243);
        [cell setUserNameTextColor:colorWithHexString(@"#666666")];
        [cell setRegistrationDateTextColor:colorWithHexString(@"#666666")];
        [cell setRewardAmountTextColor:colorWithHexString(@"#666666")];
        
    }
    return cell;
}
/*
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 圆角弧度半径
    CGFloat cornerRadius = 20*KWIDTH;
    // 设置cell的背景色为透明，如果不设置这个的话，则原来的背景色不会被覆盖
    //cell.backgroundColor = UIColor.clearColor;

    // 创建一个shapeLayer
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    CAShapeLayer *backgroundLayer = [[CAShapeLayer alloc] init]; //显示选中
    // 创建一个可变的图像Path句柄，该路径用于保存绘图信息
    CGMutablePathRef pathRef = CGPathCreateMutable();
    // 获取cell的size
    // 第一个参数,是整个 cell 的 bounds, 第二个参数是距左右两端的距离,第三个参数是距上下两端的距离
    CGRect bounds = CGRectInset(cell.bounds, 10, 0);

    // CGRectGetMinY：返回对象顶点坐标
    // CGRectGetMaxY：返回对象底点坐标
    // CGRectGetMinX：返回对象左边缘坐标
    // CGRectGetMaxX：返回对象右边缘坐标
    // CGRectGetMidX: 返回对象中心点的X坐标
    // CGRectGetMidY: 返回对象中心点的Y坐标

    // 这里要判断分组列表中的第一行，每组section的第一行，每组section的中间行

    // CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
    if (indexPath.row == 0) {
        // 初始起点为cell的左下角坐标
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
        // 起始坐标为左下角，设为p，（CGRectGetMinX(bounds), CGRectGetMinY(bounds)）为左上角的点，设为p1(x1,y1)，(CGRectGetMidX(bounds), CGRectGetMinY(bounds))为顶部中点的点，设为p2(x2,y2)。然后连接p1和p2为一条直线l1，连接初始点p到p1成一条直线l，则在两条直线相交处绘制弧度为r的圆角。
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        // 终点坐标为右下角坐标点，把绘图信息都放到路径中去,根据这些路径就构成了一块区域了
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));

    } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
        // 初始起点为cell的左上角坐标
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        // 添加一条直线，终点坐标为右下角坐标点并放到路径中去
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
    } else {
        // 添加cell的rectangle信息到path中（不包括圆角）
        CGPathAddRect(pathRef, nil, bounds);
    }
    // 把已经绘制好的可变图像路径赋值给图层，然后图层根据这图像path进行图像渲染render
    layer.path = pathRef;
    backgroundLayer.path = pathRef;
    // 注意：但凡通过Quartz2D中带有creat/copy/retain方法创建出来的值都必须要释放
    CFRelease(pathRef);
    // 按照shape layer的path填充颜色，类似于渲染render
    // layer.fillColor = [UIColor colorWithWhite:1.f alpha:0.8f].CGColor;
    layer.fillColor = [UIColor whiteColor].CGColor;

    // view大小与cell一致
    UIView *roundView = [[UIView alloc] initWithFrame:bounds];
    // 添加自定义圆角后的图层到roundView中
    [roundView.layer insertSublayer:layer atIndex:0];
    roundView.backgroundColor = UIColor.clearColor;
    // cell的背景view
    cell.backgroundView = roundView;

    // 以上方法存在缺陷当点击cell时还是出现cell方形效果，因此还需要添加以下方法
    // 如果你 cell 已经取消选中状态的话,那以下方法是不需要的.
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:bounds];
    backgroundLayer.fillColor = [UIColor cyanColor].CGColor;
    [selectedBackgroundView.layer insertSublayer:backgroundLayer atIndex:0];
    selectedBackgroundView.backgroundColor = UIColor.clearColor;
    cell.selectedBackgroundView = selectedBackgroundView;

}

-(UIImageView *)screenshotImg
{
    //截屏图片
    if(!_screenshotImg){
        _screenshotImg = UIImageView.new;
        _screenshotImg.frame = RECT(0,0,200,400*KWIDTH);
        _screenshotImg.image = [UIImage imageNamed:@"screenshot@2x"];
        _screenshotImg.contentMode  = UIViewContentModeScaleToFill;
        
    }
    return _screenshotImg;
}
*/


@end
