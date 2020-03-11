//
//  btnClick.m
//  Sports
//
//  Created by test on 2020/1/8.
//  Copyright © 2020 test. All rights reserved.
//

#import "btnClick.h"
@interface btnClick()
{
    
}
@end

@implementation btnClick

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//-(UILabel*)topText
//{
//
//    if(!_topText){
//
//    }
//    return _topText;
//
//}
//-(UILabel*)bottomText
//{
//    if(!_bottomText){
//
//    }
//    return _bottomText;
//
//}
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.layer.cornerRadius = 10*KWIDTH;
        self.layer.masksToBounds= YES;
       // self.backgroundColor  = UIColor.yellowColor;
        
        self.showsTouchWhenHighlighted=YES;
        
        
        _topText = [[UILabel alloc]init];
        _topText. textColor = colorWithHexString(@"#333333");
        _topText.font = Font14;
        _topText.frame = RECT(30*KWIDTH,22*KWIDTH,155*KWIDTH,22*KWIDTH);
        _topText.textAlignment   = NSTextAlignmentCenter;
        
        _bottomText= UILabel.new;
        _bottomText.frame = RECT(_topText.x,_topText.height+ _topText.y + 15*KWIDTH,_topText.width,_topText.height);
        _bottomText.font = Font12;
        _bottomText.textAlignment = _topText.textAlignment;
        _bottomText.textColor = colorWithHexString(@"#999999");
        
        
        [self addSubview:self.topText];
        [self addSubview:self.bottomText];
        
    }
    return self;
}
-(void)setTText:(NSString *)tt bText:(NSString *)bt{
    self.topText.text = tt;
    self.bottomText.text = bt;
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
