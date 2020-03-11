

#import "replacePhoneNumber.h"

@interface replacePhoneNumber ()

@end

@implementation replacePhoneNumber
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
        
      //  _NavBar.backgroundColor =  colorWithHexString(@"#07913B");
    }
    return _NavBar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = color(243, 243, 243);
    
    
    [self addNavigationController];
   
   
 
    NSArray *hintText = @[@"    请输入旧手机号",@"    请输入新手机号",@"    请输入验证码"];
    CGFloat unTextfieldH = 88*KWIDTH;
    [hintText enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        underLiner *input = underLiner.new;//[[underLiner alloc]initWithFrame:CGRectMake(0,self.NavBar.height + self.NavBar.y + 30*KWIDTH,SCREEN_WIDTH,88*KWIDTH)];
        input.frame = RECT(0,self.NavBar.height + self.NavBar.y + 30*KWIDTH +idx * unTextfieldH,SCREEN_WIDTH,unTextfieldH);
        input.placeholder = hintText[idx];
        input.backgroundColor = UIColor.whiteColor;
        
#pragma mark  --- (01)kvc来更改 iOS13已经放弃 有新方法
        [input setValue:colorWithHexString(@"#999999") forKeyPath:@"_placeholderLabel.textColor"];
        [input setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
     
        [self.view addSubview:input];
        if(idx == 2){
            
            
            
            VerificationCodeButton *getVCode = VerificationCodeButton.new;
            getVCode.frame = RECT(550*KWIDTH,0*KWIDTH,SCREEN_WIDTH - 550*KWIDTH,input.height);
            [input addSubview:getVCode];
            [getVCode addTarget:self action:@selector(addClick:) forControlEvents:1 << 6];
            [getVCode setBtnTitle:@"获取验证码"];
            
            
        }
    }];
    
   
    
    
    
    
    
    
    
}

-(void)addClick:(UIButton*)getVer_CODE{
    NSLog(@"获取验证码");
    
}
-(void)addNavigationController{
    
    [self.view addSubview:self.NavBar];
    [self.NavBar setRightButtonIsHidden:NO];
    [self.NavBar setCenterText:@"更换号码"];
   // [self.NavBar setCenterTextColor:UIColor.whiteColor];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        NSLog(@"导航条按钮");
       // [vc dismissViewControllerAnimated:NO completion:nil];
          [vc.navigationController popViewControllerAnimated:YES];
    }];
    [self.NavBar setRightBtnTag:1];
    UIButton *finishBtn = (UIButton*)[self.NavBar viewWithTag:1];
    //finishBtn.frame = RECT(632*KWIDTH,59*KWIDTH,88*KWIDTH,50*KWIDTH);
    [self.NavBar setRightButtonTitle:@"完成"];
    
    CGRect frame = finishBtn.frame;
    //frame.x =100;
    frame.size.width = 88*KWIDTH;
    frame.size.height = 50*KWIDTH;
    finishBtn.frame = frame;
    finishBtn.backgroundColor = UIColor.whiteColor;
    [finishBtn setTitleColor:colorWithHexString(@"#07913B") forState:0];
    finishBtn.layer.cornerRadius = 9*KWIDTH;
    finishBtn.layer.masksToBounds = YES;
//    [finishBtn addAction:^(id  _Nonnull sender) {
//        NSLog(@"点击完成");
//    }];
    self.NavBar.pushBlock = ^{
        NSLog(@"完成");
    };

    
    
}
@end


