//
//  UIButton+ENUM.m
//  Sports
//
//  Created by test on 2020/1/7.
//  Copyright © 2020 test. All rights reserved.
//

#import "UIButton+ENUM.h"
#import <objc/runtime.h>
// 定义全局静态字符作为关联的Key值
const char *buyHouseCalculatorTypeKey = "buyHouseCalculatorTypeKey";
@implementation UIButton (ENUM)
-(void)setBuyHouseCalculatorType:(BuyHouseCalculatorType)buyHouseCalculatorType {
    objc_setAssociatedObject(self, buyHouseCalculatorTypeKey, @(buyHouseCalculatorType), OBJC_ASSOCIATION_ASSIGN);
}
- (BuyHouseCalculatorType)buyHouseCalculatorType {
    return [objc_getAssociatedObject(self, buyHouseCalculatorTypeKey) integerValue];
    
}
@end
