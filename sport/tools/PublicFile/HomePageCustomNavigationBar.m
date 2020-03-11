//
//  HomePageCustomNavigationBar.m
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/14.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "HomePageCustomNavigationBar.h"

@implementation HomePageCustomNavigationBar


-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
    
     
        _leftButtonLoading = [[navButton alloc]init];
        _rightButtonLoading = [[navButton alloc]init];
                               
           [  self addSubview:_leftButtonLoading];
           [  self addSubview:_rightButtonLoading];

        

    }
    return self;
    
    
}

-(void)layoutSubviews
{
    [super layoutSubviews ];
    
    //y 23 x  20  w  50  h  31
    
    CGFloat x = 50*KWIDTH;
    CGFloat y = 20*KWIDTH;
    CGFloat w =  50*KWIDTH;
    CGFloat h = 74*KWIDTH;
    
    _leftButtonLoading.frame = RECT(x,y,w,h);
    _rightButtonLoading.frame =RECT(SCREEN_WIDTH- w-x, _leftButtonLoading.y,w,h);
    

    [_leftButtonLoading setTopImg:@"Home_Nav_Icon_Vip_" andBottomLable:@"V通道"];
    [_rightButtonLoading setTopImg:@"Home_Nav_Icon_Screening_" andBottomLable:@"筛选"];
    
    
    
    
    
    //响应事件
    
   [_leftButtonLoading addTarget:self action:@selector(changeView) forControlEvents:UIControlEventTouchUpInside];
   [_rightButtonLoading addTarget:self action:@selector(changeView1) forControlEvents:UIControlEventTouchUpInside];
}


-(void)changeView
{
    //代理:
    if([self.delegate respondsToSelector:@selector(goToController)]){
        [self.delegate goToController];
    }
    
    //快跳转
    self.myBlock();
}
-(void)changeView1{
   
    if([self.delegate respondsToSelector:@selector(goToController1)]){
        [self.delegate goToController1];
    }
    
    //快跳转
    self.myBlock1();
}
@end



