//
//  dataTableCell.m
//  Sports
//
//  Created by test on 2020/1/10.
//  Copyright © 2020 test. All rights reserved.
//

#import "dataTableCell.h"



@implementation dataTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(UILabel*)bootText
{
    if(!_bootText)
    {
        _bootText = UILabel.new;
        _bootText.frame = CGRectMake(32*KWIDTH,35*KWIDTH,30*KWIDTH,30*KWIDTH);
       // _bootText.backgroundColor = UIColor.redColor;
        _bootText.textAlignment= NSTextAlignmentCenter;
        _bootText.font = Font12;
        //_bootText.layer.cornerRadius
       // _bootText.layer.masksToBounds = 
    }
    return _bootText;
    
    
}

-(UIImageView *)ballImage
{
    if(!_ballImage){
        _ballImage = [[UIImageView alloc]initWithFrame:RECT(77*KWIDTH,33*KWIDTH,36*KWIDTH,36*KWIDTH)];
       // _ballImage.backgroundColor = UIColor.purpleColor;
    }
    return _ballImage;
}
-(UILabel *)ballName{
    if(!_ballName){
        _ballName = UILabel.new;
        _ballName.frame = CGRectMake(121*KWIDTH,38*KWIDTH,100*KWIDTH,23*KWIDTH);
        _ballName.font  = Font12;
        //_ballName.backgroundColor = UIColor.greenColor;
    }
    return _ballName;
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
        
       /*
        [self addSubview:self.tit];
        [self addSubview:self.imgP];
        [self addSubview:self.tex];
        [self addSubview:self.tNumber];
        
        */
        [self addSubview:self.bootText];
        [self addSubview:self.ballName];
        [self addSubview:self.ballImage];
        
      
        
        
        
    }
    return self;
}
-(void)setBootTextBGColor:(UIColor*)color{
    self.bootText.backgroundColor = color;
   
}
-(void)setBootTextTextColor:(UIColor*)tC{
     self.bootText.textColor = tC;
}
-(void)setBootTextCornerRadius:(CGFloat)btcr{
    self.bootText.layer.cornerRadius = btcr;
}
-(void)setMaskToBounds:(BOOL)mtb{
    self.bootText.layer.masksToBounds = mtb;
}
-(void)setBootTextStr:(NSString*)btStr{
    self.bootText.text = btStr;
}

-(void)initDataLabel:(NSArray*)dataLabelArray{
  
    for(int i = 0;i< dataLabelArray.count;i++){
        self.data = [[UILabel alloc]init];
        self.data.frame = CGRectMake(332*KWIDTH + (SCREEN_WIDTH - 332*KWIDTH)/8.0*(i%8) ,40*KWIDTH,36*KWIDTH,19*KWIDTH);
        self.data.text = [NSString stringWithFormat:@"%@",dataLabelArray[i]];
        //self.data.backgroundColor = [UIColor redColor];
        self.data.textAlignment = NSTextAlignmentCenter;
        self.data.font = Font12;
          [self addSubview:self.data];
        
    }
}
-(void)setDataLabelTextArray:(NSArray*)dataLabelArray{
    
    [self initDataLabel:dataLabelArray];
}







-(void)getBallImageName:(NSString*)bIMG BallNameText:(NSString*)bnT{
    self.ballImage.image = [UIImage imageNamed:bIMG];
    self.ballName.text  = bnT;
    
    
}
@end
