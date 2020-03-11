//
//  RotaryButton.h
//  Sports
//
//  Created by test on 2020/1/13.
//  Copyright © 2020 test. All rights reserved.
//

//轮播按钮 
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RotaryButton : UIButton
@property (nonatomic,strong) UIImageView *imgH;
@property (nonatomic,strong) UILabel *labelT;

-(void)setRotaryBtnImgPath:(NSString*)imgPath labelText:(NSString*)lText;
-(void)changeLabelCoordinateX:(CGFloat)LabelXValue imgHCoordinateX:(CGFloat)imgaeViewXValue;
@end

NS_ASSUME_NONNULL_END
