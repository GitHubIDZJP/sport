//
//  RightTableViewCell.m
//  Sports
//
//  Created by test on 2020/1/9.
//  Copyright © 2020 test. All rights reserved.
//


#import "RightTableViewCell.h"
#define marginTop 30*KWIDTH
@implementation RightTableViewCell
-(UILabel*)tit
{
    if(!_tit){
        _tit = UILabel.new;
        _tit.frame = RECT(40*KWIDTH,30*KWIDTH,30*KWIDTH,30*KWIDTH);
        //_tit.backgroundColor = UIColor.redColor;
        _tit.textAlignment = NSTextAlignmentCenter;
        _tit.font = Font11;
    }
    return _tit;
}
-(UIImageView*)imgP
{
    if(!_imgP){
        
        _imgP = [[UIImageView alloc]init];
        _imgP.frame = RECT(_tit.width + _tit.x+ 10*KWIDTH,30*KWIDTH, 36*KWIDTH,36*KWIDTH);
       // _imgP.backgroundColor = UIColor.orangeColor;
    }
    return _imgP;
    
}
-(UILabel*)tex
{
    if(!_tex){
        _tex = UILabel.new;
        _tex.frame = RECT(_imgP.width+ _imgP.x + 15*KWIDTH,_imgP.y + 5*KWIDTH,95*KWIDTH,23*KWIDTH);
        _tex.textAlignment= NSTextAlignmentLeft;
       // _tex.backgroundColor = UIColor.yellowColor;
        _tex.font = Font12;
    }
    return _tex;
}
-(UILabel*)tNumber
{
    if(!_tNumber){
        _tNumber = UILabel.new;
        CGFloat w = 27*KWIDTH;
        CGFloat m_r = 111*KWIDTH;
        _tNumber.frame = RECT(self.width - w- m_r,39*KWIDTH,170*KWIDTH,19*KWIDTH);
        _tNumber.textAlignment = NSTextAlignmentLeft;
        //_tNumber.backgroundColor = UIColor.blueColor;
        _tNumber.font = Font12;
        _tNumber.textColor = colorWithHexString(@"#4CB13B");
    }
    return _tNumber;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
       // [self addShadowToView:<#(nonnull UIView *)#> withColor:<#(nonnull UIColor *)#>];
        
        
        [self addSubview:self.tit];
        [self addSubview:self.imgP];
        [self addSubview:self.tex];
        [self addSubview:self.tNumber];
        
        
        
    }
    return self;
}
-(void)setBootTextBGColor:(UIColor*)color{
    self.tit.backgroundColor = color;
    
}
-(void)setBootTextTextColor:(UIColor*)tC{
    self.tit.textColor = tC;
}
-(void)setBootTextCornerRadius:(CGFloat)btcr{
    self.tit.layer.cornerRadius = btcr;
}
-(void)setMaskToBounds:(BOOL)mtb{
    self.tit.layer.masksToBounds = mtb;
}
-(void)setBootTextStr:(NSString*)btStr{
    self.tit.text = btStr;
}
//+(UIFont*)boldSystemFontOfSize:(CGFloat)bf{
//    UIFont *font = [UIFont boldSystemFontOfSize:bf];
//    return font;
//}
- (void)addShadowToView:(UIView *)theView withColor:(UIColor *)theColor{
    // 阴影颜色
    self.tit.layer.shadowColor = theColor.CGColor;
    // 阴影偏移，默认(0, -3)
    self.tit.layer.shadowOffset = CGSizeMake(0,0);
    // 阴影透明度，默认0
    self.tit.layer.shadowOpacity = 0.5;
    // 阴影半径，默认3
    self.tit.layer.shadowRadius = 5;
    
    
    
}
-(void)addImgPath:(NSString*)ip  TexStr:(NSString*)ts tNumber:(NSString*)TN{
    //self.tit.text = tls;
    self.imgP.image = [UIImage imageNamed:ip];
    self.tex.text = ts;
    self.tNumber.text  = TN;
}
@end
