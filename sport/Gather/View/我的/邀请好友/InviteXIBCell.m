//
//  InviteXIBCell.m
//  Sports
//
//  Created by test on 2020/1/20.
//  Copyright © 2020 test. All rights reserved.
//

#import "InviteXIBCell.h"
#define w (SCREEN_WIDTH- 60*KWIDTH)/3
#define y 20*KWIDTH
#define h 22*KWIDTH
@implementation InviteXIBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
//+(CGFloat)w{
//  //   = (SCREEN_WIDTH- 60*KWIDTH)/3;
//}
-(UILabel *)userName
{
    if(!_userName){
        _userName = UILabel.new;
        _userName.frame = RECT(0,y,w,h);
        //_userName.backgroundColor = UIColor.redColor;
        _userName.textAlignment = NSTextAlignmentCenter;
        _userName.font = Font12;
    }
    return _userName;
}
-(UILabel *)registrationDate
{
    if(!_registrationDate){
        _registrationDate=UILabel.new;
         _registrationDate.frame = RECT(w,y,w,h);
        //_registrationDate.backgroundColor = UIColor.purpleColor;
        _registrationDate.textAlignment = NSTextAlignmentCenter;
        _registrationDate.font = Font12;
       
    }
    return _registrationDate;
}
-(UILabel *)rewardAmount
{
    if(!_rewardAmount){
        
        _rewardAmount= UILabel.new;
        _rewardAmount.frame = RECT(2*w,y,w,h);
       // _rewardAmount.backgroundColor = UIColor.yellowColor;
        _rewardAmount.textAlignment = NSTextAlignmentCenter;
        _rewardAmount.font = Font12;
    }
    return _rewardAmount;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //self.backgroundColor = UIColor.purpleColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubview:self.userName];
        [self addSubview:self.registrationDate];
        [self addSubview:self.rewardAmount];
    }
    return self;
    
}
//设置cell距离左右的距离
- (void)setFrame:(CGRect)frame{
    CGFloat margin = 30*KWIDTH;
    frame.origin.x += margin;
    frame.size.width -= 2 * margin;
    [super setFrame:frame];
}
-(void)userName:(NSString*)sn registrationDate:(NSString*)rd rewardAmount:(NSString*)ra{
    
    self.userName.text = sn;
    self.registrationDate.text = rd;
    self.rewardAmount.text =  ra;
    
    
}
-(void)setUserNameTextColor:(UIColor *)tc{
    self.userName.textColor = tc;
    
}
-(void)setRegistrationDateTextColor:(UIColor *)RD{
    self.registrationDate.textColor =  RD;
}
-(void)setRewardAmountTextColor:(UIColor *)RA{
    self.rewardAmount.textColor = RA;
}
-(void)setFontWeight:(UIFont*)f OrFontSize:(CGFloat)fs{
    self.userName.font = [UIFont fontWithName:f size:fs];
}
@end
