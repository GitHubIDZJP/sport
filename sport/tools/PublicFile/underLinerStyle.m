//
//  underLinerStyle.m
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/30.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "underLinerStyle.h"

@implementation underLinerStyle




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
    
    
    context  = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color(238, 204, 145).CGColor);
    
    CGContextFillRect(context, CGRectMake(25*KWIDTH, CGRectGetHeight(self.frame)-10, SCREEN_WIDTH- 50*KWIDTH, 1));
}

// textField
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        self.labelSize= [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 50*KWIDTH,10*KWIDTH,50*KWIDTH,50*KWIDTH)];
        self.labelSize.tag = 67;
        [self addSubview:self.labelSize];
    }
    
    return self;
    
}

-(void)layoutSubviews
{
    
    
    
    
    
}
-(void)setLabelSizeText:(NSString*)t{
    
    self.labelSize.text = t;
}
//-(void)setcontextLinerColor:(UIColor*)c{
//    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
//}

@end
