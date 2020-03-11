//
//  means.h
//  Sports
//
//  Created by test on 2020/1/8.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface means : UIView
@property(nonatomic,strong)UILabel *centerLabel;
@property(nonatomic,strong)UIButton *navBtn;
@property(nonatomic,copy)void(^navBtnBlock)(void);
@property(nonatomic,strong)UIImageView *BGImg;
//头像Avatar
@property(nonatomic,strong)UIImageView *avatar;

//名字:username
@property(nonatomic,strong)UILabel *userId;
//签名 ：User signature
@property(nonatomic,strong)myUILabel *userSignature;

/**/
@property(retain,nonatomic)UIButton *heartBtn;
@property(nonatomic,copy)void(^myHeartBlock)(void);



//设置按钮Settings button
@property(nonatomic,strong)UIButton *ShareBtn;
@property(nonatomic,copy)void(^myShareBlock)(void);

-(void)setAvatarImg:(NSString*)img setUserName:(NSString*)strF setUserSignatureText:(NSString*)text ShareBtnIcon:(NSString*)icon HeartBtnIcon:(NSString*)iconImg;



-(void)setSettingButtonTag:(int)tag;

@end

NS_ASSUME_NONNULL_END
