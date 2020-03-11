


#import "passwordSetVC.h"

@interface passwordSetVC ()

@end

@implementation passwordSetVC



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
    [self.view addSubview:self.NavBar];
 
    
    
    
    
    
    [self addNavigationController];
    NSArray *hintText = @[@"    请输入密码",@"    请确认密码"];
    CGFloat unTextfieldH = 88*KWIDTH;
    [hintText enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        underLiner *input = underLiner.new;//[[underLiner alloc]initWithFrame:CGRectMake(0,self.NavBar.height + self.NavBar.y + 30*KWIDTH,SCREEN_WIDTH,88*KWIDTH)];
        input.frame = RECT(0,self.NavBar.height + self.NavBar.y + 30*KWIDTH +idx * unTextfieldH,SCREEN_WIDTH,unTextfieldH);
        input.placeholder = hintText[idx];
        input.backgroundColor = UIColor.whiteColor;
        
        #pragma mark  --- (02)kvc来更改 iOS13已经放弃 有新方法
       
        
        
        if (@available(iOS 13.0 , *)) {
            NSMutableAttributedString *arrStr = [[NSMutableAttributedString alloc]initWithString:input.placeholder attributes:
                                                 @{
                                                     NSFontAttributeName:[UIFont systemFontOfSize:12]
                                                 }];
            input.attributedPlaceholder = arrStr;
        }else{
            // 设置占位文字字体颜色
              [input setValue:colorWithHexString(@"#999999") forKeyPath:@"_placeholderLabel.textColor"];
                  [input setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
        }
        
        
      
        
        [self.view addSubview:input];
       
    }];
}
-(void)addNavigationController{
    
    
    
    [self.view addSubview:self.NavBar];
    [self.NavBar setRightButtonIsHidden:NO];
    [self.NavBar setCenterText:@"更换号码"];
   // [self.NavBar setCenterTextColor:UIColor.whiteColor];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        NSLog(@"导航条按钮");
      //  [vc dismissViewControllerAnimated:NO completion:nil];
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
        NSLog(@"密码完成本");
    };
    
    
    
}

@end
