//
//  XKModel.m
//  Sports
//
//  Created by test on 2020/1/6.
//  Copyright © 2020 test. All rights reserved.
//

#import "XKModel.h"

@implementation XKModel

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    
    XKModel *model = [[self alloc] init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}
@end
