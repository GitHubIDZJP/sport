//
//  teamBtn.h
//  Sports
//
//  Created by test on 2020/1/18.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface teamBtn : UIButton


@property(nonatomic,strong)UIImageView *img;
@property(nonatomic,strong)UILabel *ballName;
@property(nonatomic,strong)UILabel *ballNumber;
-(void)ballImgNmae:(NSString*)iName ballName:(NSString*)bN nNmmber:(NSString*)ballName;


@end

NS_ASSUME_NONNULL_END
