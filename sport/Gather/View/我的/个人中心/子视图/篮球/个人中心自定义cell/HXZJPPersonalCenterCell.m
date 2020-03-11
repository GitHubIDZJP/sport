//
//  PersonalCenterCell.m
//  SegmentControl进行UITableView切换
//
//  Created by test on 2020/2/12.
//  Copyright © 2020 admin. All rights reserved.
//

#import "HXZJPPersonalCenterCell.h"

@implementation HXZJPPersonalCenterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setTeamName:(NSString*)GameTeamName  GameTime:(NSString*)currentCompareTimer TeamComparison:(NSString*)competition GamePlay:(NSString*)CompetitionWay OutcomePredict:(NSString*)resultsAnalysis{
    
    /*
    DistrictTeam;//区队：澳洲甲
    GameTime;//比赛时间
    TeamComparison;//球队胜负比较
    GamePlay;//玩法
    OutcomePredict;//胜利预测
     */
    
     self.DistrictTeam.text =GameTeamName ;//区队：澳洲甲
     self.GameTime.text = currentCompareTimer;//比赛时间
     self.TeamComparison.text =competition;//球队胜负比较
     self.GamePlay.text = CompetitionWay ;//玩法
     self.OutcomePredict.text = resultsAnalysis;//胜利预测
    
    
    
}

@end
