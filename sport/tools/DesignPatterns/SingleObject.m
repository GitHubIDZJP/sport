//
//  SingleObject.m
//  单例
//
//  Created by 邹俊平 on 2019/12/20.
//  Copyright © 2019 test. All rights reserved.
//

#import "SingleObject.h"
//2
static SingleObject *_singleInstance = nil;

@implementation SingleObject

//3
+(instancetype)shareInstance
{
    //线程安全访问
    static dispatch_once_t onceToken;
    /*
     dispatch_once:使内部的block块全局执行一次
     */
    dispatch_once(&onceToken,^{
        if(_singleInstance == nil){
            _singleInstance = [[self alloc]init];
        }
        
    });
    return _singleInstance;
}
/*
 其实OC内部会通过+(instancetype)allocWithZone:方法来进行内存的分配，所以为了保证单例对象只会创建一个，我们必须重写+(instancetype)allocWithZone:方法。而有时候新创建的对象可能是老对象直接调用copy方法得来的，所以我们最好重写-(id)copyWithZone:(NSZone *)zone和-(id)mutableCopyWithZone:(NSZone *)zone来直接返回这个实例对象
 */

//加了下面这3个方法 那就可以确保单例的唯一性:每次打印的地址都一样

//直接返回这个实例对象(instancetype)allocWithZone:方法来进行内存的分配
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
       dispatch_once(&onceToken, ^{
           _singleInstance = [super allocWithZone:zone];
       });
       return _singleInstance;
}
//保证单例对象只会创建一个，必须重写
-(id)copyWithZone:(NSZone *)zone
{
    return _singleInstance;
}
//直接返回这个实例对象
-(id)mutableCopyWithZone:(NSZone *)zone {
    return _singleInstance;
}
@end
