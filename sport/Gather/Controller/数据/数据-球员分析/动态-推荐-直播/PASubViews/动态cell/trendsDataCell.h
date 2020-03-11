//
//  trendsDataCell.h
//  Sports
//
//  Created by test on 2020/1/20.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface trendsDataCell : UITableViewCell
@property(nonatomic,strong)IBOutlet UILabel *describeText;
@property(nonatomic,strong)IBOutlet UIImageView *rightPicture;
@property(nonatomic,strong)IBOutlet UIButton  *selectedButton;
@property(nonatomic,copy)void(^addSupportCountBtn)(UIButton*);
@property(nonatomic,strong)IBOutlet UILabel *ThumbText;
-(void)setDescText:(NSString*)dt  selBtn:(NSString*)sb supportText:(NSString*)st;
-(void)setrightPictureImg:(NSString*)img;

@end

NS_ASSUME_NONNULL_END
