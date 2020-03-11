//
//  mineBarItemViewController.h
//  Sports
//
//  Created by test on 2019/12/31.
//  Copyright © 2019 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mineHeaderView.h"

NS_ASSUME_NONNULL_BEGIN

@interface mineBarItemViewController : UIViewController
@property(nonatomic,strong)UIView *scrSuperView;
@property(nonatomic,retain)mineHeaderView *firstLevelView;
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong) UICollectionView *collection;
@property(nonatomic,strong)NSMutableArray *arrVC;
@property(nonatomic,strong)UIView *freightView;



@end

NS_ASSUME_NONNULL_END
