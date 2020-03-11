//
//  currentView.m
//  QCGlobalSport
//
//  Created by test on 2020/2/12.
//  Copyright © 2020 com.qqty. All rights reserved.
//

#import "currentView.h"

@implementation currentView
/*
@property(nonatomic,strong)UILabel *victoryOFWeeks;//周胜;
@property(nonatomic,strong)UILabel *victoryOFMonth;//月胜;
@property(nonatomic,strong)UILabel *WeekOdds;//周胜率;
@property(nonatomic,strong)UILabel *Monthodds;//月胜率;
@property(nonatomic,strong)UILabel *WeekRatio;//周比率;
@property(nonatomic,strong)UILabel *MontRatio;//月比率;
 */

//周胜
-(UILabel*)victoryOFWeeks{
    if(!_victoryOFWeeks)
    {
        _victoryOFWeeks = UILabel.new;
        _victoryOFWeeks.frame = RECT(29*KWIDTH,30*KWIDTH,61*KWIDTH,26*KWIDTH);
        _victoryOFWeeks.tintColor = colorWithHexString(@"#333333");
        _victoryOFWeeks.font = Font14;
         _victoryOFWeeks.text =  @"周胜";
        
    }
    return _victoryOFWeeks;
}
//月胜
-(UILabel*)victoryOFMonth{
    if(!_victoryOFMonth)
    {
        _victoryOFMonth = UILabel.new;
        _victoryOFMonth.frame = RECT(377*KWIDTH,30*KWIDTH,61*KWIDTH,26*KWIDTH);
        _victoryOFMonth.tintColor = colorWithHexString(@"#333333");
        _victoryOFMonth.font = _victoryOFWeeks.font ;
         _victoryOFMonth.text = @"月胜" ;
        
    }
    return _victoryOFMonth;
}
//周胜率

-(UILabel*)WeekOdds{
    if(!_WeekOdds)
    {
        _WeekOdds = UILabel.new;
        _WeekOdds.frame = RECT(_victoryOFWeeks.x,76*KWIDTH,73*KWIDTH,23*KWIDTH);
        _WeekOdds.tintColor = colorWithHexString(@"#999999");
        _WeekOdds.font = Font12;;
        _WeekOdds.text = @"10中9";
        
    }
    return _WeekOdds;
}
//月胜率
-(UILabel*)Monthodds{
    if(!_Monthodds)
    {
        _Monthodds = UILabel.new;
        _Monthodds.frame = RECT(_victoryOFMonth.x,76*KWIDTH,103*KWIDTH,23*KWIDTH);
        _Monthodds.tintColor = colorWithHexString(@"#999999");
        _Monthodds.font = Font12;;
        _Monthodds.text = @"100中9";
        
    }
    return _Monthodds;
}
//周比率;
-(UILabel*)WeekRatio{
    if(!_WeekRatio)
    {
        
        _WeekRatio = UILabel.new;
        _WeekRatio.frame = RECT(142*KWIDTH,52*KWIDTH,106*KWIDTH,37*KWIDTH);
       // _WeekRatio.tintColor = colorWithHexString(@"#FF3232");
        _WeekRatio.font = Font18;
        _WeekRatio.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:20];
        _WeekRatio.text = @"90%";
        _WeekRatio.textColor =colorWithHexString(@"#FF3232");
    }
    return _WeekRatio;
}
//月比率;
-(UILabel*)MontRatio{
    if(!_MontRatio)
    {
        _MontRatio = UILabel.new;
        _MontRatio.frame = RECT(487*KWIDTH,52*KWIDTH,106*KWIDTH,37*KWIDTH);
        _MontRatio.textColor =colorWithHexString(@"#FF3232");
        _MontRatio.font = Font18;
        _MontRatio.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:20];
        
        _MontRatio.text = @"10%";
        
    }
    return  _MontRatio;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        self.backgroundColor = UIColor.whiteColor;
        [self addSubview:self.victoryOFWeeks];
        [self addSubview:self.victoryOFMonth];
        [self addSubview:self.WeekOdds];
        [self addSubview:self.Monthodds];
        [self addSubview:self.WeekRatio];
        [self addSubview:self.MontRatio];
        
        
       
//
//        UILabel *lable = [[UILabel alloc] init];
//     // label.
//        lable.frame = CGRectMake(10,10,80,50);
//        lable.text = @"1";
//        [self addSubview:lable];
    }
    return self;
}


@end
