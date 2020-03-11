//
//  UIView+AddClickedEventTest.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/17.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (AddClickedEventTest)
- (void)addClickedBlock:(void(^)(id obj))tapAction;
@end

/**
 
 使用
  
 [self.myView addClickedBlock:^(id obj) {
 NSLog(@"我被点击了~");
 }];
 
 */
NS_ASSUME_NONNULL_END
