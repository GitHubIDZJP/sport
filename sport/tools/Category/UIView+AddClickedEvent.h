//
//  UIView+AddClickedEvent.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/18.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (AddClickedEvent)
- (void)addClickedBlock:(void(^)(id obj))tapAction;
@end

/*
 
 
 使用:
 
 [customViewName addClickedBlock:^(id obj){
 
   //view 点击事件响应
 
    NSLog(@"我被点击了");
 

 
 
 
 
 }];
 
 */
NS_ASSUME_NONNULL_END
