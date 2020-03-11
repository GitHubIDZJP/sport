//
//  MCTabBar.m
//  Sports
//
//  Created by test on 2019/12/31.
//  Copyright © 2019 test. All rights reserved.
//

#import "MCTabBar.h"
#define  tabBarCenterBtnY (IS_iPhoneX ? 5.f + 0.f : 5.f)
@implementation MCTabBar



- (instancetype)init{
    if (self = [super init]){
        [self initView];
    }
    return self;
}
- (void)initView{
    _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //  设定button大小为适应图片
    UIImage *normalImage = [UIImage imageNamed:@"centerIconSelect"];
    _centerBtn.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
    [_centerBtn setImage:normalImage forState:UIControlStateNormal];
    //去除选择时高亮
    _centerBtn.adjustsImageWhenHighlighted = NO;
    //根据图片调整button的位置(图片中心在tabbar的中间最上部，这个时候由于按钮是有一部分超出tabbar的，所以点击无效，要进行处理)
    _centerBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - normalImage.size.width)/2.0, - normalImage.size.height/2.0+15*KWIDTH, normalImage.size.width, normalImage.size.height);
    [self addSubview:_centerBtn];
}
//处理超出区域点击无效的问题
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil){
        //转换坐标
        CGPoint tempPoint = [self.centerBtn convertPoint:point fromView:self];
        //判断点击的点是否在按钮区域内
        if (CGRectContainsPoint(self.centerBtn.bounds, tempPoint)){
            //返回按钮
            return _centerBtn;
        }
    }
    return view;
}



@end

