//
//  weChatIcon.m
//  Sports
//
//  Created by test on 2020/1/17.
//  Copyright © 2020 test. All rights reserved.
//

#import "weChatIcon.h"
#import "JHGlobalMethod.h"
@implementation weChatIcon
-(UIButton *)weChatLogin
{
    if(!_weChatLogin){
        
        _weChatLogin = [[UIButton alloc]init];//WithFrame:RECT(330*KWIDTH,_line.y + _line.height + 30*KWIDTH ,90*KWIDTH ,90*KWIDTH )];
        [_weChatLogin addTarget:self action:@selector(click:) forControlEvents:1 << 6];
        //_weChatLogin.backgroundColor = UIColor.yellowColor;
        // [_btnSel setTitleColor:UIColor.whiteColor forState:0];
#pragma mark---输入登录第三方图片
        [_weChatLogin setBackgroundImage:[UIImage imageNamed:@"微信图标"] forState:0];
    }
    
    
    
    return _weChatLogin;
}
-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        
        
        [self addSubview:self.line];
        
        for(int i = 0;i< 3;i++){
           _line = UILabel.new;
            CGFloat x = 183*KWIDTH;
           
            CGFloat w = (SCREEN_WIDTH - 2*x)/3;
            CGFloat h = 40*KWIDTH;
             CGFloat test =w/8;
            _line.frame = RECT(x+i*w,h/2,w-(w/8),h);
            _line.backgroundColor = UIColor.whiteColor;
            _line.tag = 100+i;
            [self addSubview:self.line];
            
            if(i == 1){
                //_line.hidden = YES;
               label = (UILabel*)[self.line viewWithTag:101];
                label.backgroundColor = UIColor.clearColor;
                label.textColor = UIColor.whiteColor;
                label.text = @"其他登录方式";
                label.font = Font11;
                label.textAlignment = NSTextAlignmentCenter;
                CGRect originFrame = _line.frame;
                originFrame.origin.x -= test;
                originFrame.size.width += 2 * test;
              //  originFrame.size.height = 1;
               // originFrame.origin.y += _line.height/2;
                _line.frame = originFrame;
                
            }else if (i ==0 || i== 2){
                CGRect originFrame = _line.frame;
                //originFrame.size.width -=20*KWIDTH;
                originFrame.size.height = 1;
                originFrame.origin.y += _line.height/2;
               
                _line.frame = originFrame;
                
            }else if (i == 0){
              //  _line.textAlignment = NSTextAlignmentLeft;
            }else if (i ==2){
                //_line.textAlignment = NSTextAlignmentRight;
            }
        }
        self.weChatLogin.frame = RECT(5*KWIDTH+SCREEN_WIDTH/2-55*KWIDTH,label.height+label.y + 20*KWIDTH,90*KWIDTH,90*KWIDTH);
        [self addSubview:self.weChatLogin];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(self.weChatLogin.x,self.weChatLogin.height + self.weChatLogin.y + 10*KWIDTH,self.weChatLogin.width,21*KWIDTH);
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        [self addSubview:label];
        label.text = @"微信登录";
        label.font = Font10;
        label.textColor = colorWithHexString(@"#92A096");
         
         
    }
    return self;
    
}
-(void)click:(UIButton*)sender{
    self.weChatLoginBlock(sender);
}
@end
