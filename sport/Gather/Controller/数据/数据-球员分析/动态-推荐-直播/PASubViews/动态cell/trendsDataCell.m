//
//  trendsDataCell.m
//  Sports
//
//  Created by test on 2020/1/20.
//  Copyright © 2020 test. All rights reserved.
//

#import "trendsDataCell.h"

@implementation trendsDataCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        // 初始化子视图
        
       
      //  self.rightPicture.image = [UIImage imageNamed:@"Xnip2020-02-11_09-14-29"];
        self.rightPicture.backgroundColor = UIColor.redColor;
        
    }
    return self;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setDescText:(NSString*)dt  selBtn:(NSString*)sb supportText:(NSString*)st{
    
    self.describeText.text = dt;
    //self.rightPicture.image = [UIImage imageNamed:rp];
    [self.selectedButton setBackgroundImage:[UIImage imageNamed:sb] forState:0];
    self.ThumbText.text = st;
    
    
    
}
-(void)setrightPictureImg:(NSString*)img{
    self.rightPicture.image = [UIImage imageNamed:img];
}
- (IBAction)addClick:(UIButton *)sender {
    self.addSupportCountBtn(sender);
    
}

@end
