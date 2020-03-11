//
//  userRecommendedCell.m
//  Sports
//
//  Created by test on 2020/1/8.
//  Copyright © 2020 test. All rights reserved.
//

#import "userRecommendedCell.h"

@implementation userRecommendedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(UILabel *)tweet{
    
    if(!_tweet){
        _tweet = [[UILabel alloc]init];
        _tweet.frame  = RECT(30*KWIDTH,35*KWIDTH,self.width,27*KWIDTH);
        _tweet.font  = Font14;
        _tweet.textColor = colorWithHexString(@"#333333");
    }
    return _tweet;
}
-(UILabel*)line
{
    
    if(!_line){
        
        _line = [[UILabel alloc]init];
        _line.frame = RECT(0,82*KWIDTH,630*KWIDTH,10*KWIDTH);
      //  _line.backgroundColor = colorWithHexString(@"#DDDDDD");
        _line.backgroundColor = UIColor.redColor;
    }
    return _line;
}
-(UILabel *)timer{
    
    if(!_timer){
        _timer = [[UILabel alloc]init];
        _timer.frame  = RECT(_tweet.x,_tweet.height + _tweet.y + 31*KWIDTH,self.width,16*KWIDTH);
        _timer.font  = Font10;
        _timer.textColor = colorWithHexString(@"#999999");
    }
    return _timer;
}
-(UIButton*)thumbsUp{
    if(!_thumbsUp){
//        _thumbsUp = [[statusBtn alloc]init];
//        _thumbsUp.frame = CGRectMake(200,10,70,40);
       // _thumbsUp.backgroundColor = UIColor.purpleColor;
        
    }
    return _thumbsUp;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.layer.cornerRadius = 10*KWIDTH;
        self.layer.masksToBounds = YES;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        [self addSubview:self.tweet];
        [self addSubview:self.timer];
        [self addSubview:self.line];
        _thumbsUp = [[statusBtn alloc]init];
        _thumbsUp.frame = CGRectMake(550*KWIDTH,self.height - 40*KWIDTH,70,40*KWIDTH);
       // _thumbsUp.backgroundColor = [UIColor redColor];
        [self addSubview:self.thumbsUp];
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if([obj isKindOfClass:[UILabel class]])
            {
                obj.backgroundColor = UIColor.clearColor;
            }
        }];
        
        /////
        
        
        self.clickBtn = (UIButton *)[self.thumbsUp viewWithTag:100];
        self.addLabel = (UILabel *)[self.thumbsUp viewWithTag:101];
        
    }
    return self;
}
-(void)clickAdd:(UIButton*)change{
    self.myBlock();
}
-(void)setclickAddCurrentValuebackgroundImage:(NSString*)imgName currentLabelText:(NSString*)currentText{
    [self.clickBtn setBackgroundImage:[UIImage imageNamed:imgName] forState:normal];
    self.addLabel.text = currentText;
    
}
-(void)getTweetText:(NSString *)tt timerStr:(NSString *)ts{
    self.tweet.text = tt;
    self.timer.text = ts;
}
//设置cell距离左右的距离
- (void)setFrame:(CGRect)frame{
    CGFloat margin = 30*KWIDTH;
    frame.origin.x += margin;
    frame.size.width -= 2 * margin;
    [super setFrame:frame];
}
@end
