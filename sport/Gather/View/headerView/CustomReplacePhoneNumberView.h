//
//  CustomReplacePhoneNumberView.h
//  Sports
//
//  Created by test on 2020/1/6.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomReplacePhoneNumberView : UIView

//label
@property(retain,nonatomic)UILabel *bindPNumber;



//changeBtn
@property(retain,nonatomic)UIButton *changePNBtn;
@property(nonatomic,copy)void(^btnBlock)(void);




//arrow
@property(nonatomic,strong)UIImageView *arrow;

-(void)appendPhoneNumber:(NSString*)pn;


@end

NS_ASSUME_NONNULL_END
