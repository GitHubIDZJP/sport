//
//  XLBTools.m
//  XIB适配
//
//  Created by 邹俊平 on 2019/11/29.
//  Copyright © 2019 test. All rights reserved.
//
/** 自适应宽高 */

#import "XLBTools.h"
#define ADAPTATION_WIDTH(Width) [UIScreen mainScreen].bounds.size.width * (Width) / 375.0
#define ADAPTATION_HEIGHT(Height) [UIScreen mainScreen].bounds.size.height  * (Height) / 667.0
@implementation XLBTools


#pragma mark - XIB适配
+(void)layoutXib:(UIView *)viewLayout{
    
    for (UIView *view in viewLayout.subviews) {
        CGRect returnRect;
        returnRect.size.width = ADAPTATION_WIDTH(view.frame.size.width);
        returnRect.size.height = ADAPTATION_WIDTH(view.frame.size.height);
        returnRect.origin.x = ADAPTATION_WIDTH(view.frame.origin.x);
        returnRect.origin.y = ADAPTATION_WIDTH(view.frame.origin.y);
        view.frame = returnRect;
        if ([view isKindOfClass:[UITextField class]]) {
            UITextField *viewField = (UITextField *)view;
            if (viewField.text.length > 0) {
                viewField.text = viewField.text;
            }
            if (viewField.placeholder > 0) {
                viewField.placeholder = viewField.placeholder;
            }
            
            __block NSMutableAttributedString *attributedStr = viewField.attributedText.mutableCopy;
            [viewField.attributedText enumerateAttributesInRange:NSMakeRange(0, viewField.text.length) options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
                [attributedStr removeAttribute:NSFontAttributeName range:range];
                UIFont *font = attrs[@"NSFont"];
                CGFloat fontSize = font.pointSize;
                NSString *fontName = font.fontName;
                [attributedStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:fontName  size:(ADAPTATION_WIDTH(fontSize))] range:range];
            }];
            viewField.attributedText = attributedStr;
            
            /** 设置PlaceHolder */
            __block NSMutableAttributedString *placeAttributedStr = viewField.attributedPlaceholder.mutableCopy;
            [viewField.attributedPlaceholder enumerateAttributesInRange:NSMakeRange(0, viewField.placeholder.length) options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
                [placeAttributedStr removeAttribute:NSFontAttributeName range:range];
                UIFont *font = attrs[@"NSFont"];
                CGFloat fontSize = font.pointSize;
                NSString *fontName = font.fontName;
                [placeAttributedStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:fontName  size:(ADAPTATION_WIDTH(fontSize))] range:range];
            }];
            viewField.attributedPlaceholder = placeAttributedStr;
            
        }else if([view isKindOfClass:[UITextView class]]){
            UITextView *textView = (UITextView *)view;
            if (textView.text.length > 0) {
                textView.text = textView.text;
            }
            CGFloat fontSize = textView.font.pointSize;
            NSString *fontName = textView.font.fontName;
            textView.font = [UIFont fontWithName:fontName  size:(ADAPTATION_WIDTH(fontSize))];
            
        }else if ([view isKindOfClass:[UILabel class]]){
            UILabel *viewLabel = (UILabel *)view;
            if (viewLabel.text.length > 0) {
                viewLabel.text = viewLabel.text;
            }
            __block NSMutableAttributedString *attributedStr = viewLabel.attributedText.mutableCopy;
            [viewLabel.attributedText enumerateAttributesInRange:NSMakeRange(0, viewLabel.text.length) options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
                [attributedStr removeAttribute:NSFontAttributeName range:range];
                UIFont *font = attrs[@"NSFont"];
                CGFloat fontSize = font.pointSize;
                NSString *fontName = font.fontName;
                [attributedStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:fontName  size:(ADAPTATION_WIDTH(fontSize))] range:range];
            }];
            viewLabel.attributedText = attributedStr;
        }else if ([view isKindOfClass:[UIButton class]]){
            UIButton *viewButton = (UIButton *)view;
            if (viewButton.currentTitle.length > 0) {
                [viewButton setTitle:viewButton.currentTitle forState:UIControlStateNormal];
            }
            CGFloat fontSize = viewButton.titleLabel.font.pointSize;
            NSString *fontName = viewButton.titleLabel.font.fontName;
            viewButton.titleLabel.font = [UIFont fontWithName:fontName  size:(ADAPTATION_WIDTH(fontSize))];
        }
    }
}
/**
 UIView *zjpSuperView = [[UIView alloc]initWithFrame:CGRectMake(0,ADAPTATION_WIDTH(0),w,64)];
 zjpSuperView.backgroundColor = [UIColor redColor];
 
 */
@end
