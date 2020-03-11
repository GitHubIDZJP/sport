//
//  blockButton.m
//  btc
//
//  Created by admin on 2019/8/13.
//  Copyright © 2019 admin. All rights reserved.
//

#import "blockButton.h"

@implementation blockButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




// Tang,kelly

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
