//
//  collectionCell.m
//  Sports
//
//  Created by test on 2020/1/14.
//  Copyright © 2020 test. All rights reserved.
//

#import "collectionCell.h"

@implementation collectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
    //self.userInteractionEnabled = NO;
        
        
        
        self.layer.cornerRadius = 30*KWIDTH;
        self.layer.masksToBounds = YES;
        
        self.bgIamge=[[UIImageView alloc]init];
      //  [self.contentView addSubview:self.bgIamge];
        self.titleLabel=[[UILabel alloc]init];
      //  [self.contentView addSubview:self.titleLabel];
        self.backgroundColor = UIColor.whiteColor;
        
//        for (int i = 0; i< 2; i++) {
//            UIButton *btn = [[UIButton alloc]init];
//            btn.backgroundColor = RandomColor;
//            btn.frame = RECT(10+ i * 90,20,80,70);
//            [self addSubview:btn];
//            if(i == 0){
//               [btn addTarget:self action:@selector(ke:) forControlEvents:1<< 6];
//            }
//            else if (i == 2){
//
//                [btn addTarget:self action:@selector(key:) forControlEvents:1<< 6];
//
//            }
//
//        }
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bgIamge.backgroundColor = UIColor.yellowColor;
    self.bgIamge.frame=CGRectMake(0,0,56*KWIDTH,56*KWIDTH);
    self.titleLabel.frame=CGRectMake(0,70,100*KWIDTH,23*KWIDTH);
    self.titleLabel.alpha=0.5;
    
    self.titleLabel.backgroundColor=[UIColor grayColor];
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
}
//-(void)ke:(UIButton*)sender{
//    NSLog(@"1");
//}
//-(void)key:(UIButton*)sender{
//    NSLog(@"2");
//}
@end
