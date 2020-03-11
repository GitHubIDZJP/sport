//
//  ZJPCustomSearchBar.h
//  ZJPsearchBar
//
//  Created by tjl on 2019/10/21.
//  Copyright © 2019 tjl. All rights reserved.
//

#import <UIKit/UIKit.h>



@class ZJPCustomSearchBar;
//协议代理
@protocol ZJPCustomSearchBarDelegate <NSObject>

@optional//可选的

- (BOOL)searchBarShouldBeginEditing:(ZJPCustomSearchBar  *)searchBar;

- (void)searchBarTextDidBeginEditing:(ZJPCustomSearchBar  *)searchBar;

- (BOOL)searchBarShouldEndEditing:(ZJPCustomSearchBar  *)searchBar;

- (void)searchBarTextDidEndEditing:(ZJPCustomSearchBar  *)searchBar;

//- (void)searchBar:(ZJPCustomSearchBar  *)searchBar textDidChange:(NSString *)searchText;
-(void)searchBar:(ZJPCustomSearchBar *)searchBar textDidChange:( NSString *)searchText;

- (void)searchBarSearchButtonClicked:(ZJPCustomSearchBar  *)searchBar;//确定按钮

- (void)searchBarCancelButtonClicked:(ZJPCustomSearchBar  *)searchBar;

@end

@interface ZJPCustomSearchBar : UIView
//文本的颜色
@property (nonatomic,strong)UIColor * textColor;
//字体
@property (nonatomic,strong)UIFont * searBarFont;
//内容
@property (nonatomic,strong)NSString * text;
//背景颜色
@property (nonatomic,strong)UIColor * searBarColor;
//默认文本
@property (nonatomic,copy)NSString * placeholder;
//默认文本的颜色
@property (nonatomic,strong)UIColor * placeholdesColor;
//默认文本字体大小
@property (nonatomic,strong)UIFont * placeholdesFont;
//是否弹出键盘
@property (nonatomic,assign)BOOL isbecomeFirstResponder;
//设置右边按钮的样式
@property (nonatomic,strong)UIImage * deleteImage;
//设置代理
@property (nonatomic,weak)id<ZJPCustomSearchBarDelegate>delegate;
@end


