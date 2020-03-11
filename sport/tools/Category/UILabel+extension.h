//
//  UILabel+extension.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/11/11.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (extension)
/**
 *  设置字间距
 */
- (void)setColumnSpace:(CGFloat)columnSpace;
/**
 *  设置行距
 */
- (void)setRowSpace:(CGFloat)rowSpace;

@end

NS_ASSUME_NONNULL_END
