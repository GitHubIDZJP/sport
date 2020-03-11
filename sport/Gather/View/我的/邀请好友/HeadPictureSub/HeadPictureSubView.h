//
//  HeadPictureSubView.h
//  Sports
//
//  Created by test on 2020/1/17.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeadPictureSubView : UIView
@property(nonatomic,strong)UIImageView *img;
@property(nonatomic,strong)UILabel *imgDesc;
@property(nonatomic,strong)UILabel *numOfPeople;
@property(nonatomic,strong)UILabel *suffix;
-(void)setImgNamePath:(NSString*)imgN imgDescText:(NSString*)imgDT peopleNumbers:(NSString*)pn suffixText:(NSString*)sT;
-(void)setPeopleTag:(int)TAG;
@end
NS_ASSUME_NONNULL_END
