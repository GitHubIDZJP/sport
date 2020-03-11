//
//  MyButton.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/24.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyButton : UIButton

//label--1
@property (nonatomic,strong) UILabel *titles;
//label--2
@property (nonatomic,strong) UILabel  *titleData;//动态的

-(void)setTitleContext:(NSString*)context titleData:(NSString*)tD;
@end

NS_ASSUME_NONNULL_END
