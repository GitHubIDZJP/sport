//
//  userIntroVC.h
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#pragma mark 简介 
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface userIntroVC : UIViewController
@property(nonatomic,strong)customNavigationBar *NavBar;
@property(strong,nonatomic) UITextView *textView;
@property(strong,nonatomic)UILabel *hintTitle;
@end




NS_ASSUME_NONNULL_END
