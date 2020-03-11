//
//  trendsCell.m
//  Sports
//
//  Created by test on 2020/1/17.
//  Copyright © 2020 test. All rights reserved.
//

#import "trendsCell.h"
#define KWIDTH [UIScreen mainScreen].bounds.size.width/750.0
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
@implementation trendsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFrame:(CGRect)frame{
    
    CGFloat margin = 15*KWIDTH;
    frame.origin.x += margin;
    frame.size.width -= 30*KWIDTH;
    frame.size.height -=30*KWIDTH;
    [super setFrame:frame];
}
@end
