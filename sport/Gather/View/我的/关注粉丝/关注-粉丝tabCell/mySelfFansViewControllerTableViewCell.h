//
//  mySelfFansViewControllerTableViewCell.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/17.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface mySelfFansViewControllerTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *headerImg;
@property(nonatomic,strong)UILabel *userName;
@property(nonatomic,strong)UILabel  *signature;//签名
@property(nonatomic,strong)UIButton *BOOLConcerned;
@property(nonatomic,copy)void(^selConcerbed)(void);



-(NSString *)setHeaderImg:(NSString*)str userName:(NSString*)uN sig:(NSString*)s;

-(void)setBtnTitle:(NSString*)titleStr;




@end

NS_ASSUME_NONNULL_END
