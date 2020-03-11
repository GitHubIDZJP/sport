


#import "AccountSetVC.h"
#import "loginVC.h"
@interface AccountSetVC ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIAlertController *alertVC;

@end

@implementation AccountSetVC
-(UIAlertController*)alertVC
{
    
    if (!_alertVC) {
        _alertVC = [UIAlertController alertControllerWithTitle:@"alertVCTitle" message:@"alertVCMessage" preferredStyle:UIAlertControllerStyleAlert];
    }
    
    return _alertVC;
}
-(NSMutableArray *)ViewArray
{
    if(!_ViewArray){
        
        /*
         //账号与安全  accountSecurityVC
         //通用   GeneralSettingsVC
         // 推送设置  PushSettingsVC
         //关于我们publishedArticlesVC
         
         
         
         */
        //存VC的变量名
        accountSecurityVC *accountSecurity = [[accountSecurityVC alloc]init];
        GeneralSettingsVC *General = [[GeneralSettingsVC alloc]init];
        PushSettingsVC  *pushMessage = [[PushSettingsVC alloc]init];
        publishedArticlesVC *about = [[publishedArticlesVC alloc]init];
         
        _ViewArray = [NSMutableArray arrayWithObjects:accountSecurity,General,pushMessage,about, nil];
        
        
    }
    
    return _ViewArray;
    
    
}
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
        
        _NavBar.backgroundColor = UIColor.whiteColor;//colorWithHexString(@"#07913B");
        [_NavBar setCenterTextColor:colorWithHexString(@"#333333")];
        
    }
    return _NavBar;
}
-(UITableView *)tableView{
    
    if(!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(30*KWIDTH,JH_NavBarHeight,SCREEN_WIDTH- 60*KWIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
       // _tableView.backgroundColor = color(243,243,243);
        // _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
         _tableView.separatorColor = color(230, 230, 230);
        _tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
        IOS11;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = color(243,243,243);
    
    [self addNavigationController];
    [self.view addSubview:self.tableView];
  
    //self.tableView.backgroundColor = [UIColor redColor];
    
    
    
}
-(void)addNavigationController{
  
    [self.view addSubview:self.NavBar];
   
    [self.NavBar setRightButtonIsHidden:YES];
    [self.NavBar setCenterText:@"设置"];
   // [self.NavBar setCenterTextColor:UIColor.];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        NSLog(@"导航条按钮");
        //[vc dismissViewControllerAnimated:NO completion:nil];
        [vc.navigationController popToRootViewControllerAnimated:YES];
    }];
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0 || section == 1){
    return 30*KWIDTH;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section == 0 || section == 1){
        return 0.1*KWIDTH;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0){
        return 4;
    } return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88*KWIDTH;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ident = @"it's cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:ident];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        
    }
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
   
    //
   

    NSArray *CellTextLabel = @[@"账号与安全",@"通用",@"推送设置",@"关于我们",@"退出账号"];
    if(indexPath.section ==0){
//        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(30*KWIDTH, cell.height, SCREEN_WIDTH - 120*KWIDTH, 0.5)];
//          line.backgroundColor = color(230, 230, 230);
//         [cell addSubview:line];
        cell.textLabel.text =  CellTextLabel[indexPath.row];
       
        if(indexPath.row == 3){
//            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, cell.bounds.size.width);
        }
    }else if(indexPath.section ==1){
        if(indexPath.row==0){
             cell.textLabel.text = @"退出账号";
        }
       
    }

    

    //设置属性
    cell.textLabel.textColor = colorWithHexString(@"#333333");
    cell.textLabel.font = Font14;
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
  //  NSLog(@"第:ld组第:ld行",indexPath.section,indexPath.row);
     NSLog(@"滑到了第 %ld 组 %ld个",indexPath.section, indexPath.row);
    
    
    //账号与安全
    //通用 
    // 推送设置
    //关于我们
    
    
    if(indexPath.section == 0){
        
        __block  UIViewController *vc = self;
        vc.modalPresentationStyle = 0;
      //  [vc presentViewController:self.ViewArray[indexPath.row] animated:NO completion:nil];
          [vc.navigationController pushViewController:self.ViewArray[indexPath.row]  animated:YES];
       /*
        switch (indexPath.row) {
            case 0:
                
                break;
            case 1:
                
                break;
            case 2:
                
                break;
            case 3:
                
                break;
                
            default:
                break;
        }*/
    }else if(indexPath.section == 1){
        
        if(indexPath.row == 0){
       // NSLog(@"d第2组");
       // [self exitApplication];
        [self pushLoginVC];
        }
        
    }

    
    
    
}


-(void)pushLoginVC{
    NSLog(@"点击");
    // loginVC *login = [[loginVC alloc]init];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确定退出么?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    NSLog(@"确定");
        [self push];
      
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //
        [alertController dismissViewControllerAnimated:YES completion:nil];
        NSLog(@"取消");
      
        
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
   
    
    [self presentViewController:alertController animated:YES completion:nil];
}
-(void)push{
    
    [self.navigationController pushViewController:loginVC.new animated:YES];
}
//-(void)exitApplication{
    
  //  UIAlertController
    
    
    /*
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [UIView animateWithDuration:0.5f animations:^{
        window.alpha = 0;
        window.frame = CGRectMake(0, window.bounds.size.height / 2, window.bounds.size.width, 0.5);
    } completion:^(BOOL finished) {
        exit(0);
    }];
*/
    

    /*
    
   
    
    
     */
    
    
////}
/*
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(tintColor)]) {
        if (tableView == self.tableView) {
            // 圆角弧度半径
            CGFloat cornerRadius = 10*KWIDTH;
            // 设置cell的背景色为透明，如果不设置这个的话，则原来的背景色不会被覆盖
            cell.backgroundColor = UIColor.clearColor;

            // 创建一个shapeLayer
            CAShapeLayer *layer = [[CAShapeLayer alloc] init];
            CAShapeLayer *backgroundLayer = [[CAShapeLayer alloc] init]; //显示选中
            // 创建一个可变的图像Path句柄，该路径用于保存绘图信息
            CGMutablePathRef pathRef = CGPathCreateMutable();
            // 获取cell的size
            CGRect bounds = CGRectInset(cell.bounds, 0, 0);

            // CGRectGetMinY：返回对象顶点坐标
            // CGRectGetMaxY：返回对象底点坐标
            // CGRectGetMinX：返回对象左边缘坐标
            // CGRectGetMaxX：返回对象右边缘坐标

            // 这里要判断分组列表中的第一行，每组section的第一行，每组section的中间行
            BOOL addLine = NO;
            // CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
            if (indexPath.row == 0) {
                // 初始起点为cell的左下角坐标
                CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
                // 起始坐标为左下角，设为p1，（CGRectGetMinX(bounds), CGRectGetMinY(bounds)）为左上角的点，设为p1(x1,y1)，(CGRectGetMidX(bounds), CGRectGetMinY(bounds))为顶部中点的点，设为p2(x2,y2)。然后连接p1和p2为一条直线l1，连接初始点p到p1成一条直线l，则在两条直线相交处绘制弧度为r的圆角。
                CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
                CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
                // 终点坐标为右下角坐标点，把绘图信息都放到路径中去,根据这些路径就构成了一块区域了
                CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
                addLine = YES;
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
                addLine = YES;
            }
            // 把已经绘制好的可变图像路径赋值给图层，然后图层根据这图像path进行图像渲染render
            layer.path = pathRef;
            backgroundLayer.path = pathRef;
            // 注意：但凡通过Quartz2D中带有creat/copy/retain方法创建出来的值都必须要释放
            CFRelease(pathRef);
            // 按照shape layer的path填充颜色，类似于渲染render
            // layer.fillColor = [UIColor colorWithWhite:1.f alpha:0.8f].CGColor;
            layer.fillColor = [UIColor whiteColor].CGColor;
            // 添加分隔线图层
            if (addLine == YES) {
                CALayer *lineLayer = [[CALayer alloc] init];
                CGFloat lineHeight = (1.f / [UIScreen mainScreen].scale);
                lineLayer.frame = CGRectMake(CGRectGetMinX(bounds), bounds.size.height-lineHeight, bounds.size.width, lineHeight);
                // 分隔线颜色取自于原来tableview的分隔线颜色
                lineLayer.backgroundColor = tableView.separatorColor.CGColor;
                [layer addSublayer:lineLayer];
            }

            // view大小与cell一致
            UIView *roundView = [[UIView alloc] initWithFrame:bounds];
            // 添加自定义圆角后的图层到roundView中
            [roundView.layer insertSublayer:layer atIndex:0];
            roundView.backgroundColor = UIColor.clearColor;
            //cell的背景view
            //cell.selectedBackgroundView = roundView;
            cell.backgroundView = roundView;


        }
    }
}
*/

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat radius = 10*KWIDTH;
    NSInteger sectionCount = [tableView numberOfRowsInSection:indexPath.section] - 1;// section row 个数
    CGRect bounds = CGRectInset(cell.bounds, 12, 0); // 显示的cell 点击区域
    // 2.再盖一个 mask
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];// 用于蒙板
    // section 只有一个时。
    if (indexPath.row == 0 && indexPath.row == sectionCount) {
        [maskLayer setPath:[UIBezierPath bezierPathWithRoundedRect:bounds cornerRadius:radius].CGPath];
        
        // 第一个 row
    } else if (indexPath.row == 0) {
        [maskLayer setPath:[UIBezierPath bezierPathWithRoundedRect:bounds
                                                 byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)
                                                       cornerRadii:CGSizeMake(radius, radius)].CGPath];
        
        // 最后一个 row
    } else if (indexPath.row == sectionCount) {
        [maskLayer setPath:[UIBezierPath bezierPathWithRoundedRect:bounds
                                                 byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                       cornerRadii:CGSizeMake(radius, radius)].CGPath];
        // 中间 row
    } else {
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:bounds];
        [maskLayer setPath:path.CGPath];
        
    }
    // 2.mask
    [cell setMaskView:[[UIView alloc] initWithFrame:cell.bounds]];
    [cell.maskView.layer insertSublayer:maskLayer atIndex:0];
    [cell.maskView.layer setMasksToBounds:YES];
    [cell setClipsToBounds:YES];


}

@end
