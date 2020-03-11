//
//  ZJPSortView.h
//  Sports
//
//  Created by test on 2020/2/20.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJPSortView : UIView

@property (strong, nonatomic) NSMutableArray * titlesArray; //按钮显示文字数组

@property (assign, nonatomic) NSInteger columnCount; // 按钮列数

@property (assign, nonatomic) CGFloat columnMargin; // 按钮列间隔

@property (strong, nonatomic) UIColor * titlesColor; // 按钮文字颜色

//实例类型-->
+ (instancetype)sortView;//表示某个方法返回的未知类型的Objective-C对象。
//表示返回一个可变拖拽实例对象
+ (instancetype)sortViewWithTitlesArray:(NSMutableArray *)titlesArray;
@end

NS_ASSUME_NONNULL_END
