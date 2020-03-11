//
//  NotificationCenterCell.h
//  Sports
//
//  Created by test on 2020/1/7.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#define spaceLeft 40*KWIDTH
NS_ASSUME_NONNULL_BEGIN

@interface NotificationCenterCell : UITableViewCell
//@property(nonatomic ,strong)UILabel *currentTime;//当前时间
@property(nonatomic,strong)UIView *cellView;
@property(nonatomic ,strong)UIImageView *VariableHead;//头像
//订单通知
@property(nonatomic ,strong)UILabel *TextNoti;//文字通知
//通话时间
@property(nonatomic,strong)UILabel *redPackets;// 红包数

//-(void)setCurrentTimeContext:(NSString*)CT VariableHead:(NSString*)imgUrl TextNoti:(NSString*)TN  redPackets:(NSString*)rP;
-(void)setVariableHead:(NSString*)imgUrl TextNoti:(NSString*)TN  redPackets:(NSString*)rP;
-(void)setTextNotiFrame:(CGFloat)x;
-(Boolean)imgHidden:(Boolean)hide;
@end

NS_ASSUME_NONNULL_END
