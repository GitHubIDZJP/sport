//
//  publishPictureView.m
//  TooBrocadeCarp
//
//  Created by tjl on 2019/11/5.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "publishPictureView.h"

@implementation publishPictureView


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled= YES;
        //self.backgroundColor = colorWithHexString(@"#333333");
        CGFloat m_l_p = 150*KWIDTH;
        _parentView = [[UIView alloc]initWithFrame:CGRectMake(m_l_p,300*KWIDTH,SCREEN_WIDTH - 2* m_l_p,182*KWIDTH)];
        _parentView.backgroundColor = colorWithHexString(@"#FFFFFF");
        [_parentView rounded:15*KWIDTH];
        [self addSubview:_parentView];
        CGFloat shootX = 0*KWIDTH;
        
        
        
        
        
        
        
        _shoot = [[UIButton alloc]initWithFrame:CGRectMake(shootX,0,_parentView.width- 2* shootX-90*KWIDTH,90*KWIDTH)];
        _shoot.backgroundColor = [UIColor whiteColor];
        //_shoot.titleLabel.text = NSTextAlignmentLeft;
        _shoot.titleLabel.font= Font13;
        _shoot.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _shoot.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        _shoot.showsTouchWhenHighlighted = YES;
        [_shoot setTitleColor:colorWithHexString(@"#333333") forState:normal];
        //拍摄获取照片
        [_shoot addTarget:self action:@selector(takePhoto:) forControlEvents:1 << 6];
        [_parentView addSubview:_shoot];
        
        [_shoot setTitle:@"拍摄" forState:UIControlStateNormal];
        CGFloat linerH = 2*KWIDTH;
        _liner =[[UILabel alloc]initWithFrame:RECT(shootX,_shoot.y + _shoot.height+ linerH,_parentView.width,linerH)];
        _liner.backgroundColor = colorWithHexString(@"#FFE5E5E5");
        [_parentView addSubview:_liner];
        _albumSelection= [[UIButton alloc]initWithFrame:CGRectMake(shootX, _liner.y + _liner.height, _parentView.width, _shoot.height)];
        _albumSelection.backgroundColor = [UIColor whiteColor];
       
        _albumSelection.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _albumSelection.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
         [_albumSelection setTitleColor:colorWithHexString(@"#333333") forState:normal];
        _albumSelection.showsTouchWhenHighlighted = YES;
        _albumSelection.titleLabel.font= Font13;
        [_albumSelection setTitle:@"从相册获取" forState:UIControlStateNormal];
        //相册获取
        [_albumSelection addTarget:self action:@selector(albumAcquisition:) forControlEvents:1 << 6];
        [_parentView addSubview:_albumSelection];
        
        _selectCamera =[[UILabel alloc]initWithFrame:RECT(_parentView.width - 90*KWIDTH,_shoot.y,70*KWIDTH,_shoot.height)];
        //_selectCamera.backgroundColor = colorWithHexString(@"#FFE5E5E5");
        _selectCamera.textColor = colorWithHexString(@"#999999");
       // _selectCamera.backgroundColor = [UIColor redColor];
        _selectCamera.text = @"照片";
       // _selectCamera.textColor = [UIColor yellowColor];
        _selectCamera.font  = Font11;
        _selectCamera.textAlignment = NSTextAlignmentRight;
        [_parentView addSubview:_selectCamera];
        
        
        
    
        
        
        
    }
    return self;
}
-(void)takePhoto:(UIButton*)getPic{
    self.shootMyBlock();
}
-(void)albumAcquisition:(UIButton*)getPicture{
    self.albumSelectionMyBlock();
}
@end
