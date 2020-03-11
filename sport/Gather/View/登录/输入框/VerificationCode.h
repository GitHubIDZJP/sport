//
//  VerificationCode.h
//  Sports
//
//  Created by test on 2020/1/17.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VerificationCode : UITextField
@property(nonatomic,strong)UILabel *line;

@property(nonatomic,retain)UIButton *getVerBtn;
//带参数
@property(nonatomic,copy)void(^getVerBtnBlock)(UIButton*);
@end

NS_ASSUME_NONNULL_END
