//
//  CustomSegmentView.m
//  masAddTab
//
//  Created by test on 2020/2/3.
//  Copyright © 2020 test. All rights reserved.
//


#import "CustomSegmentView.h"

@implementation CustomSegmentView
@synthesize cusBkColor = _cusBkColor;
@synthesize cusSelColor = _cusSelColor;
@synthesize segmentArray = _segmentArray;
@synthesize cusTextColor = _cusTextColor;

- (id)initWithFrame:(CGRect)frame
       segmentArray:(NSArray *)_array
         background:(UIColor *)_bkColor
      selectedColor:(UIColor *)_selColor
        borderColor:(UIColor *)_bColor
        borderWidth:(float)_bWidth
           textFont:(UIFont *)_font
          textColor:(UIColor *)_textColor
           position:(NSString *)_position
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:_bkColor];
        self.cusBkColor = _bkColor;
        self.cusSelColor = _selColor;
        self.cusTextColor = _textColor;
        self.cusbWidth = _bWidth;
        self.cusbColor = _bColor;
        
        self.segmentArray = [[NSMutableArray alloc] init];
        
        float width = frame.size.width/_array.count;
        for (int i = 0; i < [_array count]; i++) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(width * i, 0, width, frame.size.height)];
          //  btn.tag  == 100+i;
            //            [btn setImageWithTitle:[UIImage imageNamed:@"email"] withTitle:[_array objectAtIndex:i] position:@"right" font:_font forState:UIControlStateNormal];
            
            //不需要图片与文字一起显示
            [btn setTitle:[_array objectAtIndex:i] forState:UIControlStateNormal];
            [btn setFont:_font];
            
            [btn addTarget:self action:@selector(clickSegment:) forControlEvents:UIControlEventTouchUpInside];
            
            [_segmentArray addObject:btn];
            [self addSubview:btn];
        }
        self.layer.masksToBounds=YES;
    }
    return self;
}
//函数是按钮响应的函数，在该类中，我们使用了代理的方式，告知使用该控件的视图，用户是点击的哪一个视图
- (void)clickSegment:(id)sender{
    UIButton *btn = (UIButton *)sender;
    NSUInteger index = [_segmentArray indexOfObject:btn];
    NSLog(@"%lu",(unsigned long)index);
   [self.myDelagte buttonClick:index];
    [self updateSegmentStates:index];
//    if(index == 0){
//        self.backgroundColor = UIColor.redColor;
//    }else if (index == 1){
//        self.backgroundColor = UIColor.yellowColor;
//    }
    
}

- (void)clickOtherSegment:(id)sender{
    UIButton *btn = (UIButton *)sender;
    NSUInteger index = [_segmentArray indexOfObject:btn];
    NSLog(@"%lu",(unsigned long)index);
    [self.myDelagte topButtonClick:btn.titleLabel.text];
    [self updateSegmentStates:index];
}

//函数则是用于更新按钮状态的函数，当某一个按钮被几点之后，外观需要怎么更改，以及其他未被点击的按钮背景外观如何
- (void)updateSegmentStates:(NSUInteger )index{
    self.layer.borderWidth=self.cusbWidth;
    self.layer.borderColor=self.cusbColor.CGColor;
    
    for (int i = 0; i < [_segmentArray count]; i++) {
        if(i == index){
            UIButton *btn = [_segmentArray objectAtIndex:index];
            [btn setBackgroundColor:_cusSelColor];
            [btn setTitleColor:_cusTextColor forState:UIControlStateNormal];
        }else{
            UIButton *btn = [_segmentArray objectAtIndex:i];
            [btn setBackgroundColor:_cusBkColor];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
}
@end
