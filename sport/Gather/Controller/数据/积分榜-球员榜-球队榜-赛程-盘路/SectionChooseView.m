//
//  SectionChooseView.m
//  CommunityService
//
//  Created by lujh on 2017/3/8.
//  Copyright © 2017年 卢家浩. All rights reserved.
//
#define CustomSegmentBtnTag 888
#define CustomSegmentLineViewTag 275
#import "SectionChooseView.h"
#import "setButtonRadius.h"
#import "UIView+BorderLine.h"
#define layerW  2
@interface SectionChooseView ()
{
    setButtonRadius *button;
}
@property (nonatomic, strong) NSArray * titleArray;

@end





@implementation SectionChooseView

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray
{
    if (self = [super initWithFrame:frame]) {
        _titleArray = titleArray;
        if (_titleArray.count <= 0) return self;
        
        self.backgroundColor = [UIColor lightGrayColor];
        _normalBackgroundColor = [UIColor whiteColor];
        _selectBackgroundColor = [UIColor redColor];
        //_borderColor = UIColor.orangeColor;
        _titleNormalColor = [UIColor redColor];
        _titleSelectColor = [UIColor blueColor];
        _selectIndex = 0;
        _normalTitleFont = 14.0f;
        _selectTitleFont = 23.0f;
        
        // 初始化UI界面
        [self setUpSubviews];
    }
    return self;
}

#pragma mark -初始化UI界面

- (void)setUpSubviews
{
    self.clipsToBounds = YES;
    self.layer.borderColor = self.selectBackgroundColor.CGColor;
    
    CGFloat itemWidth = (1.0 * self.frame.size.width -24*KWIDTH) / _titleArray.count;
    for (int i = 0; i < _titleArray.count; i ++) {
        button = [setButtonRadius buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(itemWidth * i +12*KWIDTH, 1, itemWidth, self.frame.size.height-2);
        button.clipsToBounds = YES;
        button.tag = CustomSegmentBtnTag + i;
        
        
        
        
        
       // button.tintColor = [UIColor orangeColor];
         button.clipsToBounds = YES;
        [button.layer setMasksToBounds:YES];
      //  [button.layer setCornerRadius:1.0];
       // [button.layer setBorderWidth:2];//设置边宽
        
         [button borderForColor:colorWithHexString(@"#4CB13B") borderWidth:layerW  borderType:UIBorderSideTypeTop ];
        [button borderForColor:colorWithHexString(@"#4CB13B") borderWidth:layerW  borderType:UIBorderSideTypeLeft ];
         [button borderForColor:colorWithHexString(@"#4CB13B") borderWidth:layerW  borderType:UIBorderSideTypeBottom ];
         [button borderForColor:colorWithHexString(@"#4CB13B") borderWidth:0.5 borderType:UIBorderSideTypeRight];
        /*
         设置边宽的颜色
         
         */
        
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace, (CGFloat[]){76/255.0,177/255.0,59/255.0,1});
        [button.layer setBorderColor:colorref];
        
        [self setBtnTitleNormalOrSelectFont:button buttonTitle:_titleArray[i] state:UIControlStateNormal font:_normalTitleFont color:_titleNormalColor];
        [self setBtnTitleNormalOrSelectFont:button buttonTitle:_titleArray[i] state:UIControlStateSelected font:_selectTitleFont color:_titleSelectColor];
        
        [button setBackgroundImage:[self createImageWithColor:_normalBackgroundColor] forState:UIControlStateNormal];
        [button setBackgroundImage:[self createImageWithColor:_normalBackgroundColor] forState:UIControlStateHighlighted];
        [button setBackgroundImage:[self createImageWithColor:_selectBackgroundColor] forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if(i == 0){
         //   [button borderForCol];
           
            
            
                   [button viewRadius:1.5 RectCorner:UIRectCornerTopLeft | UIRectCornerBottomLeft view:button];
            [button borderForColor:colorWithHexString(@"#4CB13B") borderWidth:0.5 borderType:UIBorderSideTypeRight];
              [button borderForColor:colorWithHexString(@"#4CB13B") borderWidth:3 borderType:UIBorderSideTypeLeft];

               }else if (i ==4){
                   [button viewRadius:1.5 RectCorner:UIRectCornerBottomRight | UIRectCornerTopRight view:button];
                 [button borderForColor:colorWithHexString(@"#4CB13B") borderWidth:3 borderType:UIBorderSideTypeRight];
               }
        
        
        
        
        
        
        [self addSubview:button];
        [self sendSubviewToBack:button];
        
        if (_selectIndex == i) {
            button.selected = YES;
            button.userInteractionEnabled = NO;
            
        }
        
        if (i == _titleArray.count - 1) continue;
       
        
    }
}

#pragma mark -分段按钮点击事件

- (void)buttonClick:(UIButton *)button
{
    if (button.tag - CustomSegmentBtnTag == _selectIndex) return;
    
    UIButton * oldButton = (UIButton *)[self viewWithTag:_selectIndex + CustomSegmentBtnTag];
    if (oldButton) {
        oldButton.selected = NO;
        oldButton.userInteractionEnabled = YES;
    }
    
    button.selected = YES;
    button.userInteractionEnabled = NO;
    
    _selectIndex = button.tag - CustomSegmentBtnTag;
    
    if (_delegate && [_delegate respondsToSelector:@selector(SectionSelectIndex:)]) {
        [_delegate SectionSelectIndex:_selectIndex];
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
}
- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}
//-(void)setBorderColor:(UIColor*)borderColor
//{
//    _borderColor = borderColor;
//    self.layer.borderColor = borderColor.CGColor;
//
//}
#pragma mark -设置分段按钮背景颜色

- (void)setNormalBackgroundColor:(UIColor *)normalBackgroundColor
{
    if (normalBackgroundColor == _normalBackgroundColor) return;
    
    _normalBackgroundColor = normalBackgroundColor;
    for (int i = 0; i < self.titleArray.count; i ++) {
        UIButton * button = (UIButton *)[self viewWithTag:CustomSegmentBtnTag + i];
        if (button) {
            [button setBackgroundImage:[self createImageWithColor:normalBackgroundColor] forState:UIControlStateNormal];
            [button setBackgroundImage:[self createImageWithColor:normalBackgroundColor] forState:UIControlStateHighlighted];
        }
    }
}

- (void)setSelectBackgroundColor:(UIColor *)selectBackgroundColor
{
    if (selectBackgroundColor == _selectBackgroundColor) return;
    
    _selectBackgroundColor = selectBackgroundColor;
    for (int i = 0; i < self.titleArray.count; i ++) {
        UIButton * button = (UIButton *)[self viewWithTag:CustomSegmentBtnTag + i];
        if (button) {
            [button setBackgroundImage:[self createImageWithColor:selectBackgroundColor] forState:UIControlStateSelected];
        }
        
        UIView * lineView = [self viewWithTag:CustomSegmentLineViewTag + i];
        if (lineView) {
            lineView.backgroundColor = selectBackgroundColor;
        }
    }
    
    self.layer.borderColor = selectBackgroundColor.CGColor;
}

#pragma mark -设置字体颜色

- (void)setTitleNormalColor:(UIColor *)titleNormalColor
{
    if (titleNormalColor == _titleNormalColor) return;
    
    _titleNormalColor = titleNormalColor;
    for (int i = 0; i < self.titleArray.count; i ++) {
        UIButton * button = (UIButton *)[self viewWithTag:CustomSegmentBtnTag + i];
        if (button) {
            
            [self setBtnTitleNormalOrSelectFont:button buttonTitle:_titleArray[i] state:UIControlStateNormal font:_normalTitleFont color:titleNormalColor];
        }
    }
}

- (void)setTitleSelectColor:(UIColor *)titleSelectColor
{
    if (titleSelectColor == _titleSelectColor) return;
    
    _titleSelectColor = titleSelectColor;
    for (int i = 0; i < self.titleArray.count; i ++) {
        UIButton * button = (UIButton *)[self viewWithTag:CustomSegmentBtnTag + i];
        if (button) {
            
            [self setBtnTitleNormalOrSelectFont:button buttonTitle:_titleArray[i] state:UIControlStateSelected font:_selectTitleFont color:titleSelectColor];
        }
    }
}

#pragma mark -设置字体大小

- (void)setNormalTitleFont:(CGFloat)normalTitleFont
{
    if (normalTitleFont == _normalTitleFont) return;
    
    _normalTitleFont = normalTitleFont;
    for (int i = 0; i < self.titleArray.count; i ++) {
        UIButton * button = (UIButton *)[self viewWithTag:CustomSegmentBtnTag + i];
        if (button) {
            
            [self setBtnTitleNormalOrSelectFont:button buttonTitle:_titleArray[i] state:UIControlStateNormal font:normalTitleFont color:_titleNormalColor];
        }
    }
}
- (void)setSelectTitleFont:(CGFloat)selectTitleFont
{
    if (selectTitleFont == _selectTitleFont) return;
    
    _selectTitleFont = selectTitleFont;
    for (int i = 0; i < self.titleArray.count; i ++) {
        UIButton * button = (UIButton *)[self viewWithTag:CustomSegmentBtnTag + i];
        if (button) {
            
            [self setBtnTitleNormalOrSelectFont:button buttonTitle:_titleArray[i] state:UIControlStateSelected font:selectTitleFont color:_titleSelectColor];
        }
    }
}

- (void)setBtnTitleNormalOrSelectFont:(UIButton *)button buttonTitle:(NSString *)buttonTitle state:(UIControlState)state font:(CGFloat )font color:(UIColor *)color
{
    NSDictionary * dic = @{
                           NSFontAttributeName : [UIFont fontWithName:@"Helvetica" size:font],
                           NSForegroundColorAttributeName : color
                           };
    NSAttributedString * attributedTitle = [[NSAttributedString alloc] initWithString:buttonTitle attributes:dic];
    [button setAttributedTitle:attributedTitle forState:state];
}

#pragma mark -选中的item

- (void)setSelectIndex:(NSInteger)selectIndex
{
    if (selectIndex >= _titleArray.count || _selectIndex == selectIndex) {
        
        // 首次进入加载第一个界面通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ABC" object:nil];
        
    };
    
    _selectIndex = selectIndex;
    
    for (int i = 0; i < _titleArray.count; i ++) {
        UIButton * button = (UIButton *)[self viewWithTag:CustomSegmentBtnTag + i];
        if (button) {
            button.selected = selectIndex == i ? YES : NO;
            button.userInteractionEnabled = selectIndex == i ? NO : YES;
        }
    }
}

- (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

@end
