//
//  DataTeamVC.m
//  Sports
//
//  Created by test on 2020/1/18.
//  Copyright © 2020 test. All rights reserved.
//



#define kScreen_width [UIScreen mainScreen].bounds.size.width
#define kScreen_height [UIScreen mainScreen].bounds.size.height
#import "DataTeamVC.h"
#import "PAHeader.h"
#import "DTHView.h"

#import "LBSegmentControl.h"
//sub
#import "peopleRecommendationVC.h"
#import "BallTeamMember.h"
#import "contestVC.h"
#import "PlayerInformationVC.h"
@interface DataTeamVC ()

@end







@implementation DataTeamVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
  
    
    [self changeTitleColor];
    
    // 创建视图控制器
    peopleRecommendationVC * firstVC = [[peopleRecommendationVC alloc] init];
    BallTeamMember * secondVC = [[BallTeamMember alloc] init];
    contestVC * thirdVC = [[contestVC alloc] init];
    PlayerInformationVC *playerInfo = [[PlayerInformationVC alloc]init];
    
    LBSegmentControl * segmentControl = [[LBSegmentControl alloc] initStaticTitlesWithFrame:CGRectMake(0, self.bgImg.y + self.bgImg.height, kScreen_width, 70*KWIDTH)];
    segmentControl.titles = @[@"推荐", @"球员", @"赛程",@"资料"];
    segmentControl.viewControllers = @[firstVC, secondVC, thirdVC,playerInfo];
    segmentControl.titleNormalColor = colorWithHexString(@"#999999");
    segmentControl.titleSelectColor = colorWithHexString(@"#4CB13B");
    [segmentControl setBottomViewColor:colorWithHexString(@"#4CB13B")];
    segmentControl.isTitleScale = YES;
    
    [self.view addSubview:segmentControl];
    
}
- (IBAction)backPage:(id)sender {
    //[self dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)interestBtn:(id)sender {
    //关注
    
    
    
    
}

-(void)changeTitleColor{
    
    
    
    
}



@end
