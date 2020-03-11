//
//  imgOrTitleBtn.h
//  Sports
//
//  Created by test on 2020/1/14.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface imgOrTitleBtn : UIButton

@property(nonatomic,strong)UIImageView *Img;
@property(nonatomic,strong)UILabel *title;
-(void)setImg:(NSString *)i title:(NSString *)t;
@property (nonatomic, copy) void (^block)(UIButton *);
- (void)addTapBlock:(void(^)(UIButton *button))block;
-(void)setImgY:(int)y;
-(void)setTitleColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
