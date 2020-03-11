//
//  SuperParentView.h
//  Sports
//
//  Created by test on 2020/1/7.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SuperParentView : UIView
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,copy)void(^myBlock)(UIButton*);
@property(nonatomic,strong)UILabel *secretLabel;
-(void)setSecretLabelText:(NSString*)title;
@end

NS_ASSUME_NONNULL_END
