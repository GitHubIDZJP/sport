//
//  CustomReplacePhoneNumberView.m
//  Sports
//
//  Created by test on 2020/1/6.
//  Copyright © 2020 test. All rights reserved.
//

#import "CustomReplacePhoneNumberView.h"

@implementation CustomReplacePhoneNumberView

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

        self.bindPNumber = UILabel.new;
        [self addSubview:self.bindPNumber];
        self.changePNBtn= UIButton.new;
        [self addSubview:self.changePNBtn];
        self.arrow = UIImageView.new;
        [self addSubview:self.arrow];
        self.arrow.image = [UIImage imageNamed:@"youjiantou.png"];
        
        [self.bindPNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(360*KWIDTH,26*KWIDTH));
            make.top.equalTo(@(31*KWIDTH));
            make.left.mas_equalTo(self).offset(31*KWIDTH);
        }];
        
        
        [self.changePNBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70*KWIDTH,40*KWIDTH));
            make.top.mas_equalTo(24*KWIDTH);
            make.right.mas_equalTo(self).offset(-62*KWIDTH);
        }];
        
        
        [self.arrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(12*KWIDTH,22*KWIDTH));
            make.right.mas_equalTo(self).offset(-30*KWIDTH);
            make.top.mas_equalTo(33*KWIDTH);
        }];
        
        self.bindPNumber.textColor = colorWithHexString(@"#333333");
        self.bindPNumber.font   = Font14;
        //self.bindPNumber.backgroundColor = UIColor.yellowColor;
        self.changePNBtn.backgroundColor = colorWithHexString(@"#07913B");
      //  self.arrow.backgroundColor = UIColor.redColor;

        
        
        
        [self.changePNBtn setTitle:@"更换" forState:0];
        self.changePNBtn.titleLabel.font = Font12;
        self.changePNBtn.layer.cornerRadius = 10*KWIDTH;
        self.changePNBtn.layer.masksToBounds = YES;
        [self.changePNBtn addTarget:self action:@selector(changePn:) forControlEvents:1 << 6];
        
        
        
        
        
    }
    return self;
}
-(void)changePn:(UIButton*)change{
    self.btnBlock();
    
}
-(void)appendPhoneNumber:(NSString*)pn{
 
    
    NSString *appendStr = [[NSString stringWithFormat:@"已绑定手机"] stringByAppendingString:pn];
    self.bindPNumber.text =appendStr;
    
}
@end
