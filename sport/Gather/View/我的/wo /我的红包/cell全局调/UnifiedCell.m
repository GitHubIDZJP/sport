//
//  UnifiedCell.m
//  Sports
//
//  Created by test on 2020/1/17.
//  Copyright © 2020 test. All rights reserved.
//

#import "UnifiedCell.h"

@implementation UnifiedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFrame:(CGRect)frame{
    CGFloat margin = 30*KWIDTH;
    frame.origin.x += margin;
    frame.size.width -= 60*KWIDTH;
    frame.size.height -=40*KWIDTH;
    [super setFrame:frame];
}
@end
