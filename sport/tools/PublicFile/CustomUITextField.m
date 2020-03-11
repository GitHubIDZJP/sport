//
//  CustomUITextField.m
//  Sports
//
//  Created by test on 2020/1/6.
//  Copyright © 2020 test. All rights reserved.
//

#import "CustomUITextField.h"
#import <objc/runtime.h>
//
@interface CustomUITextField()
{
    
}
@property(nonatomic,strong)UILabel *line;
@end
@implementation CustomUITextField
//- (void)drawRect:(CGRect)rect {
//
//    context  = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, color(236, 236, 237).CGColor);
//
//    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame)-1, CGRectGetWidth(self.frame), 3));
//}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        _hintText = [[UILabel alloc]initWithFrame:CGRectMake(20*KWIDTH,34*KWIDTH,200*KWIDTH,30*KWIDTH)];
        _hintText.textAlignment = NSTextAlignmentLeft;
        _hintText.font = Font12;
        _hintText.textColor = colorWithHexString(@"#333333");
        [self addSubview:_hintText];
        [self changePlaceholderColorOrFontSize];
        self.line = line;
        [self addSubview:self.line];
        
    }
    return self;
    
}
-(UILabel*)line{
    
    if(!_line){
        _line = UILabel.new;
        _line.frame = RECT(0,self.height - 2*KWIDTH,self.width,2*KWIDTH);
        _line.backgroundColor = color(240, 240, 240);
        
    }
    return _line;
}
-(Boolean)setHidden:(Boolean)isOn{
    
//    self.line.hidden = isOn;
//    return isOn;

    _line.hidden = isOn;
    return isOn;
}
-(void)changePlaceholderColorOrFontSize{
   

    if (@available(iOS 13.0 , *)) {

       
        NSString *holderText = @"请输入密码！";
        NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:holderText];
        [placeholder addAttribute:NSForegroundColorAttributeName
                      value:color(153, 153, 153)
                      range:NSMakeRange(0, holderText.length)];
        [placeholder addAttribute:NSFontAttributeName
                      value:[UIFont boldSystemFontOfSize:12]
                      range:NSMakeRange(0, holderText.length)];
        self.attributedPlaceholder = placeholder;
       
       
        
       
               }else{

                   
                   [self setValue:colorWithHexString(@"#999999") forKeyPath:@"_placeholderLabel.textColor"];
                   [self setValue:Font12 forKeyPath:@"_placeholderLabel.font"];
                   
               }
    
    
     
    
}
-(void)setHintText:(NSString *)ht{
    _hintText.text = ht;
    
}


- (CGRect)textRectForBounds:(CGRect)bounds{
    CGFloat y = 60*KWIDTH;
    return CGRectInset(CGRectMake(20*KWIDTH,bounds.origin.y + y,self.width,self.height), 0*KWIDTH, 0);
}
// 光标的距离设置
-(CGRect)editingRectForBounds:(CGRect)bounds{
   // return  CGRectInset(bounds, LAYOUT_SIZESCALE_PORTRAIT(20, 20).width, 0);
    CGFloat y = 60*KWIDTH;
    return CGRectInset(CGRectMake(bounds.origin.x,bounds.origin.y + y,self.width,self.height), 20*KWIDTH, 0);
  
}
- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    return CGRectMake(20*KWIDTH, 30*KWIDTH , self.bounds.size.width, self.bounds.size.height);
}

//-(void)setPlaceholder:(NSString *)placeholder
//{
//
//    self.placeholder = placeholder;
//
//}
@end
