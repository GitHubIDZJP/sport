//
//  markCenterView.h
//  Sports
//
//  Created by test on 2020/1/14.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface markCenterView : UIView
@property(nonatomic,strong)UIImageView *BGImg;
@property(nonatomic,strong)UILabel *coinHint;
@property(nonatomic,strong)UILabel *coin;
@property(nonatomic,strong)UILabel *giftPresentHint;
@property(nonatomic,strong)UILabel *giftCount;
-(void)getCoin:(NSString*)coinCount giftCount:(NSString*)gc;

@end

NS_ASSUME_NONNULL_END
