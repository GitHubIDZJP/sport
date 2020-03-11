//
//  userCenterHeaderView.h
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface userCenterHeaderView : UIView
@property(nonatomic,strong)UIImageView *BGImg;
//头像Avatar
@property(nonatomic,strong)UIImageView *avatar;

//名字:username
@property(nonatomic,strong)UILabel *userId;
//签名 ：User signature
@property(nonatomic,strong)myUILabel *userSignature;

/**/
@property(retain,nonatomic)UIButton *returnBtn;
@property(nonatomic,copy)void(^returnBtnBlock)(void);


-(void)setAvatarImg:(NSString*)img setUserName:(NSString*)strF setUserSignatureText:(NSString*)text;



@end

NS_ASSUME_NONNULL_END
