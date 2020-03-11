//
//  CBasePageController.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/26.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBasePageController;



#pragma mark View Pager Delegate
@protocol  CBasePageControllerDelegate <NSObject>
@optional
///返回当前显示的视图控制器
-(void)viewPagerViewController:(CBasePageController *)viewPager didFinishScrollWithCurrentViewController:(UIViewController *)viewController;
///返回当前将要滑动的视图控制器
-(void)viewPagerViewController:(CBasePageController *)viewPager willScrollerWithCurrentViewController:(UIViewController *)ViewController;
@end



#pragma mark View Pager DataSource
@protocol CBasePageControllerDataSource <NSObject>
@required
-(NSInteger)numberViewControllersInViewPager:(CBasePageController *)viewPager;
-(UIViewController *)viewPager:(CBasePageController *)viewPager indexViewControllers:(NSInteger)index;
-(NSString *)viewPager:(CBasePageController *)viewPager titleWithIndexViewControllers:(NSInteger)index;

@optional
///设置控制器标题按钮的样式,不设置为默认
-(UIButton *)viewPager:(CBasePageController *)viewPager titleButtonStyle:(NSInteger)index;
-(CGFloat)heightForTitleViewPager:(CBasePageController *)viewPager;

///预留数据源
-(UIView *)headerViewForInViewPager:(CBasePageController *)viewPager;
-(CGFloat)heightForHeaderViewPager:(CBasePageController *)viewPager;
@end

@interface CBasePageController : UIViewController
@property (nonatomic,weak) id<CBasePageControllerDataSource> dataSource;
@property (nonatomic,weak) id<CBasePageControllerDelegate> delegate;
///刷新
-(void)reloadScrollPage;

///默认选中
@property(nonatomic,assign) NSInteger selectIndex;

///按钮下划线的高度 字体大小 默认颜色  选中颜色
@property (nonatomic,assign) CGFloat lineWidth;
@property (nonatomic,strong) UIFont *titleFont;
@property (nonatomic,strong) UIColor *defaultColor;
@property (nonatomic,strong) UIColor *chooseColor;

@end

#pragma mark 标题按钮
@interface CBasePageTitleButton : UIButton

@property (nonatomic,assign) CGFloat buttonlineWidth;



@end
