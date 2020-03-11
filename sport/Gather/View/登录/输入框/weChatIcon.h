//
//  weChatIcon.h
//  Sports
//
//  Created by test on 2020/1/17.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface weChatIcon : UIView
{
    UILabel *label;
}
@property(nonatomic,retain)UILabel *line;
@property(nonatomic,retain)UIButton *weChatLogin;
@property(nonatomic,copy)void(^weChatLoginBlock)(UIButton*);
@end

NS_ASSUME_NONNULL_END
