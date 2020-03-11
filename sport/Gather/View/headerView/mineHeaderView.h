//
//  mineHeaderView.h
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface mineHeaderView : UIView
@property(nonatomic,strong)UIImageView *BGImg;
//头像Avatar
@property(nonatomic,strong)UIImageView *avatar;

//名字:username
@property(nonatomic,strong)UILabel *userId;
//签名 ：User signature
@property(nonatomic,strong)myUILabel *userSignature;

/**/
@property(retain,nonatomic)UIButton *setBtn;
@property(nonatomic,copy)void(^myBlock)(void);
/**/
//影藏按钮
@property(nonatomic,retain)UIButton *HideButton;
//带参数
@property(nonatomic,copy)void(^HideButtonBlock)(UIButton*);
/***/




//设置按钮Settings button
@property(nonatomic,strong)UIButton *settingsBtn;

-(void)setAvatarImg:(NSString*)img setUserName:(NSString*)strF setUserSignatureText:(NSString*)text setSettingsButtonIcon:(NSString*)icon;


-(void)setSettingButtonTag:(int)tag;


@end

NS_ASSUME_NONNULL_END
