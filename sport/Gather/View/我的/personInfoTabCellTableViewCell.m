//
//  personInfoTabCellTableViewCell.m
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/16.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "personInfoTabCellTableViewCell.h"

@implementation personInfoTabCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
//-(UIView *)filletView
//{
//     if(!_filletView)
//     {
//
//
//         //圆角view
//         _filletView = [[UIView alloc]init];
//         _filletView.layer.cornerRadius  = 10*KWIDTH;
//         _filletView.layer.masksToBounds = YES;
//
//     }
//    return  _filletView;
//
//}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //创建成功则t给cell添加需要的子视图
        leftHintText = [[UILabel alloc] init];
        [self.contentView addSubview:leftHintText];
        CommentText = [[UILabel alloc] init];
        [self.contentView addSubview:CommentText];
        [self setUpUI];
       // self.backgroundColor =UIColor.clearColor;
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //set frame
    
    //w 90 h 23  y  39 x 35
    
    leftHintText.frame = RECT(35*KWIDTH,39*KWIDTH,120*KWIDTH,23*KWIDTH);
    leftHintText.textColor= QCColor(51,51, 51);
    leftHintText.font = Font14;
    leftHintText.textAlignment = NSTextAlignmentLeft;
    
    CGFloat w = 400*KWIDTH;
    CommentText.frame = RECT(self.bounds.size.width- 64*KWIDTH  - w,leftHintText.frame.origin.y,w,leftHintText.frame.size.height);
    CommentText.textAlignment= NSTextAlignmentRight;
    CommentText.textColor = QCColor(51,51, 51);
    CommentText.font = Font14;
}
-(void)setUpUI{
    
    // self.backgroundView = self.filletView;
    
   // [self setNeedsUpdateConstraints];
    
}
-(void)setleftHintText:(NSString *)text rightCommentText:(NSString*)descriptionText{
    leftHintText.text  = text;
    CommentText.text = descriptionText;
    
}

//设置cell距离左右的距离
- (void)setFrame:(CGRect)frame{
     CGFloat margin = 10*KWIDTH;
    frame.origin.x += margin;
    frame.size.width -= 2 * margin;
    [super setFrame:frame];
    self.filletView.frame = self.bounds;
}

@end
