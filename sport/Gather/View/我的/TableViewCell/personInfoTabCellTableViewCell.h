//
//  personInfoTabCellTableViewCell.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/16.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface personInfoTabCellTableViewCell : UITableViewCell
{
    
    //左边提示文字
      UILabel *leftHintText;
      UILabel  *CommentText;//右边注释文字
    
    
    
}

@property(nonatomic,strong)UIView *filletView;
-(void)setleftHintText:(NSString *)text rightCommentText:(NSString*)descriptionText;
@end

NS_ASSUME_NONNULL_END
