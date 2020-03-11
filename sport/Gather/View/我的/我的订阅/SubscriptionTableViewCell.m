//
//  SubscriptionTableViewCell.m
//  Sports
//
//  Created by test on 2020/1/4.
//  Copyright © 2020 test. All rights reserved.
//

#import "SubscriptionTableViewCell.h"
@interface SubscriptionTableViewCell()
@property (nonatomic,weak) UIImageView *headerPic;
@property (nonatomic,weak) UILabel *vipContent;
@property (nonatomic,weak) UILabel *vipMT;
@property (nonatomic,weak) UILabel *vipStopTime;
@property (nonatomic,weak) UILabel *timeStopHint;//到期时间文本提示

@end
@implementation SubscriptionTableViewCell

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
        //self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initChildViews];
       // self.backgroundColor = [UIColor yellowColor];
        self.layer.cornerRadius = 10*KWIDTH;
        self.layer.masksToBounds = YES;
    }
    return self;
}
-(void)layoutSubviews
{
    
    [super layoutSubviews];
}
-(void)initChildViews{
    
    /*
     头像
     vip
     vip时间
     VIP截止时间
     */
  UIImageView *vipPic = getImgView(RECT(30*KWIDTH,23*KWIDTH,74*KWIDTH,74*KWIDTH), UIViewContentModeScaleToFill);
    self.headerPic = vipPic;
    [self addSubview:self.headerPic];
    
    
    
    UILabel *vip = UILabel.new;
    _vipContent= vip;
    [self addSubview:self.vipContent];
    
    
    UILabel *vipTime =UILabel.new;
    self.vipMT = vipTime;
    [self addSubview:self.vipMT];
    
    UILabel *memberStopTime = UILabel.new;
    self.vipStopTime = memberStopTime;
    [self addSubview:self.vipStopTime];
    
    UILabel *timeStop = UILabel.new;
    self.timeStopHint = timeStop;
    [self addSubview:self.timeStopHint];
    
    
    
    
    
    
    
//
//    self.headerPic.backgroundColor = [UIColor purpleColor];
//    self.vipContent.backgroundColor = [UIColor redColor];
//    self.vipMT.backgroundColor= [UIColor grayColor];
//    self.vipStopTime.backgroundColor = [UIColor blueColor];
//    self.timeStopHint.backgroundColor = UIColor.redColor;
    
    
    [self.vipContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(248*KWIDTH);
        make.height.mas_equalTo(20*KWIDTH);
        make.left.mas_equalTo(self).offset(117*KWIDTH);
        make.top.equalTo(@(32*KWIDTH));
    }];
    
    [self.vipMT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(268*KWIDTH);
        make.height.mas_equalTo(26*KWIDTH);
        make.left.mas_equalTo(self.vipContent);
        make.top.equalTo(@(70*KWIDTH));
  
   
    }];
    //2011年一月到期
    [self.vipStopTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(164*KWIDTH);
        make.height.mas_equalTo(26*KWIDTH);
        make.left.mas_equalTo(495*KWIDTH);
        make.top.equalTo(@(70*KWIDTH));
    }];
    //到期时间:
    [self.timeStopHint mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(164*KWIDTH);
        make.height.mas_equalTo(55*KWIDTH);
        make.left.mas_equalTo(495*KWIDTH);
        make.top.equalTo(@(20*KWIDTH));
    }];
    
    self.timeStopHint.textAlignment = NSTextAlignmentRight;
    //
//    self.vipStopTime.backgroundColor =UIColor.purpleColor;
    
    
    
    self.vipContent.font = Font14;
    self.vipMT.font = Font10;
    self.vipStopTime.font = self.vipMT.font;
    self.timeStopHint.font  = Font11;
    
    self.vipContent.textColor= colorWithHexString(@"#333333");
    self.vipMT.textColor = colorWithHexString(@"#999999");
    self.vipStopTime.textColor = self.vipMT.textColor;
    self.vipStopTime.numberOfLines = 0;
    
    self.timeStopHint.textAlignment = NSTextAlignmentRight;
    self.vipStopTime.textAlignment = NSTextAlignmentRight;
    self.timeStopHint.textColor = colorWithHexString(@"#999999");
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
-(void)setSModel:(SubscriptionMode *)sModel
{
    _sModel = sModel;
    self.headerPic.image = [UIImage imageNamed:_sModel.headPortrait];
    self.vipContent.text = _sModel.members;
    self.vipMT.text = _sModel.memberLength;
    self.vipStopTime.text =_sModel.currentTime;
    self.timeStopHint.text = sModel.TimeStopHint;
    
    
 
    
    
}
//设置cell距离左右的距离
- (void)setFrame:(CGRect)frame{
    CGFloat margin = 30*KWIDTH;
    frame.origin.x += margin;
    frame.size.width -= 2 * margin;
    [super setFrame:frame];
}
@end
