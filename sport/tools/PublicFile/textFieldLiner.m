//
//  textFieldLiner.m
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/17.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "textFieldLiner.h"

@implementation textFieldLiner

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
    
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame)-1, CGRectGetWidth(self.frame), 3));
}


@end
