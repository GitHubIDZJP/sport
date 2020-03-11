//
//  HXUploadButton.m
//  QCGlobalSport
//
//  Created by test on 2020/2/17.
//  Copyright © 2020 com.qqty. All rights reserved.
//

#import "HXUploadButton.h"

@implementation HXUploadButton

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
    
        [self initTopRightCorner];
        
    }
    return self;
}
-(void)initTopRightCorner{
    int w = 30*KWIDTH;
    int h = w;
    self.topRightCorner = UIImageView.new;
    self.topRightCorner.frame = RECT(160*KWIDTH - w/2,self.y+self.height-h/2,w,h);
    self.topRightCorner.image = [UIImage imageNamed:@"RoundButton"];
    //self.backgroundColor = UIColor.redColor;
    [self addSubview:self.topRightCorner];
    
    
    
    
}
/*
- (void)addBorderToLayer:(UIView *)view
{
    CAShapeLayer *border = [CAShapeLayer layer];
    //  线条颜色
    border.strokeColor = [UIColor blackColor].CGColor;
    
    border.fillColor = nil;
    
    border.path = [UIBezierPath bezierPathWithRect:view.bounds].CGPath;
    
    border.frame = view.bounds;
    
    // 不要设太大 不然看不出效果
    border.lineWidth = 1;
    
    border.lineCap = @"square";
    
    //  第一个是 线条长度   第二个是间距    nil时为实线
    border.lineDashPattern = @[@1, @4];
    
    [view.layer addSublayer:border];
}
 */

@end
