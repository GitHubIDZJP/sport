//
//  UIButton+BtnType.m
//  Sports
//
//  Created by test on 2020/1/7.
//  Copyright © 2020 test. All rights reserved.
//

#import "UIButton+BtnType.h"
#import <objc/runtime.h>
@implementation UIButton (BtnType)
- (NSString *)typeString {
    return objc_getAssociatedObject(self, @selector(typeString));
}
- (void)setTypeString:(NSString *)typeString {
    objc_setAssociatedObject(self, @selector(typeString), typeString, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
