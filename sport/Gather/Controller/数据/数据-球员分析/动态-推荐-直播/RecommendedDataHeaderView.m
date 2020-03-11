//
//  RecommendedDataHeaderView.m
//  Sports
//
//  Created by test on 2020/1/14.
//  Copyright © 2020 test. All rights reserved.
//

#import "RecommendedDataHeaderView.h"

@implementation RecommendedDataHeaderView
-(UIButton *)switchData{
    if(!_switchData){
        
        _switchData = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2- 147*KWIDTH,30*KWIDTH, 140*KWIDTH,42*KWIDTH)];
        [_switchData setTitle:@"19-20V" forState:0];
        [_switchData setTitleColor:color(167, 170, 172) forState:0];
        _switchData.layer.cornerRadius = 10*KWIDTH;
        _switchData.layer.masksToBounds = true;
        _switchData.backgroundColor = colorWithHexString(@"#F3F6F4");
        _switchData.titleLabel.font  = Font11;
        
    }
    
    return _switchData;
}
-(UILabel *)teamName{
    
    if(!_teamName){
        CGFloat x = SCREEN_WIDTH / 2;
        _teamName = [[UILabel alloc]initWithFrame:RECT(x,_switchData.y,85*KWIDTH ,42*KWIDTH)];
        _teamName.text = @"英超";
        _teamName.backgroundColor =colorWithHexString(@"#4CB13B") ;//color(102, 168, 55);
        _teamName.textColor = White;
        _teamName.layer.cornerRadius = 10*KWIDTH;
        _teamName.layer.masksToBounds = true;
        _teamName.font = Font12;
        _teamName.textAlignment = NSTextAlignmentCenter;
    }
    return _teamName;
}




- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.switchData];
        [self addSubview:self.teamName];
        
        self.userInteractionEnabled = YES;
         CGFloat w = (SCREEN_WIDTH - 3 ) /3 ;
        for (int i = 0; i< 3; i++) {
            NSArray *data  = @[@"19/19",@"90min",@"17"];
            _forLabelData  = [[UILabel alloc]init];


            _forLabelData.frame = CGRectMake(i*w,100*KWIDTH,w,70*KWIDTH);
            _forLabelData.text = data[i];
            _forLabelData.textColor  = colorWithHexString(@"#000000");
            _forLabelData.font = Font20;
            //_forLabelData.backgroundColor = UIColor.purpleColor;
            _forLabelData.textAlignment =NSTextAlignmentCenter;
            [self addSubview:self.forLabelData];
        }
        
        ///
        for (int temp = 0; temp< 3; temp++) {
            NSArray *datahint  = @[@"首发/出场",@"场均出场时间内",@"进球"];
            _forLabelHint  = [[UILabel alloc]init];
          //  CGFloat w = (self.width - 3 ) /3 ;
            
_forLabelHint.frame = CGRectMake(temp*w,_forLabelData.y + _forLabelData.height,w,30*KWIDTH);
            _forLabelHint.textAlignment =NSTextAlignmentCenter;
            _forLabelHint.text = datahint[temp];
            _forLabelHint.textColor  = colorWithHexString(@"#999999");
            _forLabelHint.font = Font11;
           // _forLabelHint.backgroundColor = UIColor.yellowColor;
            [self addSubview:self.forLabelHint];
        }
        for (int lineV = 0;lineV < 2;lineV++){
            _line = UILabel.new;
            CGFloat m_l = SCREEN_WIDTH/3;
            _line.frame = CGRectMake(m_l+lineV*w,self.forLabelData.y + 18*KWIDTH,1*KWIDTH,50*KWIDTH) ;
            _line.backgroundColor = color(242, 239, 242);
            _line.textAlignment = NSTextAlignmentCenter;
            //_line.text = @"dfdf";
            [self addSubview:self.line];
            
            
         
            
            
            
        }
        
       
        
    }
    return  self;
    
}

    
    
    



@end
