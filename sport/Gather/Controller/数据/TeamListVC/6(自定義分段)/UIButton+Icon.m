//
//  UIButton+Icon.m
//  masAddTab
//
//  Created by test on 2020/2/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "UIButton+Icon.h"

@implementation UIButton (Icon)

- (void)setImageWithTitle:(UIImage *)image withTitle:(NSString *)title position:(NSString *)_position font:(UIFont *)_font forState:(UIControlState)stateType{
    CGSize titleSize = [title sizeWithFont:[UIFont systemFontOfSize:11.0f]];
    [self.imageView setContentMode:UIViewContentModeCenter];
    
    if([_position isEqualToString:@"left"]){
        [self setImageEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2, 10.0, 0.0, 0)];
    }else if([_position isEqualToString:@"top"]){
        [self setImageEdgeInsets:UIEdgeInsetsMake(5.0, 0.0, 20.0, -titleSize.width)];
    }else if([_position isEqualToString:@"right"]){
        [self setImageEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2, titleSize.width + 25, 0.0, 0.0)];
    }
    
    
    [self setImage:image forState:stateType];
    
    [self.titleLabel setContentMode:UIViewContentModeCenter];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setFont:_font];
    
    if([_position isEqualToString:@"left"]){
        [self setTitleEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2,
                                                  image.size.width,
                                                  0.0,
                                                  0.0)];
    }else if([_position isEqualToString:@"top"]){
        [self setTitleEdgeInsets:UIEdgeInsetsMake(30.0,
                                                  -image.size.width,
                                                  0.0,
                                                  0.0)];
    }else if([_position isEqualToString:@"right"]){
        [self setTitleEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2,
                                                  -40.0,
                                                  0.0,
                                                  0)];
    }
    
    
    [self setTitle:title forState:stateType];
}


@end
