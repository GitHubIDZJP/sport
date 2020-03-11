//
//  currentView.h
//  QCGlobalSport
//
//  Created by test on 2020/2/12.
//  Copyright © 2020 com.qqty. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface currentView : UIView
@property(nonatomic,strong)UILabel *victoryOFWeeks;//周胜;
@property(nonatomic,strong)UILabel *victoryOFMonth;//月胜;
@property(nonatomic,strong)UILabel *WeekOdds;//周胜率;
@property(nonatomic,strong)UILabel *Monthodds;//月胜率;
@property(nonatomic,strong)UILabel *WeekRatio;//周比率;
@property(nonatomic,strong)UILabel *MontRatio;//月比率;
@end

NS_ASSUME_NONNULL_END
