//
//  UISegmentedControl+adapter.m
//  sport
//
//  Created by test on 2020/3/6.
//  Copyright © 2020 test. All rights reserved.
//

#import "UISegmentedControl+adapter.h"

//#import <AppKit/AppKit.h>

#define color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@implementation UISegmentedControl (adapter)
- (void)segmentedIOS13Style {
    
        if (@available(iOS 13, *)) {
        
                UIColor *tintColor = [self tintColor];
        
                UIImage *tintColorImage = [self imageWithColor:tintColor];
                [self setBackgroundImage:[self imageWithColor:self.backgroundColor ? self.backgroundColor : [UIColor clearColor]] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
                [self setBackgroundImage:tintColorImage forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        
                [self setBackgroundImage:[self imageWithColor:[tintColor colorWithAlphaComponent:0.2]] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        
                [self setBackgroundImage:tintColorImage forState:UIControlStateSelected|UIControlStateSelected barMetrics:UIBarMetricsDefault];
        //不选中颜色
                [self setTitleTextAttributes:@{NSForegroundColorAttributeName: color(20,20,30) , NSFontAttributeName: [UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
        //选中
      
         [self setTitleTextAttributes:@{NSForegroundColorAttributeName: color(100,20,230) , NSFontAttributeName: [UIFont systemFontOfSize:10]} forState:UIControlStateSelected];
        
                [self setDividerImage:tintColorImage forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
                self.layer.borderWidth = 1;
        
                self.layer.borderColor = [tintColor CGColor];
        
              self.selectedSegmentTintColor = tintColor;
        
            }
    
}

- (UIImage *)imageWithColor: (UIColor *)color {
    
        CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
        UIGraphicsBeginImageContext(rect.size);
    
        CGContextRef context = UIGraphicsGetCurrentContext();
    
        CGContextSetFillColorWithColor(context, [color CGColor]);
    
        CGContextFillRect(context, rect);
    
        UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
        UIGraphicsEndImageContext();
    
        return theImage;
    
}
@end
