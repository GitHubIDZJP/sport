//
//  subscriptionRecordCell.h
//  Sports
//
//  Created by test on 2020/1/6.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "subscriptionRecordModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface subscriptionRecordCell : UITableViewCell

@property(nonatomic,strong)subscriptionRecordModel *model;

@property(nonatomic,strong)UILabel *Record;
@property(nonatomic,strong)UILabel *time;
@property(nonatomic,strong)UILabel *money;

@end



NS_ASSUME_NONNULL_END
