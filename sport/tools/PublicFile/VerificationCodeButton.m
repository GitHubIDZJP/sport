//
//  VerificationCodeButton.m
//  Sports
//
//  Created by test on 2020/1/6.
//  Copyright © 2020 test. All rights reserved.
//

#import "VerificationCodeButton.h"

@implementation VerificationCodeButton

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
       // self.backgroundColor = [UIColor blueColor];
        _icon = UIImageView.new;
        _title = UILabel.new;
        
        [self addSubview:_icon];
        [self addSubview:_title];
        
        _icon.backgroundColor = color(230, 230, 230);
//        _title.backgroundColor = [UIColor purpleColor];
        
        _title.tintColor = colorWithHexString(@"#3289FF");
        _title.font = Font14;
        
        
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            //h = 88- 26
            make.top.mas_equalTo(26*KWIDTH);
            make.left.mas_equalTo(1*KWIDTH);
            make.size.mas_equalTo(CGSizeMake(1,35*KWIDTH));
            
        }];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(177*KWIDTH,26*KWIDTH));
            make.top.equalTo(@(31*KWIDTH));
           // make.right.mas_equalTo(32*KWIDTH);
            make.left.mas_equalTo(20*KWIDTH);
        }];
        
        
    }
    return self;
}


-(void)setBtnTitle:(NSString *)t{
  
    self.title.text = t;
     
    
}
@end
