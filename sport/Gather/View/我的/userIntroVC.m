//
//  userIntroVC.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "userIntroVC.h"

@interface userIntroVC ()<UITextViewDelegate>

@end

@implementation userIntroVC

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
          //  [vc dismissViewControllerAnimated:false completion:nil];
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
    
        self.textView = [[UITextView alloc]init];
        self.textView.delegate = self;
        self.textView.frame = RECT(0, self.NavBar.height + self.NavBar.y + 30*KWIDTH, SCREEN_WIDTH, 300*KWIDTH);
        [self.view addSubview:self.textView];
        
        
        self.hintTitle = [[UILabel alloc]initWithFrame:CGRectMake(3, 3, 200, 20)];
        
        self.hintTitle.enabled = NO;
        
        self.hintTitle.text = @"在此输入反馈意见";
        
        self.hintTitle.font =  [UIFont systemFontOfSize:15];
        
        self.hintTitle.textColor = [UIColor lightGrayColor];
        
        [self.textView addSubview:self.hintTitle];

    
}
//TextView Delegate

- (void) textViewDidChange:(UITextView *)textView{
    
    if ([textView.text length] == 0) {
        
        [self.hintTitle setHidden:NO];
        
    }else{
        
        [self.hintTitle setHidden:YES];
        
    }
    
}


@end
