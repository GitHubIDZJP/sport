//
//  mineHeaderView.m
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/15.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "mineHeaderView.h"

@implementation mineHeaderView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //self.verticalAlignment = VerticalAlignmentMiddle;
        [self initializationLoad];
        self.userInteractionEnabled = YES;
        
        
        
        
        
        self.HideButton = [[UIButton alloc]initWithFrame:RECT(0,80*KWIDTH,self.width - 100*KWIDTH,200*KWIDTH)];
//        View.backgroundColor = UIColor.redColor;
      //  View.layer.borderColor = UIColor.redColor.CGColor;
        //View.layer.borderWidth = 4;
        [self.HideButton addTarget:self action:@selector(HideButtonClick:) forControlEvents:1 << 6];
        [self addSubview:self.HideButton];
        
        
        
        
        
    }
    return self;
}
-(void)HideButtonClick:(UIButton*)bind{
    self.HideButtonBlock(bind);
}
-(void)initializationLoad{
    
    
    _BGImg = [[UIImageView alloc]init];
    _BGImg.frame  = RECT(0,0,self.width,self.height);
    _BGImg.image = [UIImage imageNamed:@"Image 拷贝 3@2x"];
    [self addSubview:_BGImg];
    _avatar = [[UIImageView alloc]init];
    _userId = [[UILabel alloc]init];
    _userSignature = [[myUILabel alloc]init];
    _settingsBtn = [[UIButton alloc]init];
    
    
    //load
    
    [self addSubview:_avatar];
    [self addSubview:_userId];
    [self addSubview:_userSignature];
    [self addSubview:_settingsBtn];
    
    
   
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    // set frame
    _avatar.frame = RECT(30*KWIDTH,138*KWIDTH,100*KWIDTH,100*KWIDTH);
    _avatar.layer.cornerRadius = _avatar.width/2;
    _avatar.layer.masksToBounds = YES;
    _userId.frame = RECT(_avatar.frame.origin.x+ _avatar.frame.size.width+ 19*KWIDTH,155*KWIDTH,310*KWIDTH,26*KWIDTH);
    _userSignature.frame = RECT(_userId.frame.origin.x,196*KWIDTH,self.bounds.size.width ,22*KWIDTH);
    
    
    _settingsBtn.frame = RECT(self.frame.size.width - 76*KWIDTH ,73*KWIDTH,36*KWIDTH,36*KWIDTH);
     [ _settingsBtn setBackgroundImage:[UIImage imageNamed:@"消息@2x"] forState:UIControlStateNormal ];
    
   
    
    
    //>
    self.setBtn = [[UIButton alloc]initWithFrame:CGRectMake(681*KWIDTH,172*KWIDTH,12*KWIDTH,22*KWIDTH)];
    // self.setBtn.backgroundColor = [UIColor redColor];
    //[self.setBtn setTitle:@"123" forState:UIControlStateNormal];
    [self.setBtn setBackgroundImage:[UIImage imageNamed:@"返 回 拷贝@2x"] forState:UIControlStateNormal ];
    self.setBtn.hitScale = 3;
    [self.setBtn addTarget:self action:@selector(shareBtnAction:) forControlEvents:1 << 6];
    [self addSubview:self.setBtn];
    _userSignature.numberOfLines = 0;
    

    
    _userId.textColor = [UIColor whiteColor];
    _userSignature.textColor = [UIColor whiteColor];
    _userSignature.font = Font11;
    
   
    
}
-(void)shareBtnAction:(UIButton*)sender{
    self.myBlock();
    
}
-(void)setAvatarImg:(NSString *)img setUserName:(NSString *)strF setUserSignatureText:(NSString *)text setSettingsButtonIcon:(NSString *)icon{
    _avatar.image = [UIImage imageNamed:img];
    
    
    
    
    
    _userId.text = strF;
    NSString *appendStr = @"签名:  ";
    _userSignature.text = [appendStr stringByAppendingString:text];
    [_settingsBtn setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    
    

}
-(void)setSettingButtonTag:(int)tag{
    _settingsBtn.tag = tag;
    
}
@end
