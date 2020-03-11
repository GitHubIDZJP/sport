//
//  tooltip.h
//  Sports
//
//  Created by test on 2020/1/17.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface tooltip : UIView


@property(nonatomic,retain)UIButton *btnSel;
//带参数
@property(nonatomic,copy)void(^btnSelBlock)(UIButton*);

@property(nonatomic,strong)UILabel *text;

@end

NS_ASSUME_NONNULL_END
