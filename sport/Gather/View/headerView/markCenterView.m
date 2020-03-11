//
//  markCenterView.m
//  Sports
//
//  Created by test on 2020/1/14.
//  Copyright © 2020 test. All rights reserved.
//

#import "markCenterView.h"

@implementation markCenterView

-(UIImageView*)BGImg
{
    
    if(!_BGImg){
        _BGImg = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,self.width,self.height)];
        _BGImg.image = [UIImage imageNamed:@"Image 拷贝 2@2x"];
    }
    return _BGImg;
}
-(UILabel *)coinHint{
    if(!_coinHint){
        _coinHint = UILabel.new;
        _coinHint.frame = RECT(30*KWIDTH,21*KWIDTH ,55*KWIDTH,23*KWIDTH );
        _coinHint.font = Font12;
        _coinHint.textColor = colorWithHexString(@"#333333");
        _coinHint.text = @"球币";
        
        
    }
    return _coinHint;
}
-(UILabel *)coin{
    if(!_coin){
        _coin = UILabel.new;
        _coin.frame = RECT(32*KWIDTH,70*KWIDTH ,155*KWIDTH,30*KWIDTH );
        _coin.font = Font20;
        _coin.textColor = colorWithHexString(@"#4CB13B");
        //_coin.text = @"球币";
        _coin.textAlignment = NSTextAlignmentLeft;
        
        
    }
    return _coin;
}/*
  @property(nonatomic,strong)UILabel *giftPresentHint;
  @property(nonatomic,strong)UILabel *giftCount;
  */
//礼物币
-(UILabel *)giftPresentHint{
    if(!_giftPresentHint){
        _giftPresentHint = UILabel.new;
        _giftPresentHint.frame = RECT(282*KWIDTH,_coinHint.y ,_coinHint.width+ 50*KWIDTH,_coinHint.height );
        _giftPresentHint.font = Font12;
        _giftPresentHint.textColor =  _coinHint.textColor;
        _giftPresentHint.text = @"礼物币";
        _giftPresentHint.textAlignment = NSTextAlignmentLeft;
        
        
    }
    return _giftPresentHint;
}
//礼物count
-(UILabel *)giftCount{
    if(!_giftCount){
        _giftCount = UILabel.new;
        _giftCount.frame = RECT(_giftPresentHint.x,_coin.y ,155*KWIDTH,30*KWIDTH );
        _giftCount.font = Font20;
        _giftCount.textColor = _coin.textColor;
        //_coin.text = @"球币";
        _giftCount.textAlignment = NSTextAlignmentLeft;
        
        
    }
    return _giftCount;
}
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //self.verticalAlignment = VerticalAlignmentMiddle;
        [self addSubview:self.BGImg];
        self.userInteractionEnabled = YES;
        
        [self addSubview:self.coinHint];
        [self addSubview:self.coin];
        [self addSubview:self.giftPresentHint];
        [self addSubview:self.giftCount];
        
        
        
    }
    return self;
}
-(void)getCoin:(NSString*)coinCount giftCount:(NSString*)gc{
    self.coin.text = coinCount;
    self.giftCount.text = gc;
}
@end
