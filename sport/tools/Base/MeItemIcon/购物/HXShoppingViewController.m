

#import "HXShoppingViewController.h"

@interface HXShoppingViewController ()
@property(nonatomic,strong)customNavigationBar *NavBar;
@end




@implementation HXShoppingViewController
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
        
       // _NavBar.backgroundColor =  colorWithHexString(@"#07913B");
    }
    return _NavBar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = color(240, 240, 240);
    [self.view addSubview:self.NavBar];
       [self.NavBar setRightButtonIsHidden:YES];
       [self.NavBar setCenterText:@"购物车"];
       __block  UIViewController *vc = self;
       [self.NavBar setBackBlock:^{
           NSLog(@"导航条按钮");
           [vc.navigationController popViewControllerAnimated:YES];
       }];
    
    UILabel *kindnessRemind = getLabel(RECT(100*KWIDTH,self.NavBar.y+ self.NavBar.height+500*KWIDTH,ScreenWidth - 200*KWIDTH,80*KWIDTH),@"The store is closed", UIColor.redColor, Font10);
    kindnessRemind.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:kindnessRemind];
     
}

@end
