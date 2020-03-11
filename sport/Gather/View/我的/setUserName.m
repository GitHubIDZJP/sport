//
//  setUserName.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "setUserName.h"

@interface setUserName ()

@end

@implementation setUserName
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,JH_StatusBarHeight,SCREEN_WIDTH,  JH_NavBarContentHeight)];
        _NavBar.backgroundColor = colorWithHexString(@"#07913B");//color(64,143,68);
    }
    return _NavBar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = color(240, 240, 240);
    
    [self.view addSubview:self.NavBar];
    //[self.view addSubview:self.tableView];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        //[vc dismissViewControllerAnimated:false completion:nil];
        [vc.navigationController popViewControllerAnimated:YES];
        NSLog(@"返回上一个页面");
    }];
    
    
    
    
    [self.NavBar setRightButtonIsHidden:NO];
    [self.NavBar setCenterText: @"设置用户名"];
    [self.NavBar setCenterTextColor:[UIColor whiteColor]];
    
    // __block  UIViewController *vc = self;
    [self.NavBar  setPushBlock:^{
        
        NSLog(@"反向传值");
        
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
    
    
    
    
    
    
    
    
    
    
    _getUserName = UITextField.new;
    _getUserName.backgroundColor = White;
    _getUserName.placeholder = @"     请输入用户名";
   
    [self.view addSubview:_getUserName];
    [_getUserName mas_makeConstraints:^(MASConstraintMaker *make) {
       // make.edges.insets(UIEdgeInsets (0, 150*KWIDTH, 0, 0));
//        make.width.mas_equalTo(SCREEN_WIDTH);
//        make.height.mas_equalTo(88*KWIDTH);
       // make.top.mas_equalTo(158*KWIDTH);
      //  make.top.mas_equalTo(self.NavBar).offset(130*KWIDTH);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 88*KWIDTH));
        make.top.mas_equalTo(self.NavBar.mas_top).mas_offset(120*KWIDTH);
        
    }];
    
}






@end
