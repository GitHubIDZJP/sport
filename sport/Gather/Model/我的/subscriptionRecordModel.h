//
//  subscriptionRecordModel.h
//  Sports
//
//  Created by test on 2020/1/6.
//  Copyright © 2020 test. All rights reserved.
//

//订阅记录model
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface subscriptionRecordModel : NSObject



@property(nonatomic,strong)NSString *RecordStr;
@property(nonatomic,strong)NSString *timeStr;
@property(nonatomic,strong)NSString *moneyStr;
+(instancetype)modelWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
