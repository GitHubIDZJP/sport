//
//  HXPublishedArticlesViewController.m
//  QCGlobalSport
//
//  Created by test on 2020/2/17.
//  Copyright © 2020 com.qqty. All rights reserved.
//

#import "HXPublishedArticlesViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

#import "HXTextView.h"
#import "HXUploadButton.h"
#define MAXLENGTH 8 //输入数字最大数字长度
@interface HXPublishedArticlesViewController ()<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIButton *uploadPicturesBtn;
}
@property(nonatomic,strong)HXTextView *tView;
@property(nonatomic,strong)HXTextView *tContentView;
@property(nonatomic,strong)HXTextView *inputGold;
@property(nonatomic,strong)HXUploadButton *removeBtn;
@property(nonatomic,strong)UITextField *zjpTf;
@property(strong,nonatomic)UIImagePickerController *imagePicker;
@end

@implementation HXPublishedArticlesViewController

-(customNavigationBar*)NavBar{
    if(!_NavBar){
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
        
       // _NavBar.backgroundColor =  colorWithHexString(@"#07913B");
    }
    return _NavBar;
}
//懒加载-重写GET方法
-(UIImagePickerController*)imagePicker
{
    if(!_imagePicker)
    {
        _imagePicker =[[UIImagePickerController alloc]init];
        //设置3属性
        /**
         
         UIImagePickerControllerSourceTypePhotoLibrary,
         UIImagePickerControllerSourceTypeCamera,
         UIImagePickerControllerSourceTypeSavedPhotosAlbum
         */
        _imagePicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;//采集源类型
        _imagePicker.mediaTypes=[NSArray arrayWithObject:(__bridge NSString*)kUTTypeImage];//媒体类型
        _imagePicker.delegate=self;//代理
    }
    return _imagePicker;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = color(245, 245, 245);
    [self.view addSubview:self.NavBar];
    [self.NavBar setRightButtonIsHidden:YES];
    [self.NavBar setCenterText:@"发布文章"];
    [self.NavBar setCenterTextColor:UIColor.blackColor];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        NSLog(@"导航条按钮");
        // [vc dismissViewControllerAnimated:NO completion:nil];
        [vc.navigationController popViewControllerAnimated:YES];
    }];
    
    //请选择球类
    self.selBallClass = [[UIView alloc]init];
    self.selBallClass.frame = RECT(30*KWIDTH,self.NavBar.height + self.NavBar.y + 30*KWIDTH,SCREEN_WIDTH - 60*KWIDTH,90*KWIDTH);
    self.selBallClass.layer.cornerRadius = 10*KWIDTH;
    self.selBallClass.layer.masksToBounds = YES;
    self.selBallClass.backgroundColor  =UIColor.whiteColor;
    [self.view addSubview:self.selBallClass];
    
    UIButton *SelectButton = [[UIButton alloc]init];
    SelectButton.frame = RECT(636*KWIDTH,38*KWIDTH,24*KWIDTH,14*KWIDTH);
    [SelectButton setBackgroundImage:[UIImage imageNamed:@"bottomArrow"] forState:UIControlStateNormal];
    [self.selBallClass addSubview:SelectButton];
    
    UILabel *ComesBackLabel = UILabel.new;
    ComesBackLabel.frame =   RECT(29*KWIDTH,32*KWIDTH ,200*KWIDTH ,26*KWIDTH);
    ComesBackLabel.text = @"请选择球类";
    [self.selBallClass addSubview:ComesBackLabel];
    
    //请输入标题
    self.tView = [[HXTextView alloc]init];
    self.tView.frame = RECT(self.selBallClass.x,self.selBallClass.y + self.selBallClass.height+ 30*KWIDTH,self.selBallClass.width,self.selBallClass.height);
    self.tView.backgroundColor = UIColor.whiteColor;
    [self.tView inputPromptText:@"请输入标题"];
    
   [self.tView addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];

    [self.view addSubview:self.tView];
    
    self.tContentView = [[HXTextView alloc]init];
    self.tContentView.frame = RECT(self.self.tView.x,self.self.tView.y + self.self.tView.height+ 30*KWIDTH,self.self.tView.width,360*KWIDTH);
    self.tContentView.backgroundColor = UIColor.whiteColor;
    [self.tContentView inputPromptText:@"请输入内容"]; 
    [self.view addSubview:self.tContentView];
    
    
    self.uploadPictures= [[UIView alloc]init];
    self.uploadPictures.frame = RECT(self.tContentView.x,self.tContentView.y + self.tContentView.height + 30*KWIDTH,self.tContentView.width,220*KWIDTH);
    self.uploadPictures.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.uploadPictures];
   
    
    
   uploadPicturesBtn =UIButton.new;
    uploadPicturesBtn.frame = RECT(30*KWIDTH,30*KWIDTH,160*KWIDTH,160*KWIDTH);
    [uploadPicturesBtn setBackgroundImage:[UIImage imageNamed:@"uploadPictures"] forState:UIControlStateNormal];
    [self.uploadPictures addSubview:uploadPicturesBtn];
     [self addBorderToLayer:uploadPicturesBtn];
    [uploadPicturesBtn addAction:^(id  _Nonnull sender) {
        NSLog(@"获取上传图片");
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
    }];
    
    
    
    //删除图片
    self.removeBtn =[[HXUploadButton alloc]init];
    self.removeBtn.frame = RECT(uploadPicturesBtn.x + uploadPicturesBtn.width + 15*KWIDTH,30*KWIDTH,160*KWIDTH,160*KWIDTH);
    [self.removeBtn setBackgroundImage:[UIImage imageNamed:@"CFry"] forState:UIControlStateNormal];
    [self.uploadPictures addSubview:self.removeBtn];
  //  [self  addDottedLine:self.removeBtn];
    
    
    
    
    
    
    NSArray *uploadBtnTitles = @[@"免费",@"付费"];
    
    for(int i = 0; i < uploadBtnTitles.count;i++){
        self.upBtn = UIButton.new;
        int uploadBtnw = (SCREEN_WIDTH - 68*KWIDTH)/2;
        self.upBtn.frame = RECT(30*KWIDTH+ i* (uploadBtnw + 4*KWIDTH),self.uploadPictures.y + self.uploadPictures.height + 30*KWIDTH,uploadBtnw,90*KWIDTH);
        self.upBtn.backgroundColor = UIColor.whiteColor;
        [self.upBtn setTitle:uploadBtnTitles[i] forState:UIControlStateNormal];
        self.upBtn.layer.masksToBounds = YES;
        self.upBtn.layer.cornerRadius = 10*KWIDTH;
        self.upBtn.tag = 100+i;
        [self.view addSubview:self.upBtn];
        [self.upBtn addTarget:self action:@selector(onClick:) forControlEvents: 1<< 6];
        if(i == 0)
        {
            [self.upBtn setTitleColor:colorWithHexString(@"#666666") forState:UIControlStateNormal];
        }
        else if(i ==  1){
             [self.upBtn setTitleColor:colorWithHexString(@"#4CB13B") forState:UIControlStateNormal];
            
            self.upBtn.layer.borderColor = color(70, 160, 80).CGColor;
            self.upBtn.layer.borderWidth = 1;
        }
    }
    
    
    
    UITextField *t = [[UITextField alloc]init];
    t.frame = RECT(self.self.tView.x,self.upBtn.y + self.upBtn.height+ 10*KWIDTH,self.self.tView.width,90*KWIDTH);
    t.placeholder = @"   请输入数字";
    t.backgroundColor= UIColor.whiteColor;
    t.layer.cornerRadius = 10*KWIDTH;
    t.layer.masksToBounds = YES;
    t.delegate = self;
     [t setValue:[NSNumber numberWithInt:30*KWIDTH] forKey:@"paddingLeft"];
    [t addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:t];
    self.zjpTf=t;
    //球币
    UILabel *ballCurrency = [[UILabel alloc]initWithFrame:CGRectMake(607*KWIDTH,32*KWIDTH,64*KWIDTH,26*KWIDTH)];
    ballCurrency.text = @"球币";
    ballCurrency.textColor = colorWithHexString(@"#999999");
    ballCurrency.font = Font14;
    [t addSubview:ballCurrency];
    
    UIButton *Submit = [[UIButton alloc]init];
   // Submit.frame =RECT(self.self.tView.x,self.upBtn.y + self.upBtn.height+ 10*KWIDTH,self.self.tView.width,90*KWIDTH);
     Submit.frame =RECT(self.self.tView.x,t.y + t.height+ 15*KWIDTH,self.self.tView.width,90*KWIDTH);
    [Submit setTitle:@"提交发布" forState:UIControlStateNormal];
    [Submit addTarget:self action:@selector(Submit:) forControlEvents:1 << 6];
    [self.view addSubview:Submit];
    
   
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = Submit.bounds;
    gradientLayer.colors = @[(__bridge id)color(160,201,51).CGColor,(__bridge id)color(20,160 , 62).CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.locations = @[@0.2,@1];
   [Submit.layer addSublayer:gradientLayer];
    
   // :startPoint & endPoint设置为(0,0)(1.0,0)代表水平方向渐变,(0,0)(0,1.0)代表竖直方向渐变
    
    Submit.layer.cornerRadius = 10*KWIDTH;
    Submit.layer.masksToBounds = YES;
    
    
    
    
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
        [self presentViewController:self.imagePicker animated:YES completion:nil];
         
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
        //显示到UI界面
         [uploadPicturesBtn setBackgroundImage:image forState:UIControlStateNormal];
        
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark 取消采集图片的处理
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"取消采集图片");
    [self dismissViewControllerAnimated:YES completion:nil];
}

//设置输入框只能输入数字:
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(self.zjpTf== textField){
        return [self validateNumber:string];//回调
    }
    return YES;
}
- (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_zjpTf resignFirstResponder];//回收键盘
}
- (void)textFieldDidChange:(id)sender
{
    if (self.zjpTf.text.length > MAXLENGTH)  // MAXLENGTH为最大字数
    {
        //超出限制字数时所要做的事
        self.zjpTf.text = [self.zjpTf.text substringToIndex: MAXLENGTH];
    }
}
/*
-(void)addDottedLine:(UIButton*)dLine{
    CAShapeLayer *border = [CAShapeLayer layer];
    //  线条颜色
    border.strokeColor = [UIColor blackColor].CGColor;
    
    border.fillColor = nil;
    
    border.path = [UIBezierPath bezierPathWithRect:dLine.bounds].CGPath;
    
    border.frame = dLine.bounds;
    
    // 不要设太大 不然看不出效果
    border.lineWidth = 1;
    
    border.lineCap = @"square";
    
    //  第一个是 线条长度   第二个是间距    nil时为实线
    border.lineDashPattern = @[@1, @4];
    
    [dLine.layer addSublayer:border];
}
*/
- (void)onClick:(UIButton *)sender{
    
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:100];
    UIButton *btn2 = (UIButton *)[self.view viewWithTag:101];
    
    if (sender.tag == 100) {
       
        btn1.layer.borderWidth = 1;
        btn2.layer.borderWidth = 0;
        
        [btn1 setTitleColor:color(76,177,59) forState:UIControlStateNormal];//选中
        [btn2 setTitleColor:color(178,178,178) forState:UIControlStateNormal];//不选中
        
        btn1.layer.borderColor = color(76,177,59).CGColor;//选中
        btn2.layer.borderColor = color(178,178,178).CGColor;//不选中
    }else if(sender.tag ==  101){
        btn1.layer.borderWidth = 0;
        btn2.layer.borderWidth = 1;
        
        btn2.layer.borderColor = color(76,177,59).CGColor;//选中
        btn1.layer.borderColor = color(178,178,178).CGColor;
        [btn2 setTitleColor:color(76,177,59) forState:UIControlStateNormal];//选中
        [btn1 setTitleColor:color(178,178,178) forState:UIControlStateNormal];//不选中
     
        
        
    }
    
    
}
- (void)addBorderToLayer:(UIView *)view
{
    CAShapeLayer *border = [CAShapeLayer layer];
    //  线条颜色
    border.strokeColor = [UIColor blackColor].CGColor;
    
    border.fillColor = nil;
    
    border.path = [UIBezierPath bezierPathWithRect:view.bounds].CGPath;
    
    border.frame = view.bounds;
    
    // 不要设太大 不然看不出效果
    border.lineWidth = 1;
    
    border.lineCap = @"square";
    
    //  第一个是 线条长度   第二个是间距    nil时为实线
    border.lineDashPattern = @[@1, @4];
    
    [view.layer addSublayer:border];
}

-(void)Submit:(UIButton*)s{
    
    
    
}

/*
 
 if(idx == 0){
 [btn setTitleColor:colorWithHexString(@"#4CB13B") forState:UIControlStateNormal];
 btn.backgroundColor = color(254, 254, 254);
 btn.layer.borderColor =color(76,177,59).CGColor;
 //先默认一个  也就是后面要选择的操作
 }else if (idx == 1){
 [btn setTitleColor:colorWithHexString(@"#999999") forState:UIControlStateNormal];
 btn.backgroundColor = color(245, 245, 245);
 btn.layer.borderColor =color(178,178,178).CGColor;
 }
 
 */


@end
