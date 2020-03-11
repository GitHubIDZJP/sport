//
//  means.m
//  Sports
//
//  Created by test on 2020/1/8.
//  Copyright © 2020 test. All rights reserved.
//

#import "means.h"
#define M_Y 40*KWIDTH
@implementation means
-(UILabel *)centerLabel{
    if(!_centerLabel){
        
        CGFloat x  = 230*KWIDTH;
        _centerLabel = UILabel.new;
        _centerLabel.backgroundColor = [UIColor redColor];
        _centerLabel.textAlignment =NSTextAlignmentCenter;
        _centerLabel.textColor = White;
        _centerLabel.frame = RECT(x,M_Y +zjpTest,SCREEN_WIDTH- 2*x,34*KWIDTH);
        _centerLabel.text = @"Ta的主页";
        
    }
    return _centerLabel;
    
    
}
-(UIButton*)navBtn
{
    if(!_navBtn)
    {
        _navBtn = UIButton.new;
        _navBtn.backgroundColor = [UIColor yellowColor];
        [_navBtn setBackgroundImage: [UIImage imageNamed:@""] forState:0];
        [_navBtn addTarget:self action:@selector(tap:) forControlEvents:1 << 6];
        _navBtn.frame = RECT(29*KWIDTH,M_Y+zjpTest,20*KWIDTH,34*KWIDTH);
        
    }
    return _navBtn;
}

-(UIButton*)heartBtn
{
    if(!_heartBtn)
    {
        _heartBtn = UIButton.new;
        _heartBtn.backgroundColor = [UIColor yellowColor];
        [_heartBtn setBackgroundImage: [UIImage imageNamed:@""] forState:0];
        [_heartBtn addTarget:self action:@selector(heart:) forControlEvents:1 << 6];
        _heartBtn.frame = RECT(600*KWIDTH,80+zjpTest,80*KWIDTH,44*KWIDTH);
        
    }
    return _heartBtn;
}
-(UIButton*)ShareBtn
{
    if(!_ShareBtn)
    {
        _ShareBtn = UIButton.new;
        _ShareBtn.backgroundColor = [UIColor yellowColor];
        [_ShareBtn setBackgroundImage: [UIImage imageNamed:@"设置"] forState:0];
        [_ShareBtn addTarget:self action:@selector(share:) forControlEvents:1 << 6];
        _ShareBtn.frame = RECT(684*KWIDTH,M_Y+zjpTest,36*KWIDTH,36*KWIDTH);
        
    }
    return _ShareBtn;
}
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //self.verticalAlignment = VerticalAlignmentMiddle;
        [self initializationLoad];
        self.userInteractionEnabled = YES;
        [self addSubview:self.navBtn];
        [self addSubview:self.centerLabel];
         [self addSubview:self.ShareBtn];
        
    }
    return self;
}
-(void)heart:(UIButton*)sender{
    self.myHeartBlock();
}
-(void)tap:(UIButton*)click{
    
    self.navBtnBlock();
}
-(void)share:(UIButton*)sender{
    
    self.myShareBlock();
}
-(void)initializationLoad{
    
    
    _BGImg = [[UIImageView alloc]init];
    _BGImg.frame  = RECT(0,0,self.width,self.height);
    _BGImg.image = [UIImage imageNamed:@"InformationBar"];
    [self addSubview:_BGImg];
    _avatar = [[UIImageView alloc]init];
    _avatar.backgroundColor = [UIColor purpleColor];
    _avatar.image= [UIImage imageNamed:@"pandn@2x"];
    _userId = [[UILabel alloc]init];
    _userSignature = [[myUILabel alloc]init];
  
   

    
    //load
    
    [self addSubview:_avatar];
    [self addSubview:_userId];
    [self addSubview:_userSignature];
   
      [self addSubview:self.heartBtn];
    
    
    
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    // set frame
    _avatar.frame = RECT(30*KWIDTH,169*KWIDTH,110*KWIDTH,110*KWIDTH);
    _avatar.layer.cornerRadius = _avatar.width/2;
    _avatar.layer.masksToBounds = YES;
    _userId.frame = RECT(_avatar.frame.origin.x+ _avatar.frame.size.width+ 19*KWIDTH,_avatar.frame.origin.y + 25*KWIDTH,310*KWIDTH,26*KWIDTH);
    _userSignature.frame = RECT(_userId.frame.origin.x,_userId.frame.origin.y + _userId.frame.size.height+ 21*KWIDTH,self.bounds.size.width ,22*KWIDTH);
    _userSignature.numberOfLines = 0;
    
    
    //set color
    
    //        _avatar.backgroundColor = [UIColor redColor];
    //        _userId.backgroundColor = [UIColor purpleColor];
    //        _userSignature.backgroundColor = [UIColor grayColor];
    //        _settingsBtn.backgroundColor = [UIColor blueColor];
    
    
    
    //set btn Tag
    
    // _settingsBtn.tag = 78;
    
    _userId.textColor = [UIColor whiteColor];
    _userSignature.textColor = [UIColor whiteColor];
    _userSignature.font = Font11;
    
  
    
}
-(void)setAvatarImg:(NSString*)img setUserName:(NSString*)strF setUserSignatureText:(NSString*)text ShareBtnIcon:(NSString*)icon HeartBtnIcon:(NSString*)iconImg
{
    _avatar.image = [UIImage imageNamed:img];
    
    
    
    
    
    _userId.text = strF;
    NSString *appendStr = @"签名:  ";
    _userSignature.text = [appendStr stringByAppendingString:text];
    [_ShareBtn setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
     [_heartBtn setBackgroundImage:[UIImage imageNamed:iconImg] forState:UIControlStateNormal];
}
-(void)setSettingButtonTag:(int)tag{
    _ShareBtn.tag = tag;
    
}

@end
