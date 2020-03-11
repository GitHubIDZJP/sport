//
//  InviteXIBCell.h
//  Sports
//
//  Created by test on 2020/1/20.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InviteXIBCell : UITableViewCell
{
    CGFloat wS;
}

@property(nonatomic,strong) UILabel   *userName;//用户名称
@property(nonatomic,strong) UILabel   *registrationDate;//注册时间
@property(nonatomic,strong) UILabel   *rewardAmount;//奖励金额
-(void)userName:(NSString*)sn registrationDate:(NSString*)rd rewardAmount:(NSString*)ra;
+(CGFloat)w;
-(void)setUserNameTextColor:(UIColor *)tc;
-(void)setRegistrationDateTextColor:(UIColor *)RD;
-(void)setRewardAmountTextColor:(UIColor *)RA;
-(void)setFontWeight:(UIFont*)f OrFontSize:(CGFloat)fs;
@end

NS_ASSUME_NONNULL_END
