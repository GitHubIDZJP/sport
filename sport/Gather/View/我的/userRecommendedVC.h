//
//  userRecommendedVC.h
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#pragma mark 我的推荐
#import <UIKit/UIKit.h>
#import "customNavigationBar.h"
NS_ASSUME_NONNULL_BEGIN

@interface userRecommendedVC : UIViewController
{
    NSString *stringInt;
}
@property(nonatomic,copy)NSArray *dataSource;
@property(nonatomic,strong)customNavigationBar *NavBar;
@end

NS_ASSUME_NONNULL_END
