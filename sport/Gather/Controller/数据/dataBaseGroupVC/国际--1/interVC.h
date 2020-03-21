//
//  interVC.h
//  Sports
//
//  Created by test on 2020/1/9.
//  Copyright © 2020 test. All rights reserved.
//

//国际
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface interVC : UIViewController
//{
//    NSInteger isSel;
//}
@property(nonatomic,assign)NSInteger isSel;
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,copy) NSString *titleStr;
@property(nonatomic,strong)UITableView *tableView;
//集合视图
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong) UICollectionView *collection;

@end

NS_ASSUME_NONNULL_END
