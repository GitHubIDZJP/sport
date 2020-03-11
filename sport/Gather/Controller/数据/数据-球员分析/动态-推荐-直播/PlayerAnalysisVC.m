
//  PlayerAnalysisVC.m
//  Sports
//
//  Created by test on 2020/1/13.
//  Copyright © 2020 test. All rights reserved.
//
#define W   [UIScreen mainScreen].bounds.size.width
#define H   [UIScreen mainScreen].bounds.size.height
#define kScreen_width [UIScreen mainScreen].bounds.size.width
#define kScreen_height [UIScreen mainScreen].bounds.size.height
//#define zjpTest (IS_iPhoneX ? (44.f - 20.f) : 0.f)
#define FWin (IS_iPhoneX ? (  0.f) : -5.f)
#define noiPhoneX (IS_iPhoneX ? (  0.f) : +145.f)
#import "PlayerAnalysisVC.h"
#import "PAHeader.h"
/*
 
 
 
 */

//#import "StaticSegmentControl.h"


/*
 
 
 
 */



#import "LBSegmentControl.h"
 
 

//sub
#import "trendsDataVC.h"
#import "RecommendedData.h"
#import "LiveVC.h"
#import "CustomButtonView.h"
#import "FloatingWindow.h"




@interface PlayerAnalysisVC ()<CustomButtonViewDelegate>
{
    CGFloat btnViewY;
}
@property(nonatomic,strong)CustomButtonView  *customBtnView;
@property(nonatomic,strong)FloatingWindow *jycWindow;//浮窗
@end






@implementation PlayerAnalysisVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.jycWindow.callService = ^(){
        NSLog(@"pk");
        
    };
    self.jycWindow.callService1 =^(){
        NSLog(@"分享");
       
    };
    
    
  //  [self.view addSubview:self.jycWindow];
   
    
    
    
    PAHeader *header = [[PAHeader alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,340*KWIDTH)];
    [self.view addSubview:header];

    header.returnPage = ^(UIButton * resp) {
        NSLog(@"返回之前的页面");
        
        [self.navigationController popViewControllerAnimated:YES];
    };
    
    header.interestBlock = ^(UIButton * sender){
        [self interest:sender];
    };
    
     btnViewY = header.height + header.y;
    
    CustomButtonView *btnView = [[CustomButtonView alloc]initWithFrame:CGRectMake(0,360*KWIDTH+FWin*KWIDTH, kScreen_width, H)];
    btnView.backgroundColor = UIColor.whiteColor; 
    btnView.delegate = self;
    [self.view addSubview:btnView];
    [self addChildVCs];
    
    
    
    
    //默认先选择第一个控制器
    [self CustomView:nil didSelectButtonFrom:0 to:0];
}
-(void)viewWillAppear:(BOOL)animated{
  
    
}
-(void)viewDidDisappear:(BOOL)animated{
   // [self.jycWindow removeFromSuperview];
   
    [self performSelector:@selector(hideJYWindow:) withObject:nil afterDelay:0.1];
    
}
-(void)hideJYWindow:(NSTimer*)hide{
     self.jycWindow.hidden= YES;
    
}
- (void)CustomView:(CustomButtonView *)tabBar didSelectButtonFrom:(int)from to:(int)to
{
    
    
    
    UIViewController *oldVc = self.childViewControllers[0];
    [oldVc.view removeFromSuperview];
    
    UIViewController *newVc = self.childViewControllers[to/1];
    
    newVc.view.frame = CGRectMake(0, btnViewY+ 35, W, H- btnViewY);
    
    
    [self.view addSubview:newVc.view];
    
}
- (void)addChildVCs
{
    trendsDataVC * firstVC = [[trendsDataVC alloc] init];
    RecommendedData * secondVC = [[RecommendedData alloc] init];
    LiveVC * thirdVC = [[LiveVC alloc] init];
     [self addChildViewController: firstVC];
     [self addChildViewController: secondVC];
     [self addChildViewController: thirdVC];
    
      self.jycWindow = [[FloatingWindow alloc]initWithFrame:CGRectMake(kScreenWidth-65, kScreenHeight-1020 *KWIDTH+noiPhoneX, 61, 97) mainImageName:@"FloatingWindow" bgcolor:[UIColor lightGrayColor] animationColor:[UIColor purpleColor]];
    [firstVC.view addSubview:self.jycWindow];
    
      self.jycWindow = [[FloatingWindow alloc]initWithFrame:CGRectMake(kScreenWidth-65, kScreenHeight-1020*KWIDTH+noiPhoneX, 61, 97) mainImageName:@"FloatingWindow" bgcolor:[UIColor lightGrayColor] animationColor:[UIColor purpleColor]];
    
    [secondVC.view addSubview:self.jycWindow];
      self.jycWindow = [[FloatingWindow alloc]initWithFrame:CGRectMake(kScreenWidth-65, kScreenHeight-1020*KWIDTH+noiPhoneX, 61, 97) mainImageName:@"FloatingWindow" bgcolor:[UIColor lightGrayColor] animationColor:[UIColor purpleColor]];
    [thirdVC.view addSubview:self.jycWindow];
    
   
    
    
}

-(void)interest:(UIButton*)inster{
    
    NSLog(@"关注");
    
}


@end
