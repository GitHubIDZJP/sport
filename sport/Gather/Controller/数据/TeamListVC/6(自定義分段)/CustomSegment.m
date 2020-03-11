#define W   [UIScreen mainScreen].bounds.size.width
#define H   [UIScreen mainScreen].bounds.size.height
#import "CustomSegment.h"
#import "CustomSegmentView.h"
/*
 segViewController
 */
#import "kingViewController.h"
#import "UpperClassViewController.h"
#import "MiddleClassViewController.h"
#import "LowerClassViewController.h"
#import "GentryClassViewController.h"
@interface CustomSegment ()<CustomDelegate>
{
    CustomSegmentView  *mediumView;
   
}

@property(nonatomic,strong)NSArray *segmentVC;

@end

@implementation CustomSegment

- (void)viewDidLoad {
    [super viewDidLoad];
    self.segmentVC = @[@"皇帝",@"上层",@"中层",@"下层",@"绅士"];
    
    
    
   mediumView = [[CustomSegmentView alloc]initWithFrame:CGRectMake(50,130,290,20) segmentArray:self.segmentVC background:[UIColor purpleColor] selectedColor:UIColor.yellowColor borderColor:UIColor.blueColor borderWidth:2 textFont:[UIFont fontWithName:@"bold" size:11] textColor:UIColor.orangeColor position:@"right"];
    mediumView.backgroundColor = UIColor.redColor;
     mediumView.myDelagte= self;
    [self.view addSubview:mediumView];
    [self addChildVCs];
    [self buttonClick:0];
    
    
}
- (IBAction)jumpToMainViewController:(UIButton *)sender {
  
    
    //[self dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)buttonClick:(NSInteger)sender {
    UIViewController *oldVc = self.childViewControllers[0];
    [oldVc.view removeFromSuperview];
    UIViewController *newVc = self.childViewControllers[sender/1];
    
    newVc.view.frame = CGRectMake(0,180, W, H-130);
    [self.view addSubview:newVc.view];
}
- (void)addChildVCs
{
    //初始化
    kingViewController *king = [[kingViewController alloc]init];
    UpperClassViewController *upper= [[UpperClassViewController alloc]init];
    MiddleClassViewController *middle = [[MiddleClassViewController alloc]init];
    LowerClassViewController *lower = [[LowerClassViewController alloc]init];
    GentryClassViewController * GentryView = [[GentryClassViewController alloc]init];
    
    //加载
    [self addChildViewController:king];
    [self addChildViewController:upper];
    [self addChildViewController:middle];
    [self addChildViewController:lower];
    [self addChildViewController:GentryView];

}



@end
