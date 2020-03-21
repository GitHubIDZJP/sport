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
#import "exceptionViewController.h"
@interface dataBase()<CBasePageControllerDelegate,CBasePageControllerDataSource>{
    
}
@property (nonatomic,strong) NSMutableArray *DFArr;
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
        NSMutableDictionary *parameter =[[NSMutableDictionary alloc]init];
                    requestPost(@"https://sports.hxweixin.top/api/v1/fbinfo/infoNav", parameter, ^(NSError *error) {
                        NSLog(@"解析失败");
                    }, ^(NSDictionary *dic) {
                        NSLog(@"解析成功");
                        if([dic[@"code"] intValue] == 200){
                           
                            NSString *str =dic[@"data"][0][@"continent_name"][0];
                                                   NSLog(@"数组--T%@",str);
                            NSString *str1 =dic[@"data"][1][@"continent_name"][0];
                                                   NSLog(@"数组--T%@",str1);
                            NSString *str2 =dic[@"data"][2][@"continent_name"][0];
                                                   NSLog(@"数组--T%@",str2);
                            NSString *str3 =dic[@"data"][3][@"continent_name"][0];
                                                   NSLog(@"数组--T%@",str3);
                            NSString *str4 =dic[@"data"][4][@"continent_name"][0];
                                                   NSLog(@"数组--T%@",str4);
                            NSString *str5 =dic[@"data"][5][@"continent_name"][0];
                            NSLog(@"数组--T%@",str5);
                          
                            for(int  i = 0;i < [dic[@"data"]count];i++){
                                NSString *IOT = [NSString stringWithFormat:@"维修中:%@",dic[@"data"][i][@"continent_name"]];
                                                              // NSLog(@"字典-->:%@",IOT);
                            }
                            
                       
                        }
                       // NSLog(@"解析:%@",dic);//打印
                        });
  //  _titleArray = @[@"关注",@"国际赛事",@"欧洲赛事",@"亚洲赛事",@"大洋洲赛事",@"非洲赛事"];
    
   _titleArray = @[@"关注",@"国际赛事",@"欧洲赛事",@"亚洲赛事",@"大洋洲赛事",@"非洲赛事",@"美洲赛事"];
    
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

      if (self.isFromHome) {
            [self addleftBtn];
            self.view.backgroundColor = [UIColor whiteColor];
        }
    }

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
        //关注
        attentionVC *first = [[attentionVC alloc] init];
        first.titleStr = _titleArray[index];
        first.index = index;
        return first;
    }else if(index == 1){
        //国际
        interVC *second = [[interVC alloc] init];
        
        second.titleStr = _titleArray[index];
        second.index = index;
        return second;
    }else if(index == 2){
        //欧洲
        EuropeVC *third = [[EuropeVC alloc] init];
        third.titleStr = _titleArray[index];
        third.index = index;
        return third;
    }else if(index == 3){
        //美洲
        AmericaVC *fourth = [[ AmericaVC alloc] init];
        fourth.titleStr = _titleArray[index];
        fourth.index = index;
        return fourth;
    }else if (index ==4){
        //亚洲
        asianVC *fifth = [[asianVC alloc] init];
        fifth.titleStr = _titleArray[index];
        fifth.index = index;
        return fifth;
        //exceptionViewController
    }else if (index == 5){
        //大洋洲
        oceaniaVC *sixth = [[oceaniaVC alloc]init];
        
        sixth.titleStr = _titleArray[index];
        sixth.index = index;
        return sixth;
    }else if (index == 6){
        //大洋洲
        exceptionViewController *seventh = [[exceptionViewController alloc]init];
        
        seventh.titleStr = _titleArray[index];
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
