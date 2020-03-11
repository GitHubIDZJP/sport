//
//  customTextView.h
//  Sports
//
//  Created by test on 2020/1/7.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface customTextView : UITextView

@property(nonatomic,strong)UILabel *hint;
@property(nonatomic,strong)UIImageView *uploadImg;
@property(nonatomic,strong)UIButton *upBtn;
@property(nonatomic,copy)void(^UpLoadBlock)(void);
-(void)getImage:(NSString *)img;
@end

NS_ASSUME_NONNULL_END
