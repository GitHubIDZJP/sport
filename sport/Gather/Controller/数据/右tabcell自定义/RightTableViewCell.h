//
//  RightTableViewCell.h
//  Sports
//
//  Created by test on 2020/1/9.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RightTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *tit;
@property(nonatomic,strong)UIImageView *imgP;
@property(nonatomic,strong)UILabel *tex;
@property(nonatomic,strong)UILabel *tNumber;
- (void)addShadowToView:(UIView *)theView withColor:(UIColor *)theColor;
-(void)addImgPath:(NSString*)ip  TexStr:(NSString*)ts tNumber:(NSString*)TN;
//+(UIFont*)boldSystemFontOfSize:(CGFloat)bf;
-(void)setBootTextBGColor:(UIColor*)color;
-(void)setBootTextTextColor:(UIColor*)tC;
-(void)setBootTextCornerRadius:(CGFloat)btcr;
-(void)setMaskToBounds:(BOOL)mtb;
-(void)setBootTextStr:(NSString*)btStr;
@end

NS_ASSUME_NONNULL_END
