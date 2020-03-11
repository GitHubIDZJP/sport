//
//  articleVCCell.m
//  Sports
//
//  Created by test on 2020/1/8.
//  Copyright © 2020 test. All rights reserved.
//

#import "articleVCCell.h"
/*
 @property(nonatomic,strong)UILabel *versonLabel;
 @property(nonatomic,strong)UILabel *versionDescLabel;
 @property(nonatomic,strong)UILabel *skimLabel;
 */
@implementation articleVCCell  //70
-(UILabel *)versonLabel{
    
    if(!_versonLabel){
        _versonLabel = [[UILabel alloc]init];
        _versonLabel.frame  = RECT(30*KWIDTH,28*KWIDTH,SCREEN_WIDTH,27*KWIDTH);
        _versonLabel.font  = Font14;
    }
    return _versonLabel;
}
-(UILabel *)versionDescLabel{
    
    if(!_versionDescLabel){
        _versionDescLabel = [[UILabel alloc]init];
        _versionDescLabel.frame  = RECT(_versonLabel.x,_versonLabel.height + _versonLabel.y + 16*KWIDTH,_versonLabel.width,24*KWIDTH);
        _versionDescLabel.font  =Font12;
        _versionDescLabel.textColor = colorWithHexString(@"#666666");
    }
    return _versionDescLabel;
}
-(UILabel *)skimLabel{
    
    if(!_skimLabel){
        _skimLabel = [[UILabel alloc]init];
        _skimLabel.frame  = RECT(_versonLabel.x,_versionDescLabel.y + _versionDescLabel.height + 22*KWIDTH,300*KWIDTH,14*KWIDTH);
        _skimLabel.font = Font9;
        _skimLabel.textColor = colorWithHexString(@"#999999");
    }
    return _skimLabel;
}
/*
 //按钮1  点赞(夸奖)compliment
 @property(nonatomic,strong)UIButton *complimentBtn;
 //label1
 @property(nonatomic,strong)UILabel *complimentLabel;
 //按钮2  浏览browse
 @property(nonatomic,strong)UIButton *browseBtn;
 //label2
 @property(nonatomic,strong)UILabel *browseLabel;
 */
-(UIButton*)complimentBtn
{
    if(!_complimentBtn){
        _complimentBtn = UIButton.new;
        _complimentBtn.frame = RECT(567*KWIDTH, _skimLabel.height +  _skimLabel.y -14*KWIDTH ,20*KWIDTH,22*KWIDTH);
        [_complimentBtn setBackgroundImage:[UIImage imageNamed:@"点赞@2x"] forState:UIControlStateNormal];
       // _complimentBtn.backgroundColor = UIColor.redColor;
        
        
        
    }
    return _complimentBtn;
    
}
-(UILabel*)complimentLabel
{
    if(!_complimentLabel){
        _complimentLabel = UILabel.new;;
        _complimentLabel.frame = RECT(595*KWIDTH, _skimLabel.height +  _skimLabel.y-8*KWIDTH ,40*KWIDTH ,14*KWIDTH );
       // _complimentLabel.backgroundColor = UIColor.orangeColor;
        _complimentLabel.text = @"888";
        _complimentLabel.textColor = colorWithHexString(@"#999999");
        _complimentLabel.font  = Font10;
        
    }
    return _complimentLabel;
    
}
-(UIButton*)browseBtn
{
    if(!_browseBtn){
        _browseBtn = UIButton.new;
        _browseBtn.frame = RECT(658*KWIDTH, _skimLabel.height +  _skimLabel.y-8*KWIDTH,20*KWIDTH,16*KWIDTH);
        [_browseBtn setBackgroundImage:[UIImage imageNamed:@"评论@2x"] forState:UIControlStateNormal];
       // _browseBtn.backgroundColor = UIColor.purpleColor;
        
    }
    return _browseBtn;
    
}

-(UILabel*)browseLabel
{
    if(!_browseLabel){
        _browseLabel = UILabel.new;
        _browseLabel.frame = RECT(688*KWIDTH, _skimLabel.height +  _skimLabel.y-8*KWIDTH ,40*KWIDTH ,14*KWIDTH );
       // _browseLabel.backgroundColor = UIColor.redColor;
        _browseLabel.text = @"888";
        _browseLabel.font  = Font10;
        _browseLabel.textColor = colorWithHexString(@"#999999");
    }
    return _browseLabel;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addSubview:self.versonLabel];
        [self addSubview:self.versionDescLabel];
        [self addSubview:self.skimLabel];
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if([obj isKindOfClass:[UILabel class]])
            {
                obj.backgroundColor = UIColor.clearColor;
            }
        }];
        
        //加载新加的4个控件
        
        [self addSubview:self.complimentBtn];
        [self addSubview:self.complimentLabel];
        [self addSubview:self.browseBtn];
        [self addSubview:self.browseLabel];
    }
    return self;
}
-(void)getVersonText:(NSString*)vt versonDescText:(NSString*)vdt skimText:(NSString*)st{
    self.versonLabel.text = vt;
    self.versionDescLabel.text = vdt;
    self.skimLabel.text  =  st;
    
}
@end
