//
//  PayMnetCustomCell.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/15.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PayMnetCustomCell : UITableViewCell
{
    
        //声明3个视图
        UILabel *titleLabel;
        UIImageView *iconView;
        UIButton *selectBtn;
}
-(void)setIconViewImg:(NSString *)iconImg andTitleLabelText:(NSString*)text;
-(void)setIconViewImg:(NSString *)iconImg;
-(void)setBtnIcon:(NSString*)img;
@end

NS_ASSUME_NONNULL_END
