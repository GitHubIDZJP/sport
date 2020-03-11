//
//  MyRedEnvelopeVC.m
//  Sports
//
//  Created by test on 2020/1/17.
//  Copyright © 2020 test. All rights reserved.
//


#import "MyRedEnvelopeVC.h"
#import "UIView+ZJPFrame.h"
#define SCW [UIScreen mainScreen].bounds.size.width
#define SCH [UIScreen mainScreen].bounds.size.height
#import "ApproveVC.h"
#import "DistributedVC.h"
#import "ExpireVC.h"

#define lineW SCREEN_WIDTH/20
@interface MyRedEnvelopeVC ()<UIScrollViewDelegate>
{
    UIView * _view;
    BOOL isClick;
}
/** 保存所有的标题按钮 */
@property (nonatomic,strong) NSMutableArray *titleBtns;

/**内容视图*/
@property (nonatomic,strong)UIScrollView * contentScrollow;

/** 下滑线 */
@property (nonatomic,strong) UIView *lineView;


/** 保存上一次点击的按钮 */
@property (nonatomic,strong) UIButton *preBtn;



@end

@implementation MyRedEnvelopeVC
- (NSMutableArray *)titleBtns
{
    if (!_titleBtns) {
        _titleBtns = [NSMutableArray array];
    }
    return _titleBtns;
}


-(customNavigationBar*)NavBar{
        if(!_NavBar){
            _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
            _NavBar.backgroundColor = colorWithHexString(@"#FFFFFF");//color(64,143,68);
        }
        return _NavBar;
    }
- (void)viewDidLoad {
        [super viewDidLoad];
        [self.view addSubview:self.NavBar];
        __block  UIViewController *vc = self;
        [self.NavBar setBackBlock:^{
           // [vc dismissViewControllerAnimated:false completion:nil];
        [vc.navigationController popViewControllerAnimated:YES];
            NSLog(@"返回上一个页面");
        }];
        [self.NavBar setRightButtonIsHidden:YES];
        [self.NavBar setCenterText: @"我的红包"];
        [self.NavBar setCenterTextColor:[UIColor blackColor]];
        
  
    [self setupTitleView];
    
    
    [self customScrollview];
    
    
    //添加子控制器
    [self addChildCustomViewController];
    
    
    
    
    
    // 默认点击下标为0的标题按钮
    [self titleBtnClick:self.titleBtns[0]];
    
}



- (void)setupTitleView{
    
    //UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCW/2, 40)];
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, JH_NavBarHeight, SCW, 40)];
    _view = view;
    _view.backgroundColor = [UIColor whiteColor];
    //self.navigationItem.titleView = view;
    [self.view addSubview:_view];
    //添加所有的标题按钮
    [self addAllTitleBtns];
    
    
    //添加下划线
    [self setupUnderLineView];
    
    
    
    
    
}


#pragma mark - 添加下滑线
- (void)setupUnderLineView
{
    // 获取下标为0的标题按钮
    UIButton *titleBtn = self.titleBtns[0];
 
    
    UIView *lineView = [[UIView alloc] init];
    self.lineView = lineView;
    lineView.backgroundColor = [UIColor greenColor];
    // 下滑线高度
    CGFloat lineViewH = 2;
    CGFloat y = _view.yj_height - lineViewH;
    lineView.yj_height = lineViewH;
    lineView.yj_y = y;
    // 设置下划线的宽度比文本内容宽度大10
    [titleBtn.titleLabel sizeToFit];
    lineView.yj_width =  lineW;//titleBtn.titleLabel.yj_width  ;
   // lineView.yj_width =  ScreenWidth/6  ;
    lineView.yj_centerX = titleBtn.yj_centerX+30;
    // 添加到titleView里
    [_view addSubview:lineView];
}




- (void)customScrollview{
    
    UIScrollView * contentScrollow = [[UIScrollView alloc]init];
    self.contentScrollow = contentScrollow;
    NSInteger contentScrollowY =_view.frame.size.height+ _view.frame.origin.y;
    contentScrollow.frame = CGRectMake(0,contentScrollowY , SCW, SCH - contentScrollowY);
    // contentScrollow.contentSize = CGSizeMake(SCW, 0);
    [self.view addSubview:contentScrollow];
    contentScrollow.delegate = self;
    contentScrollow.pagingEnabled = YES;
    contentScrollow.bounces = NO;
    contentScrollow.showsHorizontalScrollIndicator = NO;
    
    
    
}


- (void)addChildCustomViewController{
    
    /*
     #import "ApproveVC.h"
     #import "DistributedVC.h"
     #import "ExpireVC.h"
     */
    //第一个
    ApproveVC * fristVc = [[ApproveVC alloc]init];
    [self addChildViewController:fristVc];
    
    //第二个
    DistributedVC * secondVc = [[DistributedVC alloc]init];
    [self addChildViewController:secondVc];
    
    
    ExpireVC *thirdVC = [[ExpireVC alloc]init];
    [self addChildViewController:thirdVC];
    NSInteger count = self.childViewControllers.count;
    self.contentScrollow.contentSize = CGSizeMake(count * SCW, 0);
    
    
}








- (void)addAllTitleBtns{
    
    
    
    
    NSArray * titles = @[@"可用(4)",@"待派发(0)",@"已用/过期"];
    
    CGFloat btnW = _view.bounds.size.width/titles.count;
    CGFloat btnH = _view.bounds.size.height;
    
    
    for (int i = 0; i < titles.count; i++) {
        UIButton * titleBtn = [[UIButton alloc]init];
        titleBtn.tag = i;
        titleBtn.frame = CGRectMake(i * btnW, 0, btnW, btnH);
        [titleBtn setTitle:titles[i] forState:UIControlStateNormal];
        //设置文字颜色
        [titleBtn setTitleColor:colorWithHexString(@"#999999") forState:UIControlStateNormal];
        //设置选中按键的文字颜色
        [titleBtn setTitleColor:colorWithHexString(@"#4CB13B") forState:UIControlStateSelected];
        
        [_view addSubview:titleBtn];
        
        [self.titleBtns addObject:titleBtn];
        
        
        [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchDown];
        
    }
    
    
}

- (void)titleBtnClick:(UIButton *)titleBtn{
    
    isClick = YES;
    
    //    // 判断标题按钮是否重复点击
    //    if (titleBtn == self.preBtn) {
    //        // 重复点击标题按钮，发送通知给帖子控制器，告诉它刷新数据
    //        [[NSNotificationCenter defaultCenter] postNotificationName:@"titleBtnRefreshClick" object:nil];
    //    }
    // 1.标题按钮点击三步曲
    self.preBtn.selected = NO;
    titleBtn.selected = YES;
    self.preBtn = titleBtn;
    NSInteger tag = titleBtn.tag;
    // 2.处理下滑线的移动
    [UIView animateWithDuration:0.25 animations:^{
        self.lineView.yj_width = lineW;//titleBtn.titleLabel.yj_width;
        self.lineView.yj_centerX = titleBtn.yj_centerX-10;
        
        // 3.修改contentScrollView的便宜量,点击标题按钮的时候显示对应子控制器的view
        self.contentScrollow.contentOffset = CGPointMake(tag * SCW, 0);
    }];
    
    // 添加子控制器的view
    UIViewController *vc = self.childViewControllers[tag];
    // 如果子控制器的view已经添加过了，就不需要再添加了
    if (vc.view.superview) {
        return;
    }
#pragma mark 设置子页面的高度
    vc.view.frame = CGRectMake(tag * SCW, 0 , SCW, SCH - 64);
    [self.contentScrollow addSubview:vc.view];
    
    
    
}


#pragma mark -- uscrollviewDelegate
//开始拖动的时候
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    isClick = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 计算拖拽的比例
    CGFloat ratio = scrollView.contentOffset.x / scrollView.yj_width;
    // 将整数部分减掉，保留小数部分的比例(控制器比例的范围0~1.0)
    ratio = ratio - self.preBtn.tag;
    
    NSInteger index = scrollView.contentOffset.x / scrollView.yj_width;
    
    
    
    if (isClick) {
        UIButton * titleBtn = self.titleBtns[index];
        
        self.lineView.yj_x = titleBtn.titleLabel.yj_x;
#pragma mark 设置下划线的长度
        self.lineView.yj_width = lineW  ;//titleBtn.titleLabel.yj_width;
        self.lineView.yj_centerX = titleBtn.yj_centerX;
        isClick = YES;
    }else{
        
      
    }
}
//结束拖动的时候调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / scrollView.yj_width;
    UIButton *titleBtn = self.titleBtns[index];
    
    // 调用标题按钮的点击事件
    [self titleBtnClick:titleBtn];
}






@end
