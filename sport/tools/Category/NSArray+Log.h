//
//  NSArray+Log.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/23.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Log)

@end

NS_ASSUME_NONNULL_END

/*
 
 测试使用:
 
 
 vc 头文件导入 NSArray+Log
 
 1. #import "NSArray+Log.h"
 
 
 2.全局定义
     NSArray * _nameArray;
 
 
 
 3. viewDidLoad:
 
 _nameArray  = @[@[@"江西省",@"广东省"],
 @[@"赣州",@"南昌",@"新余"],
 @[@"深圳",@"广州",@"惠州"]];
 NSInteger getCounts = _nameArray.count;
 NSLog(@"count:%ld",(long)getCounts);
 
 NSLog(@"数组:%@",[_nameArray objectAtIndex:0]);
 NSLog(@"数组:%@",[_nameArray objectAtIndex:1]);
 NSLog(@"数组:%@",[_nameArray objectAtIndex:2]);
 
 4：运行代码 ：
 
 5：查看命令行是否中文?
 
 
 6： 别看了 一定会是中文
 
 
 
 */
