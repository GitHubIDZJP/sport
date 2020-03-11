//
//  twoUIView.m
//  Sports
//
//  Created by test on 2020/1/9.
//  Copyright © 2020 test. All rights reserved.
//

#import "twoUIView.h"

@implementation twoUIView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //self.verticalAlignment = VerticalAlignmentMiddle;
        
        self.userInteractionEnabled = YES;
        
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}
@end
