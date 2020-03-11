//
//  HXNewsMainZuQiuListCell.m
//  QCGlobalSport
//
//  Created by HuXin on 2020/1/17.
//  Copyright © 2020 com.qqty. All rights reserved.
//

#import "HXNewsMainZuQiuListCell.h"

@interface HXNewsMainZuQiuListCell()
@property (weak, nonatomic) IBOutlet UILabel *tedian1;
@property (weak, nonatomic) IBOutlet UILabel *tedian2;

@end

@implementation HXNewsMainZuQiuListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.tedian1.layer.borderWidth = 0.5;
    self.tedian1.layer.borderColor = QCColor(76, 177, 59).CGColor;
    self.tedian1.layer.cornerRadius = 2;
    
    self.tedian2.layer.borderWidth = 0.5;
    self.tedian2.layer.borderColor = QCColor(76, 177, 59).CGColor;
    self.tedian2.layer.cornerRadius = 2;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
