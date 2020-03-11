//
//  UIButton+ENUM.h
//  Sports
//
//  Created by test on 2020/1/7.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, BuyHouseCalculatorType) {
    BuyHouseCalculatorType_PublicReserveFundLoan = 0,
    BuyHouseCalculatorType_BusinessLoan,
    BuyHouseCalculatorType_GroupLoan
};
@interface UIButton (ENUM)
@property (nonatomic, assign) BuyHouseCalculatorType buyHouseCalculatorType;
@end

NS_ASSUME_NONNULL_END
