//
//  subscriptionRecordModel.m
//  Sports
//
//  Created by test on 2020/1/6.
//  Copyright © 2020 test. All rights reserved.
//

#import "subscriptionRecordModel.h"




@implementation subscriptionRecordModel

+(instancetype)modelWithDict:(NSDictionary *)dict{
    
    subscriptionRecordModel *model = [[self alloc] init];
    
    [model setValuesForKeysWithDictionary:dict];
    return model;

    
    
}

@end
