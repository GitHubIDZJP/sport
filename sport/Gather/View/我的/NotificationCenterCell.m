//
//  NotificationCenterCell.m
//  Sports
//
//  Created by test on 2020/1/7.
//  Copyright © 2020 test. All rights reserved.
//

#import "NotificationCenterCell.h"

@implementation NotificationCenterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
/*
-(UILabel*)currentTime
{
    if(!_currentTime){
        _currentTime = UILabel.new;
        _currentTime.frame = RECT(self.width/2 - 208*KWIDTH/2,50*KWIDTH, 208*KWIDTH,16*KWIDTH);
        _currentTime.textColor  = colorWithHexString(@"#999999");
        _currentTime.textAlignment = NSTextAlignmentCenter;
        
    }
    return _currentTime;
}
 */
//-(UIView *)cellView{
//    if(!_cellView){
//        _cellView = UIView.new;
//        _cellView.backgroundColor = White;
//        _cellView.layer.cornerRadius = 10*KWIDTH;
//        _cellView.layer.masksToBounds = YES;
//        _cellView.backgroundColor = UIColor.redColor;
//     //   CGFloat headerTitle = 50*KWIDTH;
//        _cellView.frame = RECT(30*KWIDTH,100*KWIDTH,self.width,self.height);
//
//
//
//
//
//
//
//    }
//    return _cellView;
//}

-(UILabel*)TextNoti
{
    
    //国台办:
    if(!_TextNoti){
        _TextNoti = UILabel.new;
        _TextNoti.frame = RECT(32*KWIDTH,29*KWIDTH,self.width+120*KWIDTH,27*KWIDTH);
        _TextNoti.textColor = colorWithHexString(@"#333333");
        _TextNoti.font = Font14;
        _TextNoti.textColor = colorWithHexString(@"#333333");
        
        
        
    }
    return _TextNoti;
}
-(UILabel*)redPackets
{
    
    //海外网
    if(!_redPackets){
        _redPackets = UILabel.new;
        _redPackets.frame = RECT(_TextNoti.x,_TextNoti.y + _TextNoti.height + 20*KWIDTH,self.width,24*KWIDTH);
        _redPackets.textColor = colorWithHexString(@"#666666");
        //_redPackets.backgroundColor = [UIColor redColor];
        _redPackets.font = Font12;
    }
    return _redPackets;
}
-(UIImageView*)VariableHead
{
    
    if(!_VariableHead){
        _VariableHead = UIImageView.new;
        _VariableHead.frame = RECT(31*KWIDTH,_redPackets.y + _redPackets.height + 19*KWIDTH,self.width+ 100*KWIDTH ,148*KWIDTH);
         //_VariableHead.backgroundColor = [UIColor purpleColor];
    }
    return _VariableHead;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
        
        self.backgroundColor = UIColor.whiteColor;
        self.layer.cornerRadius = 5.0f;
        self.layer.masksToBounds = YES;
     
       // [self addSubview:self.cellView];
        
         [self addSubview:self.TextNoti];
        [self addSubview:self.redPackets];
        [self addSubview:self.VariableHead];
      //  [self addSubview:self.currentTime];
       
      
        
     /*
         currentTime;//当前时间
         VariableHead;//头像
         TextNoti;//文字通知
         redPackets;// 红包数
         */
        
    
        
        
//        _redPackets.backgroundColor = UIColor.redColor;
//        _TextNoti.backgroundColor = UIColor.purpleColor;
    }
    return self;
}
     


-(Boolean)imgHidden:(Boolean)hide{
    self.VariableHead.hidden = hide;
    return hide;
}

-(void)setTextNotiFrame:(CGFloat)x{
    
    CGRect frame = _TextNoti.frame;
    frame.origin.x -=x;
   // frame.origin.y -=frameY;
   // frame.size.width +=frameW;
   // frame.size.height +=frameH;
    _TextNoti.frame = frame;
    
  //  _TextNoti.frame.origin.x = x;
   
    

}


-(void)setFrame:(CGRect)frame
{
    frame.origin.x += spaceLeft;
    frame.size.width -= frame.origin.x *2;
    
    [super setFrame:frame];
}

//-(void)setCurrentTimeContext:(NSString*)CT VariableHead:(NSString*)imgUrl TextNoti:(NSString*)TN  redPackets:(NSString*)rP{
-(void)setVariableHead:(NSString*)imgUrl TextNoti:(NSString*)TN  redPackets:(NSString*)rP
{
   // _currentTime.text = CT;
    _VariableHead.image =[UIImage imageNamed:imgUrl];
    _TextNoti.text = TN;
    _redPackets.text = rP;
    
    
    
    
    
}
@end
