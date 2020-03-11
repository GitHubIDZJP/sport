//
//  UISegmentedControl+Style_OC.h
//  Sport
//
//  Created by test on 2020/2/25.
//  Copyright © 2020 test. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISegmentedControl (Style_OC)
/// UISegmentedControl 将iOS13风格转化成iOS12之前的风格样式
- (void)ensureiOS12Style;
@end

NS_ASSUME_NONNULL_END
