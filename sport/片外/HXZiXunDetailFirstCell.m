//
//  HXZiXunDetailFirstCell.m
//  QCGlobalSport
//
//  Created by HuXin on 2020/1/17.
//  Copyright © 2020 com.qqty. All rights reserved.
//

#import "HXZiXunDetailFirstCell.h"

@interface HXZiXunDetailFirstCell()
@property (weak, nonatomic) IBOutlet UILabel *tedian1;
@property (weak, nonatomic) IBOutlet UILabel *tedian2;
@property (weak, nonatomic) IBOutlet UIView *headBgView;
@property (weak, nonatomic) IBOutlet UIButton *readBtn;

@end

@implementation HXZiXunDetailFirstCell


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"initWithCoder");
        [self initViews];
    }
    return self;
}

- (void)initViews {
    CAGradientLayer *gl1 = [CAGradientLayer layer];
    gl1.frame = self.readBtn.frame;
    gl1.startPoint = CGPointMake(0, 1);
    gl1.endPoint = CGPointMake(1, 1);
    gl1.colors = @[(__bridge id)[UIColor colorWithRed:160/255.0 green:201/255.0 blue:51/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:20/255.0 green:160/255.0 blue:62/255.0 alpha:1.0].CGColor];
    gl1.locations = @[@(0.0),@(1.0f)];
    
    [self.contentView.layer addSublayer:gl1];
    self.readBtn.layer.cornerRadius = 5;
    
    CAGradientLayer *gl2 = [CAGradientLayer layer];
    gl2.frame = self.headBgView.frame;
    gl2.startPoint = CGPointMake(1, 1);
    gl2.endPoint = CGPointMake(1, 0);
    gl2.colors = @[(__bridge id)[UIColor colorWithRed:160/255.0 green:201/255.0 blue:51/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:20/255.0 green:160/255.0 blue:62/255.0 alpha:1.0].CGColor];
    gl2.locations = @[@(0.0),@(1.0f)];
    [self.contentView.layer addSublayer:gl2];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    NSLog(@"awakeFromNib");
  
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
