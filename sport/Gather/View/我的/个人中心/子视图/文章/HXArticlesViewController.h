//
//  HXArticlesViewController.h
//  QCGlobalSport
//
//  Created by test on 2020/2/12.
//  Copyright © 2020 com.qqty. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HXArticlesViewController : UIViewController
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,copy) NSString *titleStr;
@property(nonatomic,copy)NSArray *dataSource;
@end

NS_ASSUME_NONNULL_END
