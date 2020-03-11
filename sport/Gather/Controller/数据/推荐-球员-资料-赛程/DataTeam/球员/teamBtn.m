//
//  teamBtn.m
//  Sports
//
//  Created by test on 2020/1/18.
//  Copyright © 2020 test. All rights reserved.
//

#import "teamBtn.h"

@implementation teamBtn


-(UIImageView*)img
{
    if(!_img)
    {
        _img  = UIImageView.new;
        _img.frame  = RECT(20*KWIDTH,20*KWIDTH,50*KWIDTH,50*KWIDTH);
        //_img.backgroundColor = UIColor.redColor;
        
        
        
    }
    return _img;
    
    
}
-(UILabel*)ballName
{
    if(!_ballName){
        _ballName = UILabel.new;
        _ballName.frame = RECT(_img.x + _img.width + 21*KWIDTH,33*KWIDTH,115*KWIDTH,23*KWIDTH);
        _ballName.textColor  = colorWithHexString(@"#333333");
        _ballName.font = Font14;
        
    }
    return _ballName;
    
    
}
-(UILabel *)ballNumber
{
    
    if(!_ballNumber){
        _ballNumber = UILabel.new;
        _ballNumber.frame   = RECT(270*KWIDTH,24*KWIDTH,40*KWIDTH,40*KWIDTH);
        _ballNumber.backgroundColor = colorWithHexString(@"#F5F6F5");
        _ballNumber.layer.cornerRadius = _ballNumber.width/2;
        _ballNumber.layer.masksToBounds = true;
        _ballNumber.textAlignment = NSTextAlignmentCenter;
        _ballNumber.font = Font8;
        _ballNumber.textColor = UIColor.redColor;
        
    }
    return _ballNumber;
    
}
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self addSubview:self.img];
        [self addSubview:self.ballName];
        [self addSubview:self.ballNumber];
        
        
        
    }
    return self;
    
}



-(void)ballImgNmae:(NSString*)iName ballName:(NSString*)bN nNmmber:(NSString*)ballName{
    
    self.img.image = [UIImage imageNamed:iName];
    self.ballName.text = bN;
    self.ballNumber.text =ballName;
    
    
    
    
    
    
}
    
@end
