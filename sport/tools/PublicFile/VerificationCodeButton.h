//
//  VerificationCodeButton.h
//  Sports
//
//  Created by test on 2020/1/6.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VerificationCodeButton : UIButton
@property (nonatomic,strong) UIImageView *icon;
@property (nonatomic,strong) UILabel *title;
-(void)setBtnTitle:(NSString *)t;
@end

NS_ASSUME_NONNULL_END
