//
//  shareArticleVC.m
//  Sports
//
//  Created by test on 2020/1/7.
//  Copyright © 2020 test. All rights reserved.
//

#import "shareArticleVC.h"
#import "customTextView.h"
#import "UIButton+BtnType.h"
#import "UIButton+ENUM.h"
#import "SuperParentView.h"
@interface shareArticleVC ()
{
    UIView *bgView;
    UIButton*payBtn;
    
}

@property(nonatomic,strong)UIView *barreView;

@end

@implementation shareArticleVC
-(UIView *)barreView
{
    if(!_barreView){
     
        _barreView = UIView.new;
        _barreView.frame = RECT(0,bgView.y + bgView.height + 30*KWIDTH,SCREEN_WIDTH,78*KWIDTH);
        _barreView.backgroundColor = UIColor.whiteColor;
        
    }
    return _barreView;
}
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
        
        _NavBar.backgroundColor =  colorWithHexString(@"#07913B");
    }
    return _NavBar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = color(243, 243, 243);
   // [self.view addSubview:self.tableView];
    [self.view addSubview:self.NavBar];
    [self.NavBar setRightButtonIsHidden:NO];
    [self.NavBar setCenterText:@"发布文章"];
    [self.NavBar setCenterTextColor:UIColor.whiteColor];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        NSLog(@"导航条按钮");
       // [vc dismissViewControllerAnimated:NO completion:nil];
        [vc.navigationController popViewControllerAnimated:YES];
    }];
    [self.NavBar setRightBtnTag:100];
    UIButton *rRespondBtn = (UIButton *)[self.NavBar viewWithTag:100];
    CGRect frame = rRespondBtn.frame;
    frame.size.width =88*KWIDTH;
    frame.size.height = 50*KWIDTH;
    frame.origin.x -= 30*KWIDTH;
    rRespondBtn.frame = frame;
    rRespondBtn.backgroundColor = [UIColor whiteColor];
    [rRespondBtn setTitle:@"完成" forState:0 ];
    [rRespondBtn setTitleColor:colorWithHexString(@"#07913B") forState:UIControlStateNormal];
    rRespondBtn.titleLabel.font = Font12;
    rRespondBtn.layer.cornerRadius = 7*KWIDTH;
    rRespondBtn.layer.masksToBounds = YES;
    [self.NavBar setPushBlock:^{
        NSLog(@"右按钮");
    }];
    [self bigView];
    [self barreBar];
    [self.view addSubview:self.barreView];
}
-(void)bigView{
   bgView = UIView.new;
    bgView.backgroundColor = UIColor.whiteColor;
    bgView.frame= RECT(0,self.NavBar.height + self.NavBar.y,SCREEN_WIDTH,496*KWIDTH);
    [self.view addSubview:bgView];
    
    
    UITextField *headTitle = UITextField.new;
    headTitle.frame = CGRectMake(30*KWIDTH,30*KWIDTH,bgView.width - 60*KWIDTH,66*KWIDTH);
    headTitle.placeholder = @"   标题";
    [headTitle setValue:colorWithHexString(@"#999999") forKeyPath:@"_placeholderLabel.textColor"];
    [headTitle setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    headTitle.backgroundColor= color(243, 243, 243);
    [bgView addSubview:headTitle];
    headTitle.layer.cornerRadius = 5;
    headTitle.layer.masksToBounds = YES;
    
    
    customTextView *cT = [[customTextView alloc]initWithFrame:CGRectMake(headTitle.x,headTitle.y + headTitle.height+ 30*KWIDTH,headTitle.width,340*KWIDTH)];
    cT.backgroundColor = headTitle.backgroundColor;
    cT.layer.cornerRadius = 3;
    cT.layer.masksToBounds = true;
    [bgView addSubview:cT];
    [cT  getImage:@"panda"];
    [cT setUpLoadBlock:^{
        NSLog(@"上传图片按钮");
       // YBAlertShow(@"照片", @"相机",@"取消",@"相册");
    }];
    
}
-(void)barreBar{
 
    //[self.barreView addSubview:btn];
    
  //  NSArray *btnTitles = @[@"免费",@"付费"];
   
    SuperParentView *ro = [[SuperParentView alloc]initWithFrame:CGRectMake(30*KWIDTH,15*KWIDTH,90*KWIDTH,40*KWIDTH)];
    ro.backgroundColor = [UIColor yellowColor];
    [ro setSecretLabelText:@"足球"];
    
    [self.barreView addSubview:ro];
    
    
    
    for(int j= 0;j < 2;j++){
        
        payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        payBtn.frame=CGRectMake(183*KWIDTH + j * 180*KWIDTH, 25*KWIDTH,30*KWIDTH,30*KWIDTH);
       // payBtn.backgroundColor = [UIColor redColor];
        payBtn.tag= j +1;
        [payBtn setImage:[UIImage imageNamed:@"selectNo"] forState:UIControlStateNormal];
        [payBtn setImage:[UIImage imageNamed:@"selectYes"] forState:UIControlStateSelected|UIControlStateSelected];
        [payBtn addTarget:self  action:@selector(selectPayStyle:)forControlEvents:UIControlEventTouchUpInside];
        [self.barreView addSubview:payBtn];
    }
    
    NSArray *arr= @[@"免费",@"付费"];
    for(int i = 0;i< arr.count;i++){
        UILabel *l = [[UILabel alloc]initWithFrame:CGRectMake(220*KWIDTH + i *190*KWIDTH,10*KWIDTH,90*KWIDTH,50*KWIDTH)];
        l.text = arr[i];
       // l.backgroundColor = [UIColor purpleColor];
        [self.barreView addSubview:l];
        
        
    }
    
    
}
- (void)selectPayStyle:(UIButton*)btn{
    if(btn !=payBtn) {
        payBtn.selected=NO;
        btn.selected=YES;
        payBtn= btn;
    }else{
        payBtn.selected=YES;
    }
}


@end
