//
//  tooltip.m
//  Sports
//
//  Created by test on 2020/1/17.
//  Copyright © 2020 test. All rights reserved.
//

#import "tooltip.h"

@implementation tooltip


-(UIButton*)btnSel
{
    if(!_btnSel){
        
        _btnSel = [[UIButton alloc]initWithFrame:RECT(0*KWIDTH,0*KWIDTH ,20*KWIDTH ,20*KWIDTH )];
        [_btnSel addTarget:self action:@selector(clickGetVer:) forControlEvents:1 << 6];
       // _btnSel.backgroundColor = UIColor.yellowColor;
        [_btnSel setBackgroundImage:[UIImage imageNamed:@"noSel"] forState:UIControlStateNormal];
        [_btnSel setImage:[UIImage imageNamed:@"isSel"] forState:UIControlStateSelected];
       // [_btnSel setTitleColor:UIColor.whiteColor forState:0];
        
        
        
        
        
        
    }
    return _btnSel;
}
-(UILabel*)text
{
    if(!_text){
        _text = [[UILabel alloc]init];
       // _text.backgroundColor = color(148,159,174);
        _text.frame = RECT(_btnSel.width + _btnSel.x + 35*KWIDTH,_btnSel.y,534*KWIDTH,22*KWIDTH);
        _text.textColor = colorWithHexString(@"#E0E0E0");
        _text.text = @"我已阅读并同意 《球频道用户协议》";
        _text.font = Font11;
    }
    return _text;
}
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self addSubview:self.text];
        [self addSubview:self.btnSel];
        
    }
    return self;
    
    
}
-(void)clickGetVer:(UIButton*)get{
    self.btnSelBlock(get);
    
}

@end
