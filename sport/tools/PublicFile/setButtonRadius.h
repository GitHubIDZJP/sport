//
//  setButtonRadius.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/17.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface setButtonRadius : UIButton

- (void)viewRadius:(CGFloat)radius RectCorner:(UIRectCorner)corner view:(UIView *)view;


//我自定义button 继承 UIBUTON

//然后在VC里带入





/*
 
 使用;
 
 
 setButtonRadius *btn = [[setButtonRadius alloc]initWithFrame:CGRectMake(10,200,100,100)];
 
 btn.backgroundColor = [UIColor redColor];
 
 
 [btn viewRadius:20 RectCorner:UIRectCornerBottomRight | UIRectCornerBottomLeft view:btn];
 [self.view addSubview:btn];
 
 */

@end

