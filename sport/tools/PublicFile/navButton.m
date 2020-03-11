//
//  navButton.m
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/14.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "navButton.h"

@implementation navButton
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
         self.showsTouchWhenHighlighted=YES;
     
        self.topImageView = [[UIImageView alloc] init];
        
        self.topImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.topImageView];
        
        self.bottomLable = [[UILabel alloc] init];
        self.bottomLable.textAlignment = NSTextAlignmentCenter;  //文字居中
        self.bottomLable.adjustsFontSizeToFitWidth = YES;   //文字大小自适应
        [self addSubview:self.bottomLable];

        
        CGFloat y = 37*KWIDTH;
        CGFloat imgw = 39*KWIDTH;
       
        
        
        CGFloat h = 46*KWIDTH;
        CGFloat imgX =  self.width/2-imgw/2;//50*KWIDTH/2 - imgw/2;
        self.topImageView.frame = RECT(imgX,y, imgw,h);
 
      
        
       
      
        CGFloat addW= 10*KWIDTH;
        CGFloat labelW = 95*KWIDTH;
        CGFloat lanbelH= 23*KWIDTH;
        CGFloat labelX = self.width/2 - labelW/2;
        self.bottomLable.frame = RECT(labelX,_topImageView.y+_topImageView.height+ 5*KWIDTH,labelW,lanbelH);
         self.bottomLable.font = Font10;

        
        
        
    }
    return self;
}
-(void)setCGRectFrame:(int)cg{
    CGRect originFrame = self.bottomLable.frame;
    originFrame.origin.y -= cg;
    self.bottomLable.frame = originFrame;

    
}
-(void)changeImageViewFrame:(CGRect)frame{
//    CGRect originFrame = self.topImageView.frame;
//    originFrame.origin.x += frame;
//    originFrame.origin.y -= frame;
//    self.topImageView.frame = originFrame;
    self.topImageView.frame =frame;
    
    
    
}
-(void)changeLabelContextFrame:(CGRect)frame{
    self.bottomLable.frame  = frame;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
}
-(void)setTopImg:(NSString *)img andBottomLable:(NSString *)text{
    
    
    self.topImageView.image = [UIImage imageNamed:img];
    self.bottomLable.text = text;
    
    
    
}
-(void)setLabelTag:(int)tag{
    
    self.bottomLable.tag = tag;
}
-(void)settopImageViewTag:(int)tag{
    self.topImageView.tag = tag;
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


- (void)setBlock:(void (^)(UIButton *))block{
    _block = block;
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}



@end
