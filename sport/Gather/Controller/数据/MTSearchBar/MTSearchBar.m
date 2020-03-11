//
//  MTSearchBar.m
//  Sports
//
//  Created by test on 2020/1/19.
//  Copyright © 2020 test. All rights reserved.
//

#import "MTSearchBar.h"

@implementation MTSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = colorWithHexString(@"#F3F6F4");
        self.layer.cornerRadius = 32*KWIDTH;
        self.layer.masksToBounds = YES;
        self.size = CGSizeMake(300, 30);
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"请输入国家或相关的赛事";
    //    self.attributedPlaceholder = [[NSAttributedString alloc]initWithString: @"Placeholder" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
        //iOS下已经放弃此方法
       // [self setValue:[UIFont  boldSystemFontOfSize:12]forKeyPath:@"_placeholderLabel.font"];
        
        // 提前在Xcode上设置图片中间拉伸
       // self.background = [UIImage imageNamed:@"圆角矩形 1@2x"];
        
        // 通过init初始化的控件大多都没有尺寸
        UIImageView *searchIcon = [[UIImageView alloc] init];
        searchIcon.image = [UIImage imageNamed:@"圆角矩形 1@2x"];
        // contentMode：default is UIViewContentModeScaleToFill，要设置为UIViewContentModeCenter：使图片居中，防止图片填充整个imageView
        searchIcon.contentMode = UIViewContentModeCenter;
        searchIcon.size = CGSizeMake(30, 30);
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

+(instancetype)searchBar
{
    return [[self alloc] init];
}

@end
