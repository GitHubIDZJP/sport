//
//  customNavigationBar.h
//  TooBrocadeCarp
//
//  Created by Mac on 2019/10/9.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myUILabel.h"
NS_ASSUME_NONNULL_BEGIN

@interface customNavigationBar : UIView

{
    BOOL *boolValue;
}

@property(nonatomic,retain)UIButton *leftButton;
@property(nonatomic,copy)void(^backBlock)(void);




@property(nonatomic,strong)myUILabel *middleText;

@property(nonatomic,retain)UIButton *rightButton ;
@property(nonatomic,copy)void(^pushBlock)(void);

-(void)setBtnTag:(int)tag;


-(void)setRightButtonTitle:(NSString *)title;
//-(void)setCenterText:(NSString *)text andSetRightBtnBgImage:(NSString *)img;
-(void)setCenterText:(NSString *)text ;
-(BOOL)setLeftBtnISHidden:(Boolean)b;
-(Boolean)setRightButtonIsHidden:(Boolean)sure;
-(void)resettingRightBtnFrame:(CGRect)rect;
//-(void)changeRightBtnX:(int)X;
-(void)setCenterTextColor:(UIColor*)textColor;
-(void)setMySelfColor:(UIColor*)color;

-(void)setLeftBtnbgckgroundImg:(NSString*)bgImg;
//设置中文文本是否y隐藏
-(Boolean)setCenterTextWhetherHide:(Boolean)isTure;

-(void)setRightBtnTag:(int)r_tag;
-(void)changeFrameX:(int)frameX FrameY:(int)frameY FrameW:(int)frameW FrameH:(int)frameH;
-(void)setRightBtnFont:(UIFont*)font ;
-(void)setRightBtnTextColor:(UIColor*)color bgColor:(UIColor*)bC;

-(void)setMySelfBGColor:(UIColor*)color;
@end

NS_ASSUME_NONNULL_END
