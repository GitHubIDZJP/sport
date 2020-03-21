//
//  attentionVC.m
//  Sports
//
//  Created by test on 2020/1/9.
//  Copyright © 2020 test. All rights reserved.
//







#import "attentionVC.h"
#import "ZJPSortView.h"
@interface attentionVC()
{
    
    NSMutableArray *unitel;
    UIButton *btn;
}
@end
@implementation attentionVC
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    
    //VCBGCOLOR;
    self.view.backgroundColor = UIColor.whiteColor;
    UIView *view = UIView.new;
    view.userInteractionEnabled = YES;
    view.frame  = RECT(0,0*KWIDTH,SCREEN_WIDTH,80*KWIDTH);
    view.backgroundColor  = colorWithHexString(@"#F3F6F4");
    [self.view addSubview:view];
    UILabel *label = UILabel.new;
    label.text    =@"我关注的赛事";
    label.font = Font14;
    label.frame = RECT(31*KWIDTH,25*KWIDTH,200,27*KWIDTH);
    [view addSubview:label];
    
    UIButton *regroupBtn = UIButton.new;
    regroupBtn.frame = RECT(SCREEN_WIDTH - (140+31)*KWIDTH,17*KWIDTH,140*KWIDTH,44*KWIDTH);
    [regroupBtn setTitle:@"排序/删除" forState:0];
    regroupBtn.layer.cornerRadius = 10;
    regroupBtn.layer.masksToBounds = YES;
    [regroupBtn setTitleColor:colorWithHexString(@"#4CB13B") forState:0];
    
    regroupBtn.titleLabel.font = Font12;
    regroupBtn.layer.borderWidth = 1;
    regroupBtn.layer.borderColor  = color(76, 177, 59).CGColor;
    [self.view addSubview:regroupBtn];
    [regroupBtn addTarget:self action:@selector(sortOrDel:) forControlEvents:1<< 6];
    [view addSubview:regroupBtn];
    [self addbtns];
   
    
    
}
-(void)sortOrDel:(UIButton*)sD{
    NSLog(@"排序/删除");
}
-(void)addbtns{
    unitel = [NSMutableArray arrayWithObjects:@"英超",@"西甲",@"英超",@"欧冠",@"中超",@"亚冠",@"欧联杯",@"中甲",@"足协杯",@"美洲杯",@"中箭",@"西曼",@"巴黄",@"顺发",nil] ;//@[@"英超",@"西甲",@"英超",@"欧冠",@"中超",@"亚冠",@"欧联杯",@"中甲",@"足协杯",@"美洲杯"];
    /*
     NSMutableArray * titlesArray = [NSMutableArray array];
     for (NSInteger i = 0; i < 19; i++) {
     
     // [titlesArray addObject:[NSString stringWithFormat:@"IMLoser-%02zd",i + 1]];
     }
     */
    // self.view.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    ZJPSortView * sortView = [ZJPSortView sortViewWithTitlesArray:unitel];
    sortView.columnCount = 4;//每行的个数
    //sortView.backgroundColor = UIColor.redColor;
    sortView.frame = CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:sortView];
    
}
- (BOOL)prefersStatusBarHidden { return YES; }

/*
 
 for(int  i  = 0;i< unitel.count;i++){
 // row = 3
 btn = [UIButton buttonWithType:UIButtonTypeCustom];
 btn.backgroundColor = colorWithHexString(@"#F3F6F4");
 btn.frame  = CGRectMake(30*KWIDTH+(i%4)*177*KWIDTH,100*KWIDTH+(i/4)*100*KWIDTH+zjpTest,157*KWIDTH,68*KWIDTH);
 [btn setTitle:unitel[i] forState:0];
 btn.titleLabel.font = Font13;
 [btn setTitleColor:UIColor.blackColor forState:0];
 // [btn setTitleColor:UIColor.purpleColor forState:1 << 2];//sel
 [btn addTarget:self action:@selector(click:) forControlEvents:1<< 6];
 btn.tag = i+100;
 //btn.layer.borderWidth =0.5;
 btn.layer.cornerRadius = 5;
 //btn.layer.borderColor= UIColor.blueColor.CGColor;//不选择时blue
 [self.view addSubview:btn];
 
 //后期直接通过数组存vc
 if(i ==0){
 //TeamListVC
 __block  UIViewController *vc = self;
 [ btn  addAction:^(id  _Nonnull sender) {
 NSLog(@"写信");
 Class class=NSClassFromString(@"TeamListVC");
 
 if(class) {
 
 UIViewController *ctrl =class.new;
 ctrl.modalPresentationStyle = 0;
 [vc presentViewController:ctrl animated:NO completion:nil];
 
 
 }
 
 
 }];
 
 }
 
 }
 
 
 }
 -(void)tap:(UIButton*)sender{
 
 
 
 
 }
 -(void)click:(UIButton*)senderBtn{
 
 for(int i = 0;i< unitel.count;i++){
 if(senderBtn.tag == 100+i){
 senderBtn.selected = YES;
 senderBtn.layer.borderColor = UIColor.redColor.CGColor;
 senderBtn.layer.borderWidth = 0.5;
 
 continue;
 
 }
 UIButton *testBtn = (UIButton*)[self.view viewWithTag:i+100];
 testBtn.selected = NO;
 testBtn.layer.borderColor =UIColor.blueColor.CGColor;//不选择时blue
 testBtn.layer.borderWidth = 0.5;
 
 
 }
 
 
 }*/

@end
