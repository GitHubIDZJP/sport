//
//  dataBase.m
//  Sports
//
//  Created by test on 2020/1/9.
//  Copyright © 2020 test. All rights reserved.
//

#import "dataBase.h"
#import "attentionVC.h"
#import "interVC.h"
#import "EuropeVC.h"
#import "AmericaVC.h"
#import "asianVC.h"
#import "oceaniaVC.h"
@interface dataBase()<CBasePageControllerDelegate,CBasePageControllerDataSource>{
    
}
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) UIView *headerView;
@end
@implementation dataBase
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArray = @[@"关注",@"国际",@"欧洲",@"美洲",@"亚洲",@"大洋洲"];
    self.delegate = self;
    self.dataSource = self;
    

    

  self.delegate = self;
  self.dataSource = self;

//self.lineWidth = 2.0;//选中下划线宽度
  self.titleFont = [UIFont systemFontOfSize:16.0];
    self.defaultColor = color(177, 177, 177); //默认字体颜色
    self.chooseColor = color(81, 152, 57);//选中字体颜色
  self.selectIndex = 0;//默认选中第几页

    
    
[self reloadScrollPage];

}
-(NSInteger)numberViewControllersInViewPager:(XLBasePageController *)viewPager
{
    return _titleArray.count;
}

-(UIViewController *)viewPager:(XLBasePageController *)viewPager indexViewControllers:(NSInteger)index
{
    /*
     FullCourseViewController
     FemaleBusinessViewController
     MaleBusinessViewController
     EmotionalloveViewController
     WithdrawalViewController
     EmotionalStressViewController
     
     */
    if (index == 0) {
        attentionVC *first = [[attentionVC alloc] init];
        first.titleStr = _titleArray[index];
        first.index = index;
        return first;
    }else if(index == 1){
        interVC *second = [[interVC alloc] init];
        
        second.titleStr = _titleArray[index];
        second.index = index;
        return second;
    }else if(index == 2){
        EuropeVC *third = [[EuropeVC alloc] init];
        
        third.titleStr = _titleArray[index];
        third.index = index;
        return third;
    }else if(index == 3){
        AmericaVC *fourth = [[ AmericaVC alloc] init];
        fourth.titleStr = _titleArray[index];
        fourth.index = index;
        return fourth;
    }else if (index ==4){
        asianVC *fifth = [[asianVC alloc] init];
        fifth.titleStr = _titleArray[index];
        fifth.index = index;
        return fifth;
    }else if (index == 5){
        oceaniaVC *sixth = [[oceaniaVC alloc]init];
        
        sixth.titleStr = _titleArray[index];
        sixth.index = index;
        return sixth;
    }
    return nil;
}

-(CGFloat)heightForTitleViewPager:(XLBasePageController *)viewPager
{
    return 108*KWIDTH;
}

-(NSString *)viewPager:(XLBasePageController *)viewPager titleWithIndexViewControllers:(NSInteger)index
{
    return self.titleArray[index];
}

-(void)viewPagerViewController:(XLBasePageController *)viewPager didFinishScrollWithCurrentViewController:(UIViewController *)viewController
{
    self.title = viewController.title;
    
}

#pragma mark 预留--可不实现

-(UIView *)headerViewForInViewPager:(XLBasePageController *)viewPager
{
    return self.NavBar;
    return nil;
}

-(CGFloat)heightForHeaderViewPager:(XLBasePageController *)viewPager
{
    //头视图距离顶部的高度
    return 128*KWIDTH;
}
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,  128*KWIDTH)];
        _NavBar.backgroundColor = [UIColor whiteColor];
        
        _NavBar.backgroundColor =  UIColor.whiteColor;//colorWithHexString(@"#FFFFFFFF");
        [self.NavBar setRightButtonIsHidden:YES];
       // self.NavBar.backgroundColor = UIColor.blueColor;
        [self.NavBar setLeftBtnISHidden:YES];
        [self.NavBar setCenterTextColor:[UIColor blackColor]];
       // [self.NavBar setCenterText:@"资料库"];
        UILabel *hint = UILabel.new;
        hint.frame = CGRectMake(100*KWIDTH,18*KWIDTH,SCREEN_WIDTH - 200*KWIDTH,53*KWIDTH);
        hint.textAlignment = NSTextAlignmentCenter;
       hint.text = @"资料库";
        hint.font = [UIFont fontWithName:@"Helvetica-Bold" size:19];
        hint.textColor = UIColor.blackColor;
       // hint.backgroundColor = UIColor.redColor;
        hint.font = Font17;
       
        
        [self.NavBar addSubview:hint];
        
        MTSearchBar *view = [[MTSearchBar alloc]init];
        view.frame = CGRectMake(30*KWIDTH,80*KWIDTH,SCREEN_WIDTH - 60*KWIDTH,64*KWIDTH);
        view.backgroundColor = colorWithHexString(@"#F3F6F4");
        [self.NavBar addSubview:view];
    }
    return _NavBar;
}

@end
