//
//  newUnderLiner.m
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/30.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "newUnderLiner.h"

@implementation newUnderLiner

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
    
    
    context  = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color(236, 236, 237).CGColor);
    
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame)-10, CGRectGetWidth(self.frame), 1));
}


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
      //  _labelSize = [UILabel alloc]initWithFrame:CGRectMake();
    }
    return self;
    
}


@end
