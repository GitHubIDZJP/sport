//
//  articleVCCell.h
//  Sports
//
//  Created by test on 2020/1/8.
//  Copyright © 2020 test. All rights reserved.
//




#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface articleVCCell : UITableViewCell
@property(nonatomic,strong)UILabel *versonLabel;
@property(nonatomic,strong)UILabel *versionDescLabel;
@property(nonatomic,strong)UILabel *skimLabel;
-(void)getVersonText:(NSString*)vt versonDescText:(NSString*)vdt skimText:(NSString*)st;



//新增加4个控件
//按钮1  点赞(夸奖)compliment
@property(nonatomic,strong)UIButton *complimentBtn;
//label1
@property(nonatomic,strong)UILabel *complimentLabel;
//按钮2  浏览browse
@property(nonatomic,strong)UIButton *browseBtn;
//label2
@property(nonatomic,strong)UILabel *browseLabel;



@end

NS_ASSUME_NONNULL_END
