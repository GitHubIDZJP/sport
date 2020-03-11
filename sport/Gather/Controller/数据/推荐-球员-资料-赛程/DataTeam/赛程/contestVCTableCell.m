//
//  contestVCTableCell.m
//  Sports
//
//  Created by test on 2020/1/18.
//  Copyright © 2020 test. All rights reserved.
//

#import "contestVCTableCell.h"

@implementation contestVCTableCell

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
       // self.compareLabel.text   =
         NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"VS" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
         
        self.compareLabel.attributedText = string;
    }
    return self;
}
-(void)setTeamJName:(NSString*)jn TeamYName:(NSString*)yn TeamJLogo:(NSString*)jl TeamYLogo:(NSString*)Yl{
    
    
    
    self.teamJ.text = jn;
    self.teamY.text = yn;
    self.TeamJLogo.image = [UIImage imageNamed:jl];
    self.TeamYLogo.image = [UIImage imageNamed:Yl];
    
    
    
}
@end
