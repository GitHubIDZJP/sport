//
//  userProfileVC.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "userProfileVC.h"
#import "personInfoTabCellTableViewCell.h"
@interface userProfileVC ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate,UIImagePickerControllerDelegate>
{
    
}
@property(nonnull,strong)UIImageView *headerPic;
@property(strong,nonatomic)UIImagePickerController *imagePicker;

@end

@implementation userProfileVC
//懒加载-重写GET方法
-(UIImagePickerController*)imagePicker
{
    if(!_imagePicker)
    {
        _imagePicker =[[UIImagePickerController alloc]init];
        _imagePicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;//采集源类型
        _imagePicker.mediaTypes=[NSArray arrayWithObject:(__bridge NSString*)kUTTypeImage];//媒体类型
        _imagePicker.delegate=self;//代理
    }
    return _imagePicker;
}
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH, JH_NavBarHeight)];
       // _NavBar.backgroundColor = colorWithHexString(@"#07913B");//color(64,143,68);
    }
    return _NavBar;
}
-(UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,JH_NavBarHeight ,SCREEN_WIDTH,SCREEN_HEIGHT-JH_TabBarHeight) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = color(242, 242, 242);
        // _tableView.dataSource = self;
       _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
           //     _tableView.separatorColor = color(230, 230, 230);
       // _tableView.rowHeight = 88*KWIDTH;
       // _tableView.separatorInset = UIEdgeInsetsMake(0, 22, 0,22);//top left bottom right
        IOS11;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
  

    
    
    
    
    [self.view addSubview:self.NavBar];
    [self.view addSubview:self.tableView];
     __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
      //  [vc dismissViewControllerAnimated:false completion:nil];
        [vc.navigationController popViewControllerAnimated:YES];
        NSLog(@"返回上一个页面");
    }];  
    [self.NavBar setRightButtonIsHidden:YES];
    [self.NavBar setCenterText: @"个人信息"];
   // [self.NavBar setCenterTextColor:[UIColor whiteColor]];
     hintText =  [NSMutableArray arrayWithObjects:@"头像",@"昵称",@"性别",@"简介", nil];

      [self InitializeSubpage];
}
-(void)InitializeSubpage{
    //要跳转的页面
    /*
    AvatarTest *comingSoon =[[AvatarTest alloc]init];
    nickName *nickNamePage = [[ nickName alloc]init];
    gender *genderJudgment =[[gender alloc]init];
    dateOfBirth *birth = [dateOfBirth new];
    signature *signatureDescription  = [[signature alloc]init];
    storageArr = [NSMutableArray arrayWithObjects:comingSoon,nickNamePage,genderJudgment,birth,signatureDescription, nil];
    */
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//每组的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return  hintText.count;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section ==0){
        return 30*KWIDTH;
    }
    return section;
}
//
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if(section == 0){
        return 0.01;
    }
    return section;
    
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 99*KWIDTH;
}
//数据源
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"it's cell data";
    personInfoTabCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        //初始化
        cell= [[personInfoTabCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSArray *Ninja =@[@"",@"linDan",@"保密",@"每一个秋天都是一个轮回"];
    [cell setleftHintText:hintText[indexPath.row] rightCommentText:Ninja[indexPath.row]];
    CGFloat x =40*KWIDTH;
    UILabel *line = [[UILabel alloc]initWithFrame:RECT(x,98*KWIDTH, ScreenWidth -2*x-20*KWIDTH,1)];
    line.backgroundColor  = color(230, 230, 230);
    [cell addSubview:line];
    if(indexPath.row == hintText.count -1)
    {
        line.hidden = YES;
    }
    //把cell1的点击事件禁调--然后再点击头像获取图片
    if(indexPath.row == 0){
        CGFloat headSculprtureW = 70*KWIDTH;
               self.headerPic = [[UIImageView alloc]initWithFrame:RECT(SCREEN_WIDTH - headSculprtureW - 85*KWIDTH,10*KWIDTH,headSculprtureW,headSculprtureW )];
               self.headerPic.image = [UIImage imageNamed:@"userpIC"];
               self.headerPic.layer.cornerRadius = headSculprtureW/2;
               self.headerPic.layer.masksToBounds = YES;
               self.headerPic.userInteractionEnabled = YES;
               [cell addSubview:self.headerPic];
        
    }
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //[self presentViewController:storageArr[indexPath.row] animated:NO completion:nil];
    if(indexPath.row == 0){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"获取照片" preferredStyle:UIAlertControllerStyleActionSheet];
           
           UIAlertAction *action = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
               NSLog(@"相机获取照片");
               [self CameraGetsPhotos];
           }];
           UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
               NSLog(@"相册获取照片");
               [self AlbumGetPhotos];
           }];
           UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
               
           }];
           [alert addAction:action];
           [alert addAction:action2];
           [alert addAction:cancle];
           [self presentViewController:alert animated:YES completion:nil];
        
    }
}
-(void)CameraGetsPhotos{
    
        //采集方式：
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            //通过摄像头采集
            self.imagePicker.sourceType=UIImagePickerControllerSourceTypeCamera;
        }else
        {
            //通过㲏库采集
             self.imagePicker.sourceType= UIImagePickerControllerSourceTypePhotoLibrary;
        }
    
     //   [self presentViewController:self.imagePicker animated:YES completion:nil];
    //[self.navigationController pushViewController:self.imagePicker animated:YES];
         
}
-(void)AlbumGetPhotos{
        //采集方式：
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            //通过摄像头采集
             self.imagePicker.sourceType= UIImagePickerControllerSourceTypePhotoLibrary;
        }else
        {
            //通过㲏库采集
         self.imagePicker.sourceType=UIImagePickerControllerSourceTypeCamera;
    
        }
        [self presentViewController:self.imagePicker animated:YES completion:nil];
}
#pragma mark 完成图片采集后的回调处理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
   //获取媒体类型
    NSString *type=info[UIImagePickerControllerMediaType];
    //判断是图片类型还是视频类型
    if([type isEqualToString:(__bridge NSString*)kUTTypeImage])//图片类型
    {
        //获取采集的图片
        UIImage *image=info[UIImagePickerControllerOriginalImage];
        self.headerPic.image = image;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark 取消采集图片的处理
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"取消采集图片");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat radius = 10*KWIDTH;
NSInteger sectionCount = [tableView numberOfRowsInSection:indexPath.section]- 1;// section row 个数
CGRect bounds=CGRectInset(cell.bounds,12,0); // 显示的cell 点击区域
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
