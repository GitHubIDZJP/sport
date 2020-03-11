//
//  collectCell.h
//  Sports
//
//  Created by test on 2020/1/17.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface collectCell : UITableViewCell
@property (weak, nonatomic)IBOutlet UIImageView *ballImg;
@property (weak, nonatomic)IBOutlet UIImageView *headerImg;
@property (weak, nonatomic)IBOutlet UILabel *footBall;
@property (weak, nonatomic)IBOutlet UILabel *date;
@property (weak, nonatomic)IBOutlet UIButton *browserBtn;
@property (weak, nonatomic)IBOutlet UILabel *browserLabel;
@property (weak, nonatomic)IBOutlet UILabel *descLabel;
@end



NS_ASSUME_NONNULL_END
