//
//  MyCollectionViewCell.m
//  UICollectionView
//
//  Created by mac on 2017/11/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
      
        self.layer.cornerRadius= 5;
        self.layer.masksToBounds = YES;
        self.backgroundColor = color(242, 242, 242);

        self.titleLabel=[[UILabel alloc]init];
        self.titleLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightMedium];
        self.titleLabel.textColor = QCColor(51, 51, 51);
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.frame=CGRectMake(0,0,self.width,self.height);
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
}
-(void)setData:(NSString*)d{
    self.titleLabel.text = d;
}
@end
