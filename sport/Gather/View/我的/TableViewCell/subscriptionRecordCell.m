//
//  subscriptionRecordCell.m
//  Sports
//
//  Created by test on 2020/1/6.
//  Copyright © 2020 test. All rights reserved.
//

#import "subscriptionRecordCell.h"

@implementation subscriptionRecordCell

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
       // [self initChildViews];
        
        
       
        
        _Record = [[UILabel alloc]init];
        _money = [[UILabel alloc]init];
        _time = [[UILabel alloc]init];
        
        _Record.frame = RECT(41*KWIDTH,20*KWIDTH,62*KWIDTH,24*KWIDTH);
        _time.frame = RECT(_Record.x,_Record.height + _Record.y + 17*KWIDTH,185*KWIDTH,16*KWIDTH);
        _money.frame = RECT(565*KWIDTH, 20*KWIDTH ,96*KWIDTH,20*KWIDTH);
        
        //set Attribute style
        _Record.textColor = colorWithHexString(@"#333333");
        _time.textColor = colorWithHexString(@"#999999");
        _money.textColor = colorWithHexString(@"#FF3434");
        
        
        _Record.font = [UIFont systemFontOfSize:13];
        _time.font =[UIFont systemFontOfSize:10];
        _money.font = _Record.font;
        
        [self addSubview:_Record];
        [self addSubview:_money];
        [self addSubview:_time];
    }
    return self;
}
-(void)setModel:(subscriptionRecordModel *)model
{
    _model= model;
    
    self.Record.text = model.RecordStr;
    self.money.text = model.moneyStr;
    self.time.text = model.timeStr;
}
- (void)setFrame:(CGRect)frame{
    CGFloat margin = 30*KWIDTH;
    frame.origin.x += margin;
    frame.size.width -= 2 * margin;
    [super setFrame:frame];
}
@end
