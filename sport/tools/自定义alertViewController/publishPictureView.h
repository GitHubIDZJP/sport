//
//  publishPictureView.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/11/5.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface publishPictureView : UIView
@property(nonatomic,strong)UIView *parentView;
@property(nonatomic,strong)UIButton *shoot;//
@property(nonatomic,strong)UILabel *liner;
@property(nonatomic,strong)UIButton *albumSelection;//相册选择
@property(nonatomic,strong)UILabel *selectCamera;
@property(nonatomic,copy)void(^shootMyBlock)(void);
@property(nonatomic,copy)void(^albumSelectionMyBlock)(void);

/*
 思路：
 
 
 定义一个父视图
 里面 按钮 label
 
 
 */
@end


NS_ASSUME_NONNULL_END

