//
//  CustomSegmentView.h
//  masAddTab
//
//  Created by test on 2020/2/3.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+Icon.h"
NS_ASSUME_NONNULL_BEGIN

//协议
@protocol CustomDelegate <NSObject>

- (void)buttonClick:(NSInteger)sender;

- (void)topButtonClick:(NSString *)sender;

@end

@interface CustomSegmentView : UIView

@property (nonatomic, strong) UIColor *cusBkColor;
@property (nonatomic, strong) UIColor *cusSelColor;
@property (nonatomic, strong) NSMutableArray *segmentArray;
@property (nonatomic, strong) UIColor *cusTextColor;
@property (assign) float cusbWidth;
@property (nonatomic, strong) UIColor *cusbColor;
@property (strong, nonatomic) id<CustomDelegate>myDelagte;
//initWithFrame函数扩展
- (id)initWithFrame:(CGRect)frame
       segmentArray:(NSArray *)_array
         background:(UIColor *)_bkColor
      selectedColor:(UIColor *)_selColor
        borderColor:(UIColor *)_bColor
        borderWidth:(float)_bWidth
           textFont:(UIFont *)_font
          textColor:(UIColor *)_textColor
           position:(NSString *)_position;






@end

NS_ASSUME_NONNULL_END
