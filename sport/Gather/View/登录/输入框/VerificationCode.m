//
//  VerificationCode.m
//  Sports
//
//  Created by test on 2020/1/17.
//  Copyright © 2020 test. All rights reserved.
//

#import "VerificationCode.h"

@implementation VerificationCode
-(UILabel*)line
{
    if(!_line){
        _line = [[UILabel alloc]init];
        _line.backgroundColor = color(148,159,174);
        _line.frame = RECT(361*KWIDTH,16*KWIDTH,1*KWIDTH,40*KWIDTH);
        
    }
    return _line;
}
-(UIButton*)getVerBtn
{
    if(!_getVerBtn){
        
        _getVerBtn = [[UIButton alloc]initWithFrame:RECT(389*KWIDTH,24*KWIDTH ,128*KWIDTH ,24*KWIDTH )];
        _getVerBtn.titleLabel.font = Font12;
        [_getVerBtn setTitle:@"获取验证码" forState:0];
        [_getVerBtn addTarget:self action:@selector(clickGetVer:) forControlEvents:1 << 6];
        //_getVerBtn.backgroundColor = _line.backgroundColor;
        [_getVerBtn setTitleColor:UIColor.whiteColor forState:0];
        
    }
    return _getVerBtn;
}
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self addSubview:self.line];
        [self addSubview:self.getVerBtn];
        
    }
    return self;
    
    
}
-(void)clickGetVer:(UIButton*)get{
    self.getVerBtnBlock(get);
}


@end
