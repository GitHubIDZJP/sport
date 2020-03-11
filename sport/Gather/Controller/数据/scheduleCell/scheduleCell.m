//
//  scheduleCell.m
//  Sports
//
//  Created by test on 2020/1/13.
//  Copyright © 2020 test. All rights reserved.
//

#import "scheduleCell.h"

@implementation scheduleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
/**
 @property (weak, nonatomic) IBOutlet UILabel *dateLabel;
 @property (weak, nonatomic) IBOutlet UILabel *teamA;
 @property (weak, nonatomic) IBOutlet UIImageView *teamLogoA;
 @property (weak, nonatomic) IBOutlet UILabel *vsLabel;
 @property (weak, nonatomic) IBOutlet UIImageView *teamLogoB;
 @property (weak, nonatomic) IBOutlet UILabel *teamb;
 
 */
-(void)setDateLabel:(NSString *)dL TeamAlabel:(NSString*)tal  tLogoA:(NSString*)tla vsLabelText:(NSString*)vsText teamLogoB:(NSString*)tlb teambText:(NSString*)tbT{
    
    self.dateLabel.text= dL;
    self.teamA.text = tal;
    self.teamLogoA.image = [UIImage imageNamed:tla];
    self.vsLabel.text = vsText;
    self.teamLogoB.image  = [UIImage imageNamed:tlb];
    self.teamb.text = tbT;
    
    
}

@end
