//
//  trendsCell.h
//  Sports
//
//  Created by test on 2020/1/17.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface trendsCell : UITableViewCell
@property(nonatomic,strong) IBOutlet UILabel *userName;
@property(nonatomic,strong) IBOutlet UIImageView *userImg;
@property(nonatomic,strong) IBOutlet UILabel *currentDate;
@property(nonatomic,strong) IBOutlet UILabel *textDesc;
@property(nonatomic,strong) IBOutlet UILabel *reportComments;
@property(nonatomic,readwrite) IBOutlet  UIView *contentView;
@property(nonatomic,strong) IBOutlet  UIImageView *ballPic;
@property(nonatomic,strong) IBOutlet  UILabel *ballDesc;



@end

NS_ASSUME_NONNULL_END
