//
//  contestVCTableCell.h
//  Sports
//
//  Created by test on 2020/1/18.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface contestVCTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel   *OpeningTime;//开赛时间
@property (weak, nonatomic) IBOutlet UILabel   *NumberOfWheels ;//轮数
@property (weak, nonatomic) IBOutlet UILabel   *teamJ;//团队甲方
@property (weak, nonatomic) IBOutlet UILabel   *teamY;//团队乙方
@property (weak, nonatomic) IBOutlet UIImageView  *TeamJLogo;//团队乙方logo
@property (weak, nonatomic) IBOutlet UIImageView *TeamYLogo;//团队甲方logo
@property (weak, nonatomic) IBOutlet UILabel   *compareLabel;//VS
-(void)setTeamJName:(NSString*)jn TeamYName:(NSString*)yn TeamJLogo:(NSString*)jl TeamYLogo:(NSString*)Yl;

@end

NS_ASSUME_NONNULL_END
