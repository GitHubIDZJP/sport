//
//  ViewController.m
//  SectionChooseVC
//
//  Created by lujh on 2017/3/8.
//  Copyright © 2017年 lujh. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//宏定义获取屏幕高
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//宏定义像素宽 px
#define KWIDTH [UIScreen mainScreen].bounds.size.width/750.0
#define KUIScreenWidth [UIScreen mainScreen].bounds.size.width
#define KUIScreenHeight [UIScreen mainScreen].bounds.size.height
#define margin_top (IS_iPhoneX ? (20.f) : 20.f)
#define deviceIphoneX  (IS_iPhoneX ? (25.f) : 0.f)
#define subViewY
#import "TeamListVC.h"
#import "SectionChooseView.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "thirdViewController.h"
#import "fourthViewController.h"
#import "fifthViewController.h"//DiskDrive
#import "JHGlobalMethod.h"
//searchBar
#import "MTSearchBar.h"
#import "UISegmentedControl+adapter.h"




@interface TeamListVC ()<UIScrollViewDelegate,SectionChooseVCDelegate>
{
    UISegmentedControl *segmentedControl;
    FirstViewController *first;
    SecondViewController *second;
    thirdViewController *third ;
    fourthViewController *fourth;
    fifthViewController *fifth ;
    
}
//底部滚动ScrollView
//@property (nonatomic, strong) UIScrollView *contentScrollView;
//
//@property(nonatomic,strong)SectionChooseView *sectionChooseView;

@property (nonatomic,strong)MTSearchBar *searchBar;

@end

@implementation TeamListVC
-(UIView *)musterView
{
    if(!_musterView){
        _musterView =UIView.new;
        _musterView.frame = CGRectMake(0,0*KWIDTH,SCREEN_WIDTH,152*KWIDTH);
        _musterView.userInteractionEnabled= YES;
       // _musterView.backgroundColor = UIColor.redColor;
        _musterView.userInteractionEnabled = YES;
    }
    return _musterView;
}
-(UIButton*)leftBtn
{
    if(!_leftBtn){
        _leftBtn = UIButton.new;
        _leftBtn.frame = RECT(30*KWIDTH, 74*KWIDTH+zjpTest, 18*KWIDTH, 30*KWIDTH);
        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"返 回"] forState:0];
        //_leftBtn.backgroundColor = [UIColor purpleColor];
        _leftBtn.hitScale = 6;
        _leftBtn.tag = 100;
        //[_leftBtn addTarget:self action:@selector(returnPage:) forControlEvents:1 << 6];
    }
    return _leftBtn;
}
-(UIButton*)rightBtn
{
    if(!_rightBtn){
        _rightBtn = UIButton.new;
        _rightBtn.frame = RECT(SCREEN_WIDTH - 95*KWIDTH, _leftBtn.y, 84*KWIDTH, 26*KWIDTH);
        //_rightBtn.backgroundColor = [UIColor purpleColor];
        [_rightBtn setTitle:@"关注" forState:0];
        _rightBtn.titleLabel.font = Font14;
        _rightBtn.tag = 101;
        [_rightBtn setTitleColor:colorWithHexString(@"#333333") forState:0];
      
    }
    return _rightBtn;
}
-(UILabel*)centerText{
    if(!_centerText){
        _centerText = UILabel.new;
        _centerText.frame  = CGRectMake(200*KWIDTH,73*KWIDTH+ zjpTest,SCREEN_WIDTH - 400*KWIDTH,32*KWIDTH);
        _centerText.textAlignment =NSTextAlignmentCenter;
        _centerText.textColor = colorWithHexString(@"#333333");
        _centerText.font = Font17;
        _centerText.font  = [UIFont boldSystemFontOfSize:20];
        //_centerText.backgroundColor = UIColor.redColor;
        _centerText.text = @"英超";
    }
    return _centerText;
      //>
    
    
    
}
//搜索框---->
-(MTSearchBar *)searchBar
{
    if(!_searchBar){

        _searchBar = MTSearchBar.new;
        _searchBar.frame = RECT(30*KWIDTH,132*KWIDTH+zjpTest,SCREEN_WIDTH - 60*KWIDTH,56*KWIDTH);
        _searchBar.backgroundColor = colorWithHexString(@"#F3F6F4");
        _searchBar.layer.cornerRadius = 14;
        _searchBar.layer.masksToBounds = YES;
        [self.musterView addSubview:_searchBar];
    }
    
    return _searchBar;
    
}
- (void)viewWillAppear:(BOOL)animated {
      [super viewWillAppear:animated];
      [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
      [self setDefaultIndexViewController];
      [self createSegMentController];
  
    
    
     self.navigationController.navigationBarHidden = YES;

    
    [self.view addSubview:self.musterView];
    self.view.userInteractionEnabled= YES;
    [self.musterView addSubview:self.leftBtn];
    [self.musterView addSubview:self.rightBtn];
    [self.musterView addSubview:self.centerText];
    [self.musterView addSubview:self.searchBar];
    [self.leftBtn addTarget:self action:@selector(Click:) forControlEvents:1 < 6];
    [self.rightBtn addTarget:self action:@selector(Click:) forControlEvents:1 < 6];

   // self.title = @"分段选择";
   // self.view.backgroundColor = [UIColor lightGrayColor];
    // 首次进入加载第一个界面通知
//
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showFirstVC) name:@"ABC" object:nil];
    
//    //添加所有子控制器
//    [self setupChildViewController];
//
//    //初始化UIScrollView
//    [self setupUIScrollView];
}
-(void)setDefaultIndexViewController{
 first = [[FirstViewController alloc]init];
      first.view.frame = CGRectMake(0,200*KWIDTH,SCREEN_WIDTH,SCREEN_HEIGHT);
   
     
     [self addChildViewController:first];
     [self.view addSubview:first.view];
    
       first.view.hidden = NO;
       second.view.hidden = YES;
       third.view.hidden = YES;
       fourth.view.hidden = YES;
       fifth.view.hidden  = YES;
   
   
    
}
-(void)createSegMentController{
    NSArray *segmentedArray = [NSArray arrayWithObjects:@"积分榜",@"球员榜",@"球队榜",@"赛程",@"盘路",nil];
    
   segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    
    segmentedControl.frame = CGRectMake(15*KWIDTH, 200*KWIDTH+deviceIphoneX, SCREEN_WIDTH-30*KWIDTH, 58*KWIDTH);

    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.layer.borderColor=color(76, 177, 59).CGColor;
    segmentedControl.layer.borderWidth= 1;
    segmentedControl.layer.cornerRadius = 4;
    segmentedControl.layer.masksToBounds =  YES;
    segmentedControl.tintColor =color(76, 177, 59);
    
     [segmentedControl segmentedIOS13Style];
    
    // 正常状态下
    NSDictionary * normalTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:13.0f],NSForegroundColorAttributeName : color(76,177,59)};
    [segmentedControl setTitleTextAttributes:normalTextAttributes forState:UIControlStateNormal];
    
    // 选中状态下
    NSDictionary * selctedTextAttributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:13.0f],NSForegroundColorAttributeName : color(255,255, 255)};
    [segmentedControl setTitleTextAttributes:selctedTextAttributes forState:UIControlStateSelected];
    
    [segmentedControl addTarget:self action:@selector(indexDidChangeForSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segmentedControl];
}
-(void)indexDidChangeForSegmentedControl:(UISegmentedControl *)seg
{
   
    
    NSLog(@"index:%ld",(long)seg.selectedSegmentIndex);
   
    switch (seg.selectedSegmentIndex) {
        case 0:
        {
            if(first == nil){
                first= [[FirstViewController alloc]init];
                    
                [self addChildViewController:first];
                [self.view addSubview:first.view];
                 first.view.frame = CGRectMake(0,200*KWIDTH,SCREEN_WIDTH,SCREEN_HEIGHT);
            }
            first.view.hidden  = NO;
            second.view.hidden = YES;
            third.view.hidden = YES;
            fourth.view.hidden = YES;
            fifth.view.hidden = YES;
            
            break;
        }
            case 1:
                   {
                       if(second == nil){
                           second= [[SecondViewController alloc]init];
                                              
                           [self addChildViewController:second];
                           second.view.frame = CGRectMake(0,segmentedControl.frame.size.height + segmentedControl.frame.origin.y+ 20*KWIDTH,SCREEN_WIDTH,SCREEN_HEIGHT);
                           [self.view addSubview:second.view];
                       }
                         second.view.hidden  = NO;
                       first.view.hidden = YES;
                       third.view.hidden = YES;
                       fourth.view.hidden  = YES;
                       fifth.view.hidden = YES;
                       break;
                   }
            case 2:
                   {
                       if(third == nil){
                            third= [[thirdViewController alloc]init];
                           [self addChildViewController:third];
                            third.view.frame = CGRectMake(0,segmentedControl.frame.size.height + segmentedControl.frame.origin.y+ 20*KWIDTH,SCREEN_WIDTH,SCREEN_HEIGHT);
                           [self.view addSubview:third.view];
                          
                       }
                      third.view.hidden  = NO;
                       first.view.hidden = YES;
                       second.view.hidden = YES;
                       fourth.view.hidden  = YES;
                        fifth.view.hidden = YES;
                       break;
                   }
            case 3:
                              {
                                  if(fourth == nil){
                                       fourth= [[fourthViewController alloc]init];
                                      [self addChildViewController:fourth];
                                       fourth.view.frame = CGRectMake(0,segmentedControl.frame.size.height + segmentedControl.frame.origin.y+ 20*KWIDTH,SCREEN_WIDTH,SCREEN_HEIGHT);
                                      [self.view addSubview:fourth.view];
                                     
                                  }
                                 third.view.hidden  = YES;
                                  first.view.hidden = YES;
                                  second.view.hidden = YES;
                                  fourth.view.hidden  = NO;
                                   fifth.view.hidden = YES;
                                  break;
                              }
            case 4:
                                        {
                                            if(fifth == nil){
                                                 fifth= [[fifthViewController alloc]init];
                                                [self addChildViewController:fifth];
                                                 fifth.view.frame = CGRectMake(0,segmentedControl.frame.size.height + segmentedControl.frame.origin.y+ 0*KWIDTH,SCREEN_WIDTH,SCREEN_HEIGHT);
                                                [self.view addSubview:fifth.view];
                                               
                                            }
                                             fifth.view.hidden = NO;
                                            third.view.hidden  = YES;
                                            first.view.hidden = YES;
                                            second.view.hidden = YES;
                                            fourth.view.hidden  = YES;
                                            
                                           
                                            break;
                                        }
    
       
        default:
            break;
    }
    
}
-(void)Click:(UIButton*)sender{
    if(sender.tag == 100){
        
        NSLog(@"返回");


        
     
        [self.navigationController popViewControllerAnimated:YES];
    }else if (sender.tag == 101){
        NSLog(@"关注");
    }
}
//- (void)showFirstVC {
//
//    [self showVc:0];
//}



/*
- (void)setupUIScrollView {
    
    // 创建底部滚动视图
    self.contentScrollView = [[UIScrollView alloc] init];
    _contentScrollView.frame = CGRectMake(0,_searchBar.height +_searchBar.y+ 20*KWIDTH, KUIScreenWidth, SCREEN_HEIGHT );
    //_contentScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2, 0);
    _contentScrollView.backgroundColor = UIColor.whiteColor;
    // 开启分页
    _contentScrollView.pagingEnabled = YES;
    // 没有弹簧效果
    _contentScrollView.bounces = NO;
    // 隐藏水平滚动条
    _contentScrollView.showsHorizontalScrollIndicator = NO;
    // 设置代理
    _contentScrollView.delegate = self;
    [self.view addSubview:_contentScrollView];
    
    self.sectionChooseView = [[SectionChooseView alloc] initWithFrame:CGRectMake(2.5, _searchBar.height +_searchBar.y+ 20*KWIDTH, SCREEN_WIDTH-5, 58*KWIDTH) titleArray:@[@"积分榜", @"球员榜",@"球队榜",@"赛程",@"盘路"]];
    self.sectionChooseView.selectIndex = 0;
    self.sectionChooseView.delegate = self;
    self.sectionChooseView.backgroundColor = UIColor.whiteColor;
    self.sectionChooseView.normalBackgroundColor = [UIColor whiteColor];
    self.sectionChooseView.selectBackgroundColor = colorWithHexString(@"#4CB13B");//选中背景色
    self.sectionChooseView.titleNormalColor = colorWithHexString(@"#4CB13B");
    self.sectionChooseView.titleSelectColor = [UIColor whiteColor];
   // self.sectionChooseView.borderColor = UIColor.redColor;
   self.sectionChooseView.borderWidth = 0;
   // self.sectionChooseView.borderColor = UIColor.redColor;
    self.sectionChooseView.normalTitleFont = 14;
    self.sectionChooseView.selectTitleFont = 16;
    [self.view addSubview:self.sectionChooseView];
 
    
    
    
    
}
*/
#pragma mark -添加所有子控制器

/*
-(void)setupChildViewController {
    
    FirstViewController *voucherUnusedVC = [[FirstViewController alloc] init];
    
    [self addChildViewController:voucherUnusedVC];
    
    
    SecondViewController *voucherUsedVC = [[SecondViewController alloc] init];
    
    [self addChildViewController:voucherUsedVC];
    
    thirdViewController *third = [[thirdViewController alloc]init];
    [self addChildViewController:third];
    
    fourthViewController *fourth = [[fourthViewController alloc]init];
    [self addChildViewController:fourth];
    
    fifthViewController *fifth = [[fifthViewController alloc]init];
    [self addChildViewController:fifth];
    
}
*/
//#pragma mark -SMCustomSegmentDelegate
//
//- (void)SectionSelectIndex:(NSInteger)selectIndex {
//
//    NSLog(@"---------%ld",(long)selectIndex);
//
//    // 1 计算滚动的位置
//    CGFloat offsetX = selectIndex * self.view.frame.size.width;
//    self.contentScrollView.contentOffset = CGPointMake(offsetX, 0);
//
//    // 2.给对应位置添加对应子控制器
//    [self showVc:selectIndex];
//}
//
//#pragma mark -显示控制器的view
///**
// *  显示控制器的view
// *
// *  @param index 选择第几个
// *
// */
//- (void)showVc:(NSInteger)index {
//
//    CGFloat offsetX = index * self.view.frame.size.width;
//
//    UIViewController *vc = self.childViewControllers[index];
//
//    // 判断控制器的view有没有加载过,如果已经加载过,就不需要加载
//    if (vc.isViewLoaded) return;
//
//    [self.contentScrollView addSubview:vc.view];
//    vc.view.frame = CGRectMake(offsetX, 0, self.view.frame.size.width, SCREEN_HEIGHT);
//}
//
//#pragma mark -UIScrollViewDelegate
//
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//
//
//    // 计算滚动到哪一页
//    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
//
//    // 1.添加子控制器view
//    [self showVc:index];
//
//    // 2.把对应的标题选中
//    self.sectionChooseView.selectIndex = index;
//
//}
//
//- (void)dealloc {
//
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}

@end
