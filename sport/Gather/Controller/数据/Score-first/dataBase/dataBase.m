//
//  dataBase.m
//  Sports
//
//  Created by test on 2020/1/9.
//  Copyright © 2020 test. All rights reserved.
//

#import "dataBase.h"
#import "attentionVC.h"//关注
#import "interVC.h"//国际
#import "EuropeVC.h"//欧洲
#import "asianVC.h"//亚洲
#import "oceaniaVC.h"//大洋洲
#import "AfricaViewController.h"//非洲
#import "americasViewController.h"//美洲
@interface dataBase()<CBasePageControllerDelegate,CBasePageControllerDataSource>{
    NSDictionary *sd;
    NSString *s;
}
@property (nonatomic,strong) NSString *LevelStr;
@property (nonatomic,strong) NSArray *LevelArr;//要用for时记得用可变数组
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
        NSMutableDictionary *parameter =[[NSMutableDictionary alloc]init];
                    requestPost(@"https://sports.hxweixin.top/api/v1/fbinfo/infoNav", parameter, ^(NSError *error) {
                        NSLog(@"解析失败");
                    }, ^(NSDictionary *dic) {
                        NSLog(@"解析成功");
//                        self->s =dic[@"data"][0][@"continent_name"][0];
//                        NSLog(@"第一层数组:%@",self->s);
                         NSString *str2 = @"关注赛事";
                        if([dic[@"code"] intValue] == 200){
                               self.LevelArr = [NSMutableArray array];
                            for(int  i = 0;i < [dic[@"data"]count];i++){
                               
                                self.LevelStr = [NSString stringWithFormat:@"%@",dic[@"data"][i][@"continent_name"][0]];
                                 //NSLog(@"字典-->:%@",self.LevelStr);
                                NSString *str = @"关注赛事";
                                if([str isEqualToString:str2]){
                                   // [self.LevelArr insertObject:str atIndex:0];
                                    // [self reloadScrollPage];
                                    continue;
                                }else
                                {
                                   
                                }
                               // [self.LevelArr addObject:self.LevelStr];
                             //   [self reloadScrollPage];
                                NSLog(@"第一层数组:%@",self.LevelArr);
                            }
                            
                        }});
    
     self.LevelArr = @[@"关注",@"国际赛事",@"欧洲赛事",@"亚洲赛事",@"大洋洲赛事",@"非洲赛事",@"美洲赛事"];

 
   
 
    

  self.delegate = self;
  self.dataSource = self;

//self.lineWidth = 2.0;//选中下划线宽度
  self.titleFont = [UIFont systemFontOfSize:16.0];
    self.defaultColor = color(177, 177, 177); //默认字体颜色
    self.chooseColor = color(81, 152, 57);//选中字体颜色
  self.selectIndex = 0;//默认选中第几页
[self reloadScrollPage];
      if (self.isFromHome) {
            [self addleftBtn];
            self.view.backgroundColor = [UIColor whiteColor];
        }}
    -(void)addleftBtn
    {
        UIButton *leftBtn = UIButton.new;
        leftBtn.frame = RECT(30*KWIDTH, 74*KWIDTH+zjpTest, 18*KWIDTH, 30*KWIDTH);
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"返 回"] forState:0];
        //_leftBtn.backgroundColor = [UIColor purpleColor];
        leftBtn.tag = 100;
        [leftBtn addTarget:self action:@selector(leftBarBtnClicked) forControlEvents:1 << 6];
        [self.view addSubview:leftBtn];
    }
    - (void)leftBarBtnClicked {
        [self.navigationController popViewControllerAnimated:YES];
    }
-(NSInteger)numberViewControllersInViewPager:(XLBasePageController *)viewPager
{return self.LevelArr.count;
}
-(UIViewController *)viewPager:(XLBasePageController *)viewPager indexViewControllers:(NSInteger)index
{
    if (index == 0) {
        //关注
        attentionVC *first = [[attentionVC alloc] init];
        first.titleStr =self.LevelArr[0];//self.LevelArr[index];
        first.index = index;
        return first;
    }else if(index == 1){
        //国际
        interVC *second = [[interVC alloc] init];
        
        second.titleStr =self.LevelArr[1];
        second.index = index;
        return second;
    }else if(index == 2){
        //欧洲
        EuropeVC *third = [[EuropeVC alloc] init];
        third.titleStr =self.LevelArr[2];
        third.index = index;
        return third;
    }else if(index == 3){
        //亚洲
        asianVC *fourth = [[asianVC alloc] init];
        fourth.titleStr = self.LevelArr[3];
        fourth.index = index;
        return fourth;
    }else if (index ==4){
        //大洋洲
        oceaniaVC *fifth = [[oceaniaVC alloc]init];
        fifth.titleStr = self.LevelArr[4];
        fifth.index = index;
        return fifth;
        //exceptionViewController
    }else if (index == 5){
       // 非洲
        AfricaViewController *sixth = [[AfricaViewController alloc]init];
        sixth.titleStr = self.LevelArr[5];
        sixth.index = index;
        return sixth;
    }else if (index == 6){
        //美洲
        americasViewController *seventh = [[americasViewController alloc]init];
        
        seventh.titleStr =self.LevelArr[6];
        seventh.index = index;
        return seventh;
    }
    return nil;
}

-(CGFloat)heightForTitleViewPager:(XLBasePageController *)viewPager
{
    return 108*KWIDTH;
}

-(NSString *)viewPager:(XLBasePageController *)viewPager titleWithIndexViewControllers:(NSInteger)index
{
    return self.LevelArr[index];
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
