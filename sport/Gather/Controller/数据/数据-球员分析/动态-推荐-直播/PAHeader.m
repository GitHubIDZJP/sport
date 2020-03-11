//
//  PAHeader.m
//  Sports
//
//  Created by test on 2020/1/13.
//  Copyright © 2020 test. All rights reserved.
//

#import "PAHeader.h"

@implementation PAHeader

/*
 
 @property(nonatomic,strong)UIButton *LB;
 @property(nonatomic,strong)UIButton *interestB;
 @property(nonatomic,strong)UILabel *ballplayerName;
 @property(nonatomic,strong)UILabel *bCountry;
 @property(nonatomic,strong)UILabel *bCity;
 @property(nonatomic,strong)UILabel *bInfo;
 @property(nonatomic,strong)UILabel *fansCount;
 @property(nonatomic,strong)UILabel *fansTitle;
 @property(nonatomic,strong)UILabel *bPrice;
 @property(nonatomic,strong)UILabel *bPriceHint;
 @property(nonatomic,strong)UIImageView *bHeaderPic;

 
 */
-(UIImageView *)bgImg
{if(!_bgImg){
    _bgImg =  UIImageView.new;
    
   // _bgImg.image = [UIImage imageNamed:@"Image 拷贝@2x"];
    _bgImg.frame = CGRectMake(0,0,self.width,self.height);
    _bgImg.image = [UIImage imageNamed:@"Image 拷贝@2x"];
    
}
    return _bgImg;
    
    
    
    
    
    
    
}
-(UIButton*)LB{
    
    if(!_LB){
        _LB = [[UIButton alloc]initWithFrame:CGRectMake(30*KWIDTH,73*KWIDTH, 20*KWIDTH,34*KWIDTH)];
        _LB.hitScale = 6;
       [_LB setBackgroundImage:[UIImage imageNamed:@"数据返回"] forState:0];
        [_LB addTarget:self action:@selector(click:) forControlEvents:1 << 6];
     //  _LB.backgroundColor = UIColor.redColor;
        
    }
    return _LB;
}
-(UIButton*)interestB
{
    if(!_interestB){
        _interestB = [[UIButton alloc]initWithFrame:CGRectMake(620*KWIDTH,70*KWIDTH,100*KWIDTH,36*KWIDTH)];
        [_interestB setTitle:@"关注" forState:0];
        _interestB.backgroundColor = UIColor.whiteColor;
        //_interestB.titleLabel.textColor
        [_interestB setTitleColor:color(132, 186, 86) forState:0];
          [_interestB addTarget:self action:@selector(interestBtn:) forControlEvents:1 << 6];
        _interestB.layer.cornerRadius = 18*KWIDTH;
        _interestB.layer.masksToBounds = YES;
        _interestB.titleLabel.font = Font12;
        
    }
    return _interestB;
    
}
-(UILabel *)ballplayerName
{
    if(!_ballplayerName){
        _ballplayerName= UILabel.new;
        _ballplayerName.frame = CGRectMake(45*KWIDTH,135*KWIDTH,117*KWIDTH,39*KWIDTH);
        _ballplayerName.text = @"瓦尔迪";
        _ballplayerName.font = Font16;
        _ballplayerName.textColor= UIColor.whiteColor;
    }
    return _ballplayerName;
}
-(UIImageView *)bCountry
{
    if(!_bCountry){
        _bCountry= UIImageView.new;
        _bCountry.frame = CGRectMake(_ballplayerName.x + _ballplayerName.width + 0*KWIDTH,_ballplayerName.y+ 10*KWIDTH,42*KWIDTH,30*KWIDTH);
        _bCountry.image = [UIImage imageNamed:@"图层 1"];
     //   _bCountry.textColor= colorWithHexString(@"#4CB13B");
    
       // _bCountry.backgroundColor = UIColor.purpleColor;
        
    }
    return _bCountry;
}
-(UILabel *)bCity
{
    if(!_bCity){
        _bCity= UILabel.new;
        _bCity.frame = CGRectMake(29*KWIDTH,_ballplayerName.y + _ballplayerName
                                .height + 5*KWIDTH,120*KWIDTH,34*KWIDTH);
       
        _bCity.font = Font11;
        _bCity.text = @"莱斯特城";
        _bCity.textColor= colorWithHexString(@"#4CB13B");
        //_bCity.backgroundColor = UIColor.redColor;
        _bCity.backgroundColor = UIColor.whiteColor;
        _bCity.textAlignment = NSTextAlignmentCenter;
        _bCity.layer.cornerRadius = 17*KWIDTH;
        _bCity.layer.masksToBounds = YES;
    }
    return _bCity;
}
-(UILabel *)bInfo
{
    if(!_bInfo){
        _bInfo= UILabel.new;
        _bInfo.frame = CGRectMake(_bCity.width + _bCity.x + 10*KWIDTH,_bCity.y,300*KWIDTH,24*KWIDTH);
        
        _bInfo.font = Font11;
        _bInfo.text = @"前锋 / 33岁 / 179cm / 74kg";
        _bInfo.textColor= UIColor.whiteColor;//colorWithHexString(@"#4CB13B");
        //_bInfo.backgroundColor = UIColor.yellowColor;
        
    }
    return _bInfo;
}
-(UILabel *)fansCount
{

    if(!_fansCount){
        _fansCount= UILabel.new;
        _fansCount.frame = CGRectMake(44*KWIDTH,_bCity.height + _bCity.y+ 10*KWIDTH,46*KWIDTH,23*KWIDTH);
      
        _fansCount.font = Font11;
        _fansCount.text = @"581";
        
        
        _fansCount.textColor= UIColor.whiteColor;//colorWithHexString(@"#4CB13B");
        //_fansCount.backgroundColor = UIColor.purpleColor;
    }
    return _fansCount;
}
-(UILabel *)fansTitle
{
    
    if(!_fansTitle){
        _fansTitle= UILabel.new;
        _fansTitle.frame = CGRectMake(_fansCount.x,_fansCount.y + _fansTitle.height + 30*KWIDTH,_fansCount.width,_fansCount.height);
        _fansTitle.text = @"粉丝";
        _fansTitle.font = Font11;
        _fansTitle.textColor= UIColor.whiteColor;//colorWithHexString(@"#4CB13B");
        //_fansTitle.backgroundColor = UIColor.grayColor;
    }
    return _fansTitle;
}
-(UILabel *)bPrice
{
    if(!_bPrice){
        _bPrice= UILabel.new;
        _bPrice.frame = CGRectMake(218*KWIDTH,_fansCount.y,159*KWIDTH,29*KWIDTH);
        _bPrice.text = @"20000万欧元";
        _bPrice.font = Font11;
        _bPrice.textColor= UIColor.whiteColor;//colorWithHexString(@"#4CB13B");
        //_bPrice.backgroundColor = UIColor.grayColor;
    }
    return _bPrice;
}
-(UILabel *)bPriceHint
{
    
    if(!_bPriceHint){
        _bPriceHint= UILabel.new;
        _bPriceHint.frame = CGRectMake(_bPrice.x, _fansTitle.y, 46*KWIDTH, 23*KWIDTH);
        _bPriceHint.text = @"身价";
        _bPriceHint.font = Font11;
        _bPriceHint.textColor= UIColor.whiteColor;//colorWithHexString(@"#4CB13B");
        //_bPriceHint.backgroundColor = UIColor.redColor;
    }
    return _bPriceHint;
}

-(UIImageView *)bHeaderPic{
    
    if(!_bHeaderPic){
        _bHeaderPic = UIImageView.new;
        _bHeaderPic.frame = RECT(569*KWIDTH,153*KWIDTH,150*KWIDTH,150*KWIDTH);
        _bHeaderPic.image = [UIImage imageNamed:@"0b46f21fbe096b63c86d919602338744eaf8ac84 拷贝@2x"];
        _bHeaderPic.layer.cornerRadius = 150*KWIDTH/2;
        _bHeaderPic.layer.masksToBounds = YES;
        
    }
    return _bHeaderPic;
    
}
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //self.verticalAlignment = VerticalAlignmentMiddle;
       // [self initializationLoad];
        self.userInteractionEnabled = YES;
        
        [self addSubview:self.bgImg ];
        [self addSubview: self.LB];
        [self addSubview:self.interestB];
        [self addSubview: self.ballplayerName];
        [self addSubview: self.bCountry];
        [self addSubview: self.bCity];
        [self addSubview: self.bInfo];
        [self addSubview: self.fansCount];
        [self addSubview: self.fansTitle];
        [self addSubview: self.bPrice];
        [self addSubview: self.bPriceHint];
        [self addSubview: self.bHeaderPic];
        
    }
    return self;
}
-(void)click:(UIButton*)senderRe{
   // self.returnPage(sender);
    self.returnPage(senderRe);
}
-(void)interestBtn:(UIButton*)sender{
    self.interestBlock(sender);
    
}
@end
