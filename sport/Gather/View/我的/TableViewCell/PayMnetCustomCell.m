//
//  PayMnetCustomCell.m
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/15.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "PayMnetCustomCell.h"

@implementation PayMnetCustomCell
{
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //创建成功则t给cell添加需要的子视图
           titleLabel = [[UILabel alloc] init];
           [self.contentView addSubview:titleLabel];
        
           iconView = [[UIImageView alloc] init];
           [self.contentView addSubview:iconView];
       
        
            selectBtn = [[UIButton  alloc]init];
            [self.contentView addSubview:selectBtn];
        
        
        
    }
    
    return self;
    
}

- (void)layoutSubviews{
     [super layoutSubviews ];
    iconView.frame = CGRectMake(69*KWIDTH,30*KWIDTH,40*KWIDTH,40*KWIDTH);
    iconView.layer.masksToBounds = YES;
    iconView.layer.cornerRadius = 4;
    
    titleLabel.frame = CGRectMake(iconView.frame.origin.x+iconView.frame.size.width+ 45*KWIDTH,iconView.frame.origin.y,238*KWIDTH,27*KWIDTH);
    CGFloat btnW = 42*KWIDTH;
    CGFloat SP = 24*KWIDTH;
    CGFloat btnY = self.bounds.size.height/2-btnW/2;
    selectBtn.frame = RECT(self.bounds.size.width-btnW-SP,btnY,btnW,btnW );
    

}
-(void)setIconViewImg:(NSString *)iconImg andTitleLabelText:(NSString*)text{
    iconView.image = [UIImage imageNamed:iconImg];
    titleLabel.text = text;
    
}
-(void)setBtnIcon:(NSString*)img{
    
    [selectBtn setBackgroundImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    
}
-(void)setIconViewImg:(NSString *)iconImg{

    iconView.image = [UIImage imageNamed:iconImg];
}
//-(vopid)setTitleLabelText:(NSString*)text{
//
//    
//}

//设置cell距离左右的距离
- (void)setFrame:(CGRect)frame{
    CGFloat margin = 30*KWIDTH;
    frame.origin.x += margin;
    frame.size.width -= 2 * margin;
    [super setFrame:frame];
    
}

@end
