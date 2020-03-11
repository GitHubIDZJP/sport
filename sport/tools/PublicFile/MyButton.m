//
//  MyButton.m
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/24.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        
        //label-1
        
        
       
        self.titles = [[UILabel alloc] init];
        self.titles.frame = CGRectMake(0,0,self.width,40*KWIDTH);
        self.titles.textAlignment = NSTextAlignmentCenter;  //文字居中
        self.titles.adjustsFontSizeToFitWidth = YES;   //文字大小自适应
        self.titles.font = [UIFont fontWithName:@"DIN-Medium" size:15];
        self.titles.textColor = [UIColor whiteColor];
        
        [self addSubview:self.titles];
        
        self.titleData = [[UILabel alloc] init];
        self.titleData.frame = CGRectMake(self.titles.x,self.titles.y + self.titles.height,self.titles.width,self.titles.height);
        self.titleData.textAlignment = NSTextAlignmentCenter;  //文字居中
        self.titleData.adjustsFontSizeToFitWidth = YES;   //文字大小自适应
        self.titleData.font = Font12;
        [self addSubview:self.titleData];
        
       // self.titleData.textColor = color(74, 74, 74);

        self.titleData.textColor =   self.titles.textColor;
        
      
       // self.titleData.font  = self.titles.font;
        
        
        //labnel2
        
    }
    return self;
    
}
-(void)setTitleContext:(NSString*)context titleData:(NSString*)tD{
    
 
    self.titles.text = context;
    self.titleData.text = tD;
    
    
    
}
@end
