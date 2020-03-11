//
//  scheduleCell.h
//  Sports
//
//  Created by test on 2020/1/13.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface scheduleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *teamA;
@property (weak, nonatomic) IBOutlet UIImageView *teamLogoA;
@property (weak, nonatomic) IBOutlet UILabel *vsLabel;
@property (weak, nonatomic) IBOutlet UIImageView *teamLogoB;
@property (weak, nonatomic) IBOutlet UILabel *teamb;
-(void)setDateLabel:(NSString *)dL TeamAlabel:(NSString*)tal  tLogoA:(NSString*)tla vsLabelText:(NSString*)vsText teamLogoB:(NSString*)tlb teambText:(NSString*)tbT;

@end


