//
//  weChatIconAddContext.m
//  TooBrocadeCarp
//
//  Created by Mac on 2019/10/9.
//  Copyright © 2019 Mac. All rights reserved.
//


#import "weChatIconAddContext.h"

@implementation weChatIconAddContext

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
#define KWIDTH [UIScreen mainScreen].bounds.size.width/750.0
-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        self.userInteractionEnabled= YES;
        //init controlles
        
        _otherloginBtn = [[UIButton alloc]initWithFrame:CGRectMake(0,0,self.bounds.size.width,30)];
        [self addSubview:_otherloginBtn];
        
        CGFloat weChatIocnGetWidthOrHeight =  68*KWIDTH;
        CGFloat x = self.bounds.size.width/2 - weChatIocnGetWidthOrHeight/2;
        CGFloat y= _otherloginBtn.frame.origin.y + _otherloginBtn.frame.size.height +  10*KWIDTH;
        _weChatIcon = [[UIImageView alloc]initWithFrame:CGRectMake(x,y,weChatIocnGetWidthOrHeight,weChatIocnGetWidthOrHeight)];
        _weChatIcon.backgroundColor = UIColor.redColor;
        _weChatIcon.image = [UIImage imageNamed:@"组 5 拷贝@2x"];
              [self addSubview:_weChatIcon];
        UITapGestureRecognizer  *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapAction:)];
          [_weChatIcon addGestureRecognizer:singleTap];
        
        //test
       // _otherloginBtn.backgroundColor = [UIColor purpleColor];
       // _weChatIcon.backgroundColor = [UIColor redColor];
        
        
       // [_otherloginBtn setTitleColor:[UIColor grayColor] forState:normal];
        
    }
    return self;
}



-(void)layoutSubviews
{
    
    [super layoutSubviews];
    
    
    //setting style
    
    [_otherloginBtn setTitle:@"其他方式的登录" forState:UIControlStateNormal];
    _otherloginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
   // _otherloginBtn.titleLabel.textColor = [UIColor grayColor];
    
   // [_weChatIcon setImage:
    
    _weChatIcon.image =[UIImage imageNamed:@"pay02"];
    _weChatIcon.userInteractionEnabled= YES;
    
    
    
   
}

-(void)SetOtherBtnTagValue:(int)getTag andweChatIconTag:(int)tag {
    
    _otherloginBtn.tag = getTag;
    _weChatIcon.tag = tag;
   // return getTag;
}
//-(void)setWeChatIconPathName:(NSString *)weChatIcon {
//
//    _weChatIcon.image = [UIImage imageNamed:weChatIcon];
//   // return weChatIcon;
//
//}
-(void)setcolor:(UIColor*)c{
   [_otherloginBtn setTitleColor:c forState:normal];
    
}
//点击事件
-(void)singleTapAction:(UIGestureRecognizer *)tap
{
//具体的实现
    NSLog(@"微信登录");
}
@end
