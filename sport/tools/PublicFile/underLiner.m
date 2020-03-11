//
//  underLiner.m
//  回家
//
//  Created by Mac on 2019/10/9.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "underLiner.h"

@implementation underLiner


- (void)drawRect:(CGRect)rect {
    
    
    context  = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, QCColor(236, 236, 237).CGColor);
   
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame)-1, CGRectGetWidth(self.frame), 1));
}

// textField


@end
