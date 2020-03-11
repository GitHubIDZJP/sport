//
//  FirstViewController.m
//  SectionChooseVC
//
//  Created by lujh on 2017/3/8.
//  Copyright © 2017年 lujh. All rights reserved.
//




#import "FirstViewController.h"
#define kScreen_width [UIScreen mainScreen].bounds.size.width
#define kScreen_height [UIScreen mainScreen].bounds.size.height
#import "LBSegmentControl.h"
#import "TotalScoreVC.h"
#import "HalfCourtItegralVC.h"
#import "HomeCourtScoreVC.h"
#import "AwayScoreVC.h"
#define deviceIphoneX  (IS_iPhoneX ? (25.f) : 0.f)
@interface FirstViewController ()





@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // self.view.backgroundColor = [UIColor greenColor];
    
    
    
    
    // 创建视图控制器
    TotalScoreVC * firstVC = [[TotalScoreVC alloc] init];
    HalfCourtItegralVC * secondVC = [[HalfCourtItegralVC alloc] init];
    HomeCourtScoreVC * thirdVC = [[HomeCourtScoreVC alloc] init];
    AwayScoreVC *fourth = [[AwayScoreVC alloc]init];
    
    LBSegmentControl * segmentControl = [[LBSegmentControl alloc] initStaticTitlesWithFrame:CGRectMake(0, 20+deviceIphoneX, kScreen_width, 45)];
    segmentControl.titles = @[@"总积分", @"半场积分", @"主场积分",@"客场积分"];
    segmentControl.viewControllers = @[firstVC, secondVC, thirdVC,fourth];
    segmentControl.titleNormalColor = colorWithHexString(@"#999999");
    segmentControl.titleSelectColor = colorWithHexString(@"#4CB13B");
    [segmentControl setBottomViewColor:colorWithHexString(@"#4CB13B")];
    segmentControl.isTitleScale = YES;
    
    [self.view addSubview:segmentControl];
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
}


@end
