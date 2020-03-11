//
//  money.h
//  Sports
//
//  Created by test on 2020/1/8.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface money : UIView
@property(nonatomic,strong)UILabel *moneyTitle;

@property(nonatomic,strong)UILabel *moneyCount;
-(void)getprice:(NSString*)p;
@end

NS_ASSUME_NONNULL_END
