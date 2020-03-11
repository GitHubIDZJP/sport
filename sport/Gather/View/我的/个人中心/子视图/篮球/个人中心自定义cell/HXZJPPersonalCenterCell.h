//
//  PersonalCenterCell.h
//  SegmentControl进行UITableView切换
//
//  Created by test on 2020/2/12.
//  Copyright © 2020 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HXZJPPersonalCenterCell : UITableViewCell
@property (nonatomic,strong)IBOutlet UILabel *DistrictTeam;//区队：澳洲甲
@property (nonatomic,strong)IBOutlet UILabel *GameTime;//比赛时间
@property (nonatomic,strong)IBOutlet UILabel *TeamComparison;//球队胜负比较
@property (nonatomic,strong)IBOutlet UILabel*GamePlay;//玩法
@property (nonatomic,strong)IBOutlet UILabel*OutcomePredict;//胜利预测

-(void)setTeamName:(NSString*)GameTeamName  GameTime:(NSString*)currentCompareTimer TeamComparison:(NSString*)competition GamePlay:(NSString*)CompetitionWay OutcomePredict:(NSString*)resultsAnalysis;

@end

NS_ASSUME_NONNULL_END
