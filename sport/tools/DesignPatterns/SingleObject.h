//
//  SingleObject.h
//  单例
//
//  Created by 邹俊平 on 2019/12/20.
//  Copyright © 2019 test. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingleObject : NSObject

//1对象构造
+(instancetype)shareInstance;

@end

NS_ASSUME_NONNULL_END
/*
 保持一个实例:
 音乐播放器
 AFN
 
 */

/*
 优点：
  对象只被初始化一次。确保对象访问都是唯一实例
  由于只有一个实例存在，节约了系统资源
 缺点:
   没有抽象层，对于扩展这块有很大困难
   单例一旦创建，指针是保存在静态区的，单例对象会在App终止之后释放
 */
