

#import "HeadPictureSubView.h"

@implementation HeadPictureSubView
-(UIImageView*)img{
    if(!_img){
        _img = [[UIImageView alloc]initWithFrame:RECT(67*KWIDTH,20*KWIDTH,42*KWIDTH,44*KWIDTH)];
       // _img.backgroundColor = UIColor.redColor;
    }
    return _img;
}
-(UILabel*)imgDesc
{
    if(!_imgDesc){
        _imgDesc = UILabel.new;
        //_imgDesc.backgroundColor = UIColor.yellowColor;
        _imgDesc.frame = RECT(41*KWIDTH,78*KWIDTH,95*KWIDTH,23*KWIDTH);
        _imgDesc.font = Font11;
        _imgDesc.textColor = colorWithHexString(@"#999999");
    }
    return _imgDesc;
}
-(UILabel*)numOfPeople
{
    if(!_numOfPeople){
        _numOfPeople = UILabel.new;
       // _numOfPeople.backgroundColor = UIColor.orangeColor;
        _numOfPeople.frame = RECT(247*KWIDTH,41*KWIDTH,40*KWIDTH,40*KWIDTH);
        _numOfPeople.textColor = colorWithHexString(@"#17A03D");
        _numOfPeople.textAlignment = NSTextAlignmentRight;
        _numOfPeople.font = Font14;
    }
    return _numOfPeople;
}
-(UILabel *)suffix
{
    if(!_suffix){
        _suffix = UILabel.new;
        _suffix.frame = RECT(_numOfPeople.x+_numOfPeople.width,_numOfPeople.height +_numOfPeople.y - 22*KWIDTH,90*KWIDTH,15*KWIDTH);
        _suffix.font = Font8;
        _suffix.textColor = color(105,156,101);
        _suffix.textAlignment = NSTextAlignmentLeft;
    }
    return _suffix;
    
    
    
    
}
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = colorWithHexString(@"#F3F6F1");
        [self addSubview:self.img];
        [self addSubview:self.imgDesc];
        [self addSubview:self.numOfPeople];
        self.layer.cornerRadius = 10*KWIDTH;
        self.layer.masksToBounds = YES;
        self.userInteractionEnabled = YES;
        [self addSubview:self.suffix];
        
        
    }
    return self;
}

-(void)setImgNamePath:(NSString*)imgN imgDescText:(NSString*)imgDT peopleNumbers:(NSString*)pn suffixText:(NSString*)sT{
    self.img.image = [UIImage imageNamed:imgN];
    self.imgDesc.text  = imgDT;
   // NSString *append = @"人";
    self.numOfPeople.text = pn;// [append stringByAppendingString:pn];
    self.suffix.text = sT;
}
-(void)setPeopleTag:(int)TAG{
    self.numOfPeople.tag = TAG;
}

@end
