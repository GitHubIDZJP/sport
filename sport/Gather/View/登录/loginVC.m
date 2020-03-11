//
//  loginVC.m
//  Sports
//
//  Created by test on 2020/1/14.
//  Copyright © 2020 test. All rights reserved.
//

#import "loginVC.h"
//导入系统框架
#import <AVFoundation/AVFoundation.h>
#import "weChatIcon.h"
#import "weChatIconAddContext.h"
#import "VerificationCode.h"
#import "tooltip.h"

#define IPHONE_X (@available(iOS 11.0, *)?[[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom > 0.0 : NO )

#import "isIPhoneX.h"
@interface loginVC ()
@property (strong, nonatomic) AVPlayer *avPlayer;


@end

@implementation loginVC

-(UIImageView *)bgImg
{
    if(!_bgImg){
        _bgImg = UIImageView.new;
        _bgImg.frame  = CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
        //_bgImg.backgroundColor = UIColor.orangeColor;
        _bgImg.userInteractionEnabled = YES;
        _bgImg.image = [UIImage imageNamed:@"bgImage@2x"];
    }
    return _bgImg;
    
}
-(UIImageView *)appLogo
{
    if(!_appLogo){
        _appLogo = UIImageView.new;
        _appLogo.frame  =CGRectMake(208*KWIDTH,211*KWIDTH,SCREEN_WIDTH- 416*KWIDTH,113*KWIDTH);
        //_appLogo.backgroundColor = UIColor.purpleColor;
        _appLogo.image = [UIImage imageNamed:@"logo2@2x"];
    }
    return _appLogo;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initBackgroundVideo];
    [self.view addSubview:self.bgImg];
 //   NSString *playString = @"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4";
   // NSURL *url = [NSURL URLWithString:playString];
    NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"本地视频" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:audioPath];
    //设置播放的项目
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:url];
    //初始化player对象
    self.avPlayer = [[AVPlayer alloc] initWithPlayerItem:item];
    //设置播放页面
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    //设置播放页面的大小
    layer.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, SCREEN_HEIGHT);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    layer.videoGravity = AVLayerVideoGravityResize;
    //添加播放视图到self.view
    [_bgImg.layer addSublayer:layer];
    //视频播放
    //  [self.avPlayer play];
    //视频暂停
    //[self.avPlayer pause];
    [_bgImg addSubview:self.appLogo];
    
    
    
    
    
    UITextField *pN = UITextField.new;
    pN.frame = CGRectMake(100*KWIDTH,421*KWIDTH,SCREEN_WIDTH - 200*KWIDTH,72*KWIDTH);
    pN.layer.cornerRadius = 36*KWIDTH;
    //pN.backgroundColor = color(99, 115, 138);//colorWithHexString(@"#FFFFFF");
    pN.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.4];
    //pN. = 0.4;
    pN.layer.masksToBounds = YES;
    pN.placeholder= @"      请输入手机号码";
     [pN setValue:[NSNumber numberWithInt:40*KWIDTH] forKey:@"paddingLeft"];
    
    
    if (@available(iOS 13.0 , *)) {
        NSMutableAttributedString *arrStr = [[NSMutableAttributedString alloc]initWithString:pN.placeholder attributes:@{NSForegroundColorAttributeName:colorWithHexString(@"#E0E0E0"),NSFontAttributeName:[UIFont systemFontOfSize:14],}];
        pN.attributedPlaceholder = arrStr;
    }else{
         [pN setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
         [pN setValue:colorWithHexString(@"#E0E0E0") forKeyPath:@"_placeholderLabel.textColor"];
    }
   
    
    
   
   
    [_bgImg addSubview:pN];
    
    
    
    
    
    
    VerificationCode *textf = VerificationCode.new;
    textf.frame = RECT(pN.x,pN.y + pN.height+ 30*KWIDTH,pN.width,pN.height);
  
    textf.backgroundColor = pN.backgroundColor;
    textf.layer.cornerRadius = pN.layer.cornerRadius;
    textf.layer.masksToBounds = YES;
//
//    CGRect frame = textf.frame;
//    frame.size.width = 8;// 距离左侧的距离
//    UIView *leftview = [[UIView alloc] initWithFrame:frame];
//    textf.leftViewMode = UITextFieldViewModeAlways;
   
    
    
    
    
    
    
    [textf setValue:[NSNumber numberWithInt:40*KWIDTH] forKey:@"paddingLeft"];
    textf.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"      请输入验证码" attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14], NSForegroundColorAttributeName:colorWithHexString(@"#E0E0E0")}];
    
    /*
      // textf.placeholder = @"\u3000\u3000请输入验证码";
    if (@available(iOS 13.0 , *)) {
          NSMutableAttributedString *arrStr = [[NSMutableAttributedString alloc]initWithString:textf.placeholder attributes:@{NSForegroundColorAttributeName:colorWithHexString(@"#E0E0E0"),NSFontAttributeName:[UIFont systemFontOfSize:14],}];
          textf.attributedPlaceholder = arrStr;
      }else{
//           [pN setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
//           [pN setValue:colorWithHexString(@"#E0E0E0") forKeyPath:@"_placeholderLabel.textColor"];
          
            [textf setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
            [textf setValue:colorWithHexString(@"#E0E0E0") forKeyPath:@"_placeholderLabel.textColor"];
      }
  */
    textf.getVerBtnBlock = ^(UIButton * t) {
        [self getVer:t];
    };
    [_bgImg addSubview:textf];

    //
    tooltip *topic = tooltip.new;  
    topic.frame =RECT(pN.x,textf.y + textf.height+ 40*KWIDTH,700*KWIDTH,30*KWIDTH);
   // topic.backgroundColor = UIColor.purpleColor;
    [topic setBtnSelBlock:^(UIButton * t) {
       
        
        [self addSelEvent:t];
        
    }];
   // topic.btnSel.backgroundColor = UIColor.redColor;
    self.selBtn = topic.btnSel;
    [_bgImg addSubview:topic];
    
    
    
    UIButton *LoginBtn = UIButton.new;
    LoginBtn.frame = RECT(textf.x,topic.height + topic.y + 80*KWIDTH,pN.width,textf.height);
    [LoginBtn setTitle:@"登录" forState:0];
    LoginBtn.layer.borderColor = color(90,118,140).CGColor;
    LoginBtn.layer.cornerRadius =36*KWIDTH;
     LoginBtn.layer.borderWidth = 2;
    LoginBtn.layer.masksToBounds = YES;
    
    CAGradientLayer *gl = [CAGradientLayer layer];
    //:startPoint & endPoint设置为(0,0)(1.0,0)代表水平方向渐变,(0,0)(0,1.0)代表竖直方向渐变
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1.0, 0);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:160/255.0 green:201/255.0 blue:51/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:20/255.0 green:160/255.0 blue:62/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0.0),@(0.5f)];
    
    [LoginBtn.layer addSublayer:gl];
    [_bgImg addSubview:LoginBtn];
    
    
    
    
    
    //本机号码一键登录
    UIButton *MyNumberRegister = [UIButton buttonWithType:UIButtonTypeCustom];
    MyNumberRegister.frame = CGRectMake(LoginBtn.x, LoginBtn.height + LoginBtn.y+ 30*KWIDTH,SCREEN_WIDTH -200*KWIDTH,textf.height );
    MyNumberRegister.layer.cornerRadius = 36*KWIDTH;
    MyNumberRegister.layer.masksToBounds = YES;
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    //设置渐变色的frame
    gradientLayer.frame = CGRectMake(0, 0, SCREEN_WIDTH- 200*KWIDTH, 72*KWIDTH);
 //   :startPoint & endPoint设置为(0,0)(1.0,0)代表水平方向渐变,(0,0)(0,1.0)代表竖直方向渐变
    //设置渐变色的开始位置
    gradientLayer.startPoint = CGPointMake(0, 0);
    //设置渐变色的结束位置
    gradientLayer.endPoint = CGPointMake(0.6, 0);//
    gradientLayer.locations = @[@(0.5),@(1.0)];//渐变点
      gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:160/255.0 green:201/255.0 blue:51/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:20/255.0 green:160/255.0 blue:62/255.0 alpha:1.0].CGColor];//渐变数组
    [MyNumberRegister.layer addSublayer:gradientLayer];
    [MyNumberRegister setTitle:@"本机号码一键登录" forState:UIControlStateNormal];
    [MyNumberRegister addTarget:self action:@selector(LocalNumberLogin:) forControlEvents:1 << 6];
    [_bgImg addSubview:MyNumberRegister];
    
    
    
    
    
    
    
    
    weChatIcon *thirdLogin = weChatIcon.new;
    thirdLogin.frame = RECT(0,MyNumberRegister.height + MyNumberRegister.y + 80*KWIDTH,SCREEN_WIDTH,400*KWIDTH);
   // thirdLogin.backgroundColor = UIColor.purpleColor;
    [thirdLogin setWeChatLoginBlock:^(UIButton * t) {
        NSLog(@"微信登录");
      //  [self CheckWeChatInstalled];
    }];
    [_bgImg addSubview:thirdLogin];
    
}

//检查微信是否安装
//-(void)CheckWeChatInstalled{
//    if( [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession])
//      {
//          [[UMSocialManager defaultManager] cancelAuthWithPlatform:UMSocialPlatformType_WechatSession completion:^(id result, NSError *error) {
//
//              [self getUserInfoWithPlatform:UMSocialPlatformType_WechatSession type:@"2"];
//
//
//          }];
//      }
//}



-(void)getVer:(UIButton*)sebnder{
    NSLog(@"获取验证码");
    
}
-(void)addClick:(UIButton*)sender{
    
    NSLog(@"微信登录");
}
-(void)addSelEvent:(UIButton*)sender{
    if((sender.selected = !sender.selected)){
        sender.selected = YES;//选中
        [sender setImage:[UIImage imageNamed:@"isSel"] forState:UIControlStateSelected];
    }else{
        sender.selected = NO;//不选中
        [sender setBackgroundImage:[UIImage imageNamed:@"noSel"] forState:UIControlStateNormal];
    }
    
    /*
     [_btnSel setBackgroundImage:[UIImage imageNamed:@"noSel"] forState:UIControlStateNormal];
     [_btnSel setImage:[UIImage imageNamed:@"isSel"] forState:UIControlStateSelected];
     
     */
    
}
-(void)initBackgroundVideo{
    
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.avPlayer play];//视频开始
}
-(void)viewDidDisappear:(BOOL)animated
{
    [self.avPlayer pause];//视频暂停
}
@end
