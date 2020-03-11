//
//  SubscriptionMode.m
//  Sports
//
//  Created by test on 2020/1/4.
//  Copyright © 2020 test. All rights reserved.
//

#import "SubscriptionMode.h"

@implementation SubscriptionMode
+(instancetype)setModelParametersWithHeadPortrait:(NSString*)hp Members:(NSString *)mText MemberLength:(NSString*)ml currentTime:(NSString*)ct TimeStopHint:(NSString*)timeStop{
    
    return [[self alloc]initWithHeadPortrait:hp Members:mText MemberLength:ml currentTime:ct TimeStopHint:timeStop];
    
    
    
}
-(instancetype)initWithHeadPortrait:(NSString*)hp Members:(NSString *)mText MemberLength:(NSString*)ml currentTime:(NSString*)ct TimeStopHint:(NSString*)timeStop{
    if(self = [super init])
    {
        self.headPortrait = hp;
        self.members =mText;
        self.memberLength = ml;
        self.currentTime = ct;
        self.TimeStopHint = timeStop;
    }
    
    return self;
    
    
}
@end
