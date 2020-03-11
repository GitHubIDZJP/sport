//
//  mySelfFansViewControllerTableViewCell.m
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/17.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "mySelfFansViewControllerTableViewCell.h"

@implementation mySelfFansViewControllerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UILabel *)signature
{
    if(!_signature){
        _signature = UILabel.new;
        _signature.frame = RECT(_userName.x,_userName.height +_userName.y + 12*KWIDTH,350*KWIDTH,21*KWIDTH);
        _signature.textColor = colorWithHexString(@"#999999");
        _signature.font = Font11;
        _signature.textAlignment = NSTextAlignmentLeft;
    }
    return _signature;
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        
        self.layer.cornerRadius = 10*KWIDTH;
        self.layer.masksToBounds= YES;
        //高100 100/2 - 66/2
        CGFloat W= 90*KWIDTH;
       // CGFloat Y = (CGRectGetMidY(self.frame)- W/2);
      //  CGFloat Y = (110*KWIDTH/2-W/2)/2;
        _headerImg =[[UIImageView alloc]initWithFrame:CGRectMake(30*KWIDTH,30*KWIDTH,W,W)];
        _userName = [[UILabel alloc]initWithFrame:CGRectMake(_headerImg.x+_headerImg.width + 20*KWIDTH, 46*KWIDTH,130*KWIDTH,50*KWIDTH)];
        [self addSubview: _headerImg];
        [self addSubview: _userName];
        _userName.font = Font14;
        _userName.textColor = colorWithHexString(@"#333333");
        
        // w 80 h 44
        self.BOOLConcerned = [[UIButton alloc]initWithFrame:RECT(540*KWIDTH , 53*KWIDTH, 120*KWIDTH,44*KWIDTH )];
       // self.BOOLConcerned.backgroundColor = color(181,213,190);
        // [self.BOOLConcerned addTarget:self action:@selector(ConAction:) forControlEvents:1 << 6];
        [self addSubview:self.BOOLConcerned];
        //[self.BOOLConcerned setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        self.BOOLConcerned.titleLabel.font = Font12;
        _BOOLConcerned.layer.cornerRadius = 22*KWIDTH;
        _BOOLConcerned.layer.masksToBounds = YES;
       // [self.BOOLConcerned setTitle:@"不关注" forState:0];
        [self.BOOLConcerned setTitle:@"不关注" forState:UIControlStateNormal];
      //  [self.BOOLConcerned setTitle:@"关注" forState:UIControlStateSelected];
        [self.BOOLConcerned setTitleColor:UIColor.whiteColor forState:0];
        _BOOLConcerned.tag = 10010;
        
        [self addSubview:self.signature];
        
        _BOOLConcerned.layer.borderWidth = 1;
        _BOOLConcerned.layer.borderColor = color(239,239,239).CGColor;
        [self.BOOLConcerned setTitleColor:colorWithHexString(@"#999999") forState:UIControlStateNormal];
        self.BOOLConcerned.backgroundColor = UIColor.whiteColor;
        [self.BOOLConcerned setTitle:@"不关注" forState:UIControlStateNormal];
    
    }
    return self;
}
-(void)ConAction:(UIButton *)con{
     self.selConcerbed();
    
}
-(void)click:block{
    
    
}
-(void)layoutSubviews
{
    
    [super layoutSubviews];
    
}
-(void)setBtnTitle:(NSString *)titleStr
{
  
    [_BOOLConcerned setTitle:titleStr forState:0];
   
}
-(NSString *)setHeaderImg:(NSString*)str userName:(NSString*)uN sig:(NSString*)s //serAuthentication:(NSString *)userA teacherDesc:(NSString*)tDS{
{
    self.headerImg.image = [UIImage imageNamed:str];
    _userName.text = uN;

    
    _signature.text = s;
    
    
    return str;
    return uN;

}

//设置cell距离左右的距离
- (void)setFrame:(CGRect)frame{
    CGFloat margin = 30*KWIDTH;
    frame.origin.x += margin;
    frame.size.width -= 2 * margin;
    [super setFrame:frame];
}




@end
