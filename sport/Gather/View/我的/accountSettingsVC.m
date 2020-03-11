//
//  accountSettingsVC.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "accountSettingsVC.h"

@interface accountSettingsVC ()

@end

@implementation accountSettingsVC
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
        
       // _NavBar.backgroundColor =  colorWithHexString(@"#07913B");
    }
    return _NavBar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = color(243, 243, 243);
    
    
    [self addNavigationController];
    
    [self pNumberSet];
    
    
}
-(void)addNavigationController{
    
    [self.view addSubview:self.NavBar];
    [self.NavBar setRightButtonIsHidden:YES];
    [self.NavBar setCenterText:@"手机号设置"];
   // [self.NavBar setCenterTextColor:UIColor.whiteColor];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        NSLog(@"导航条按钮");
        //[vc dismissViewControllerAnimated:NO completion:nil];
          [vc.navigationController popViewControllerAnimated:YES];
    }];
}

-(void)pNumberSet{
    
    CustomReplacePhoneNumberView *replacePN = [[CustomReplacePhoneNumberView alloc]initWithFrame:RECT(0,self.NavBar.height + self.NavBar.y+ 30*KWIDTH, SCREEN_WIDTH, 88*KWIDTH)];
    replacePN.backgroundColor= UIColor.whiteColor;
    [self.view addSubview:replacePN];
    [replacePN appendPhoneNumber:@"15083***743"];
      __block  UIViewController *vc = self;
    [replacePN setBtnBlock:^{
        NSLog(@"按钮点击:更换号码");
        
      
        Class class=NSClassFromString(@"replacePhoneNumber");
        
        if(class) {
            
            UIViewController *ctrl =class.new;
            ctrl.modalPresentationStyle = 0;
          //  [vc presentViewController:ctrl animated:NO completion:nil];
              [ vc.navigationController pushViewController:ctrl  animated:YES];
        }}];

    
}
@end
