

//发布文章
#import "WritingForPublicationVC.h"

@interface WritingForPublicationVC ()
@property (weak, nonatomic) IBOutlet UIButton *freeBtn;
@property (weak, nonatomic) IBOutlet UIButton *PayMoneyBtn;

@end



@implementation WritingForPublicationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
 //   self.PayMoneyBtn.backgroundColor = UIColor.redColor;
   // self.freeBtn.backgroundColor = UIColor.purpleColor;
    
    self.freeBtn.layer.cornerRadius = 10*KWIDTH;
    self.freeBtn.layer.masksToBounds = YES;
    _PayMoneyBtn.layer.cornerRadius = 10*KWIDTH;
    _PayMoneyBtn.layer.masksToBounds = YES;
    _PayMoneyBtn.layer.borderWidth = 1;
    _PayMoneyBtn.layer.borderColor = color(75,159,74).CGColor;
    _payBox.layer.cornerRadius = 10*KWIDTH;
    _payBox.layer.masksToBounds = YES;
    
    VCBGCOLOR;
       [self setStatusBarBackgroundColor:UIColor.whiteColor];
    if (IS_iPhoneX)
    {
        CGRect originFrame = self.navBar.frame;
        originFrame.origin.y += zjpTest;
        self.navBar.frame = originFrame;
        NSLog(@"高:%f",self.navBar.height);
    }
    
    
    
    //submit
    //本机号码一键登录
    UIButton *submit = [UIButton buttonWithType:UIButtonTypeCustom];
    
    submit.frame = CGRectMake(30*KWIDTH, 1216*KWIDTH+zjpTest,SCREEN_WIDTH -60*KWIDTH,90*KWIDTH );
    [submit setBackgroundImage:[UIImage imageNamed:@"申请"] forState:0];
    [self.view addSubview:submit];
}
- (IBAction)returnPage:(id)sender {
    
  //  [self dismissViewControllerAnimated:NO completion:nil];
      [self.navigationController popViewControllerAnimated:YES];
}
-(void)setStatusBarBackgroundColor:(UIColor *)color
{
    statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }

}


/*
 spendMoney
 free
 if(idx == 0){
 [btn setTitleColor:colorWithHexString(@"#4CB13B") forState:UIControlStateNormal];
 btn.backgroundColor = color(254, 254, 254);
 btn.layer.borderColor =color(76,177,59).CGColor;
 //先默认一个  也就是后面要选择的操作
 }else if (idx == 1){
 [btn setTitleColor:colorWithHexString(@"#999999") forState:UIControlStateNormal];
 btn.backgroundColor = color(245, 245, 245);
 btn.layer.borderColor =color(178,178,178).CGColor;
 }
 */
- (IBAction)free:(UIButton*)sender{
    
    NSLog(@"免费");
    if((sender.selected = !sender.selected)){
        //sender.selected = YES;
        
        sender.backgroundColor = UIColor.redColor;
    }else{
        //sender.selected = NO;
       sender.backgroundColor = UIColor.purpleColor;
    }
    
}
- (IBAction)spendMoney:(UIButton*)sender{
    NSLog(@"花钱");
    if((sender.selected = !sender.selected)){
        sender.selected = YES;
        self.PayMoneyBtn.backgroundColor = UIColor.redColor;
    }else{
        sender.selected = YES;
        self.freeBtn.backgroundColor = UIColor.whiteColor;
    }
}




@end
