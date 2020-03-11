//
//  SubscriptionMode.h
//  Sports
//
//  Created by test on 2020/1/4.
//  Copyright © 2020 test. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SubscriptionMode : NSObject
@property (copy,nonatomic) NSString  *TimeStopHint;//到期时间文本提示
@property (copy,nonatomic) NSString *headPortrait;//图片头像
@property (copy,nonatomic) NSString *members;//会员
@property (copy,nonatomic) NSString *memberLength;//会员时长
@property (copy,nonatomic) NSString *currentTime;//当前时间

+(instancetype)setModelParametersWithHeadPortrait:(NSString*)hp Members:(NSString *)mText MemberLength:(NSString*)ml currentTime:(NSString*)ct TimeStopHint:(NSString*)timeStop;
-(instancetype)initWithHeadPortrait:(NSString*)hp Members:(NSString *)mText MemberLength:(NSString*)ml currentTime:(NSString*)ct TimeStopHint:(NSString*)timeStop;

@end

NS_ASSUME_NONNULL_END
