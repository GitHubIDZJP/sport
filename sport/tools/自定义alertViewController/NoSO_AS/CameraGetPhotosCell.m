//
//  CameraGetPhotosCell.m
//  TooBrocadeCarp
//
//  Created by tjl on 2019/11/5.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "CameraGetPhotosCell.h"

@implementation CameraGetPhotosCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
       // self.backgroundColor = [UIColor whiteColor];
//        self.layer.cornerRadius = 20*KWIDTH;
//        self.layer.masksToBounds = YES;
        self.selectCamera = [[UILabel alloc]initWithFrame:CGRectMake(50*KWIDTH,0,220*KWIDTH,90*KWIDTH)];
        //self.backgroundColor= [UIColor orangeColor];
        self.selectCamera.textColor = colorWithHexString(@"#333333");
        [self addSubview:self.selectCamera];
        self.selectCamera.textColor= colorWithHexString(@"#333333");
    }
    return self;
    
    

    
    
}
-(void)setConteentDescCamera:(NSString*)camera{
    
    self.selectCamera.text= camera;
    
}
//设置分割线的宽度和高度
//设置分割线的宽度和高度
-(void)setFrame:(CGRect)frame
{
    frame.origin.x =0*KWIDTH;//这里间距为10，可以根据自己的情况调整
    frame.size.width +=0*KWIDTH;
    //frame.size.height -= 5 * frame.origin.x;
    [super setFrame:frame];
}

@end
