//
//  XKModel.h
//  Sports
//
//  Created by test on 2020/1/6.
//  Copyright © 2020 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XKModel : NSObject

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *detail;

@end
