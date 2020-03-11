//
//  imgOrTitleBtn.m
//  Sports
//
//  Created by test on 2020/1/14.
//  Copyright © 2020 test. All rights reserved.
//

#define imgW  56*KWIDTH
#import "imgOrTitleBtn.h"

@implementation imgOrTitleBtn


-(UIImageView *)Img{
    
    if(!_Img){
        _Img = [[UIImageView alloc]init];
        CGFloat x = ((SCREEN_WIDTH- 60*KWIDTH)/4)/2 - imgW/2;
        _Img.frame = RECT(x,0,imgW,imgW);
        //_Img.backgroundColor = UIColor.redColor;
    }
    return _Img;
        
}
-(UILabel *)title
{
    if(!_title){
        _title = UILabel.new;
        CGFloat w = (SCREEN_WIDTH - 60*KWIDTH)/4;
        _title.frame = RECT(0,_Img.height + _Img.y + 10*KWIDTH,w,23*KWIDTH);
        _title.font = Font12;
        //_title.textColor = colorWithHexString(@"#909694");
        _title.textAlignment = NSTextAlignmentCenter;
        //_title.backgroundColor  = UIColor.purpleColor;
    }
    return _title;
}
-(void)setImg:(NSString *)i title:(NSString *)t{
    
    
    
    self.Img.image = [UIImage imageNamed:i];
    self.title.text  = t;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self addSubview:self.Img];
        [self addSubview:self.title];
        
        
    }
    
    
    return self;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
//实现点击方法
- (void)addTapBlock:(void (^)(UIButton *))block{
    self.block = block;
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)buttonAction:(UIButton *)button{
    if (self.block) {
        self.block(button);
    }
}
-(void)setImgY:(int)y{
    
    CGRect originFrame = self.Img.frame;
    //2.修改frame值： 设置y的值-10
    originFrame.origin.y += y;
    //3.重新把新的frame再次赋值给按钮
    self.Img.frame = originFrame;
    
    
}
-(void)setTitleColor:(UIColor *)color{
    self.title.textColor  = color;
}
@end
