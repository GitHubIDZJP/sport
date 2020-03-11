

#import "RotaryButton.h"

@implementation RotaryButton
-(UIImageView *)imgH
{
    if(!_imgH){
        _imgH = [[UIImageView alloc]init];
        _imgH.size = CGSizeMake(20*KWIDTH, 30*KWIDTH);
        //_imgH.backgroundColor = UIColor.redColor;
        _imgH.y= 0*KWIDTH;
        _imgH.x = 0;
       // _imgH.backgroundColor = UIColor.purpleColor;
    }return _imgH;
}
-(UILabel *)labelT
{
    if(!_labelT){
        _labelT = UILabel.new;
        _labelT.size = CGSizeMake(95*KWIDTH, 30*KWIDTH);
        _labelT.y =  0*KWIDTH;
        _labelT.x =_imgH.width + _imgH.x + 20*KWIDTH;
        _labelT.font =Font11;
        _labelT.textColor = colorWithHexString(@"#999999");
        //_labelT.backgroundColor = UIColor.redColor;
    }return _labelT;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        
        [self addSubview:self.labelT];
        [self addSubview:self.imgH];
        
    }
    return self;
}

-(void)setRotaryBtnImgPath:(NSString*)imgPath labelText:(NSString*)lText{
   
    self.imgH.image = [UIImage imageNamed:imgPath];
    self.labelT.text = lText;
    
    
    
  
    
}
-(void)changeLabelCoordinateX:(CGFloat)LabelXValue imgHCoordinateX:(CGFloat)imgaeViewXValue{
    self.imgH.x = imgaeViewXValue;
    self.labelT.x = LabelXValue;
}
@end
