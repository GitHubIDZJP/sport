//
//  userRecommendedCell.h
//  Sports
//
//  Created by test on 2020/1/8.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "statusBtn.h"
NS_ASSUME_NONNULL_BEGIN

@interface userRecommendedCell : UITableViewCell
//tweet
@property(nonatomic,strong)UILabel *tweet;
@property(nonatomic,strong)UILabel *line;
//timer
@property(nonatomic,strong)UILabel *timer;
//点击按钮
@property(nonatomic,strong)statusBtn *thumbsUp;
@property(nonatomic,strong)UIButton *clickBtn;
@property(nonatomic,copy)void(^myBlock)(void);
@property(nonatomic,strong)UILabel *addLabel;
//-
-(void)getTweetText:(NSString*)tt timerStr:(NSString*)ts;
-(void)setclickAddCurrentValuebackgroundImage:(NSString*)imgName currentLabelText:(NSString*)currentText;
@end

NS_ASSUME_NONNULL_END
