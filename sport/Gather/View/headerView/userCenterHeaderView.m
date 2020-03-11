//
//  userCenterHeaderView.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "userCenterHeaderView.h"

@implementation userCenterHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //self.verticalAlignment = VerticalAlignmentMiddle;
        [self initializationLoad];
        self.userInteractionEnabled = YES;
        
        
    }
    return self;
}
-(void)initializationLoad{
    
    
    _BGImg = [[UIImageView alloc]init];
    _BGImg.frame  = RECT(0,0,self.width,self.height);
    _BGImg.image = [UIImage imageNamed:@"InformationBar"];
    [self addSubview:_BGImg];
    _avatar = [[UIImageView alloc]init];
    _userId = [[UILabel alloc]init];
    _userSignature = [[myUILabel alloc]init];
   
    
    
    //load
    
    [self addSubview:_avatar];
    [self addSubview:_userId];
    [self addSubview:_userSignature];
   
    
    
    
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    // set frame
    _avatar.frame = RECT(30*KWIDTH,129*KWIDTH,110*KWIDTH,110*KWIDTH);
    _avatar.layer.cornerRadius = _avatar.width/2;
    _avatar.layer.masksToBounds = YES;
    _userId.frame = RECT(_avatar.frame.origin.x+ _avatar.frame.size.width+ 19*KWIDTH,_avatar.frame.origin.y + 25*KWIDTH,310*KWIDTH,26*KWIDTH);
    _userSignature.frame = RECT(_userId.frame.origin.x,_userId.frame.origin.y + _userId.frame.size.height+
                                21*KWIDTH,self.bounds.size.width ,22*KWIDTH);
  
    //set style
    
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
    self.returnBtn = [[UIButton alloc]initWithFrame:CGRectMake(29*KWIDTH,68*KWIDTH,20*KWIDTH,34*KWIDTH)];
    self.returnBtn.backgroundColor = [UIColor redColor];
    //[self.returnBtn setTitle:@"123" forState:UIControlStateNormal];
#pragma mark 设置返回按钮 因为UI没有做标注 后期UI得加进去 
    [self.returnBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal ];
    [self.returnBtn addTarget:self action:@selector(shareBtnAction:) forControlEvents:1 << 6];
    [self addSubview:self.returnBtn];
    
    
}
-(void)shareBtnAction:(UIButton*)sender{
    self.returnBtnBlock();
    
}
-(void)setAvatarImg:(NSString*)img setUserName:(NSString*)strF setUserSignatureText:(NSString*)text {
    _avatar.image = [UIImage imageNamed:img];
    
    
    
    
    
    _userId.text = strF;
    NSString *appendStr = @"签名:  ";
    _userSignature.text = [appendStr stringByAppendingString:text];
   
    
    
    
}

@end
