//
//  UserFocusVC.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "UserFocusVC.h"




//#import "MainView.h"
#import "HXFootballViewController.h"
#import "HXBasketballViewController.h"
#import "HXArticlesViewController.h"
//回调
#import "UIView+ZJPFrame.h"
#define SCW [UIScreen mainScreen].bounds.size.width
#define SCH [UIScreen mainScreen].bounds.size.height



@interface UserFocusVC ()<UIScrollViewDelegate>
{
    UIView * _view;
    BOOL isClick;
}
@property (weak, nonatomic) IBOutlet UIButton *ruturnPage;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;

//@property (nonatomic,retain) NSArray *viewControllers;

/** 保存所有的标题按钮 */
@property (nonatomic,strong) NSMutableArray *titleBtns;


/**内容视图*/
@property (nonatomic,strong)UIScrollView * contentScrollow;

/** 下滑线 */
@property (nonatomic,strong) UIView *lineView;


/** 保存上一次点击的按钮 */
@property (nonatomic,strong) UIButton *preBtn;
@end



@implementation UserFocusVC
- (NSMutableArray *)titleBtns
{
    if (!_titleBtns) {
        _titleBtns = [NSMutableArray array];
    }
    return _titleBtns;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.ruturnPage.hitScale = 5;
    self.shareBtn.hitScale = 5;
    [self setupTitleView];
    
    
    [self customScrollview];
    
    
    //添加子控制器
    [self addChildCustomViewController];
    
    
    
    
    
    // 默认点击下标为0的标题按钮
    [self titleBtnClick:self.titleBtns[0]];
    
    
    [self createVc];
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;//白色s
}
//分享
- (IBAction)share:(UIButton*)share{
    
    
}
- (IBAction)Focus:(UIButton*)f{
    //关注
}


- (IBAction)jumpToMainViewController:(UIButton *)sender {
  //  [self dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setupTitleView{
   // main.frame = CGRectMake(0, 220,self.view.frame.size.width, SCREEN_HEIGHT - 220);
    //UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCW/2, 40)];
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 220, SCW, 40)];
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
    lineView.backgroundColor = UIColor.clearColor;
    // 下滑线高度
    CGFloat lineViewH = 2;
    CGFloat y = _view.yj_height - lineViewH;
    lineView.yj_height = lineViewH;
    lineView.yj_y = y;
    // 设置下划线的宽度比文本内容宽度大10
    [titleBtn.titleLabel sizeToFit];
    lineView.yj_width =  titleBtn.titleLabel.yj_width + 2;
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
    HXFootballViewController   *firstVc  = [[HXFootballViewController alloc] init];
    HXBasketballViewController  *secondVc = [[HXBasketballViewController alloc] init];
    HXArticlesViewController   *ThirdVc  = [[HXArticlesViewController alloc] init];
    [self addChildViewController:firstVc];
    [self addChildViewController:secondVc];
    [self addChildViewController:ThirdVc];
    
    NSInteger count = self.childViewControllers.count;
    self.contentScrollow.contentSize = CGSizeMake(count * SCW, 0);
    
    
    
}








- (void)addAllTitleBtns{
    
    
    
    NSArray * titles = @[@"足球",@"篮球",@"文章"];
    
    CGFloat btnW = _view.bounds.size.width/titles.count;
    CGFloat btnH = _view.bounds.size.height;
    
    
    for (int i = 0; i < titles.count; i++) {
        UIButton * titleBtn = [[UIButton alloc]init];
        titleBtn.tag = i;
        titleBtn.frame = CGRectMake(i * btnW, 0, btnW, btnH);
        [titleBtn setTitle:titles[i] forState:UIControlStateNormal];
        //设置文字颜色
        [titleBtn setTitleColor:colorWithHexString(@"#666666") forState:UIControlStateNormal];
        //设置选中按键的文字颜色
        [titleBtn setTitleColor:colorWithHexString(@"#4CB13B") forState:UIControlStateSelected];
        
        [_view addSubview:titleBtn];
        
        [self.titleBtns addObject:titleBtn];
        
        
        [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchDown];
        
    }
    
    
}

- (void)titleBtnClick:(UIButton *)titleBtn{
    
    isClick = YES;
    
    // 1.标题按钮点击三步曲
    self.preBtn.selected = NO;
    titleBtn.selected = YES;
    self.preBtn = titleBtn;
    NSInteger tag = titleBtn.tag;
    // 2.处理下滑线的移动
    [UIView animateWithDuration:0.25 animations:^{
        self.lineView.yj_width = titleBtn.titleLabel.yj_width;
        self.lineView.yj_centerX = titleBtn.yj_centerX;
        
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
        self.lineView.yj_width = titleBtn.titleLabel.yj_width/3;
        self.lineView.yj_centerX = titleBtn.yj_centerX;
        isClick = YES;
    }else{
        
       
        
    }
}
//开始减速的时候调用
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
}


//结束拖动的时候调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / scrollView.yj_width;
    UIButton *titleBtn = self.titleBtns[index];
    
    // 调用标题按钮的点击事件
    [self titleBtnClick:titleBtn];
}
- (void)createVc {
    
    /*
    HXFootballViewController   *firstVc  = [[HXFootballViewController alloc] init];
    HXBasketballViewController  *secondVc = [[HXBasketballViewController alloc] init];
    HXArticlesViewController   *ThirdVc  = [[HXArticlesViewController alloc] init];
    [self addChildViewController:firstVc];
    [self addChildViewController:secondVc];
    [self addChildViewController:ThirdVc];
    self.viewControllers        = [NSArray arrayWithObjects:firstVc,secondVc,ThirdVc,nil];
    
    MainView *main = [[MainView alloc] init];
    [self.view addSubview:main];
    main.frame = CGRectMake(0, 220,self.view.frame.size.width, SCREEN_HEIGHT - 220);
    //设置菜单view 的高度
    main.btnViewHeight = 38;
    //设置按钮下划线高度
    main.btnLineHeight = 2;
    //设置按钮字体大小
    main.btnFont       = 17;
    main.viewControllers = self.viewControllers;
    NSArray *array  = @[@"足球",@"篮球",@"文章"];
    main.titleArray = array;
     */
}


@end

