//
//  DataTeamVC.h
//  Sports
//
//  Created by test on 2020/1/18.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataTeamVC : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *bgImg;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet  UIButton *interestBtn;
@property (weak, nonatomic) IBOutlet UIImageView* headSculpture;
@property (weak, nonatomic) IBOutlet UILabel *teamName;
@property (weak, nonatomic) IBOutlet UILabel *gameDesc;


@end

NS_ASSUME_NONNULL_END
