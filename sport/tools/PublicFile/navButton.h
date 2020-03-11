//
//  navButton.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/14.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface navButton : UIButton

@property (nonatomic,strong) UIImageView *topImageView;

@property (nonatomic,strong) UILabel *bottomLable;
@property (nonatomic, copy) void (^block)(UIButton *);
//添加带block的点击事件
- (void)addTapBlock:(void(^)(UIButton *button))block;

//添加带block的点击事件
- (void)addTapBlock:(void(^)(UIButton *button))block;


-(void)setTopImg:(NSString *)img andBottomLable:(NSString *)text;

-(void)setLabelTag:(int)tag;
-(void)settopImageViewTag:(int)tag;

-(void)setCGRectFrame:(int)cg;

-(void)changeImageViewFrame:(CGRect)frame;
-(void)changeLabelContextFrame:(CGRect)frame;
//changeFrame

@end

NS_ASSUME_NONNULL_END
