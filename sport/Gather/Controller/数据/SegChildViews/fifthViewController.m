//
//  fifthViewController.m
//  SectionChooseVC
//
//  Created by test on 2020/1/9.
//  Copyright © 2020 lujh. All rights reserved.
//



#import "fifthViewController.h"
#import "BallDataVC.h"
#import "BallSizeDataVC.h"
#import "concedePointsView.h"
#import "dataAnalysisView.h"
@interface fifthViewController ()
{
    
    UIButton *btn;
    UILabel *label1 ;
    UILabel *label2;
    UIButton *btn1;
    UIButton *btn2;
//    concedePointsView *view1;
//    dataAnalysisView *view2;
    UIView *view1;
    UIView *view2;
}

@end



@implementation fifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addRepareType];
    self.view.backgroundColor = UIColor.whiteColor;
    
    
}
-(void)addRepareType{
    NSArray *title = @[@"让球",@"大小"];
    for(int i = 0;i< 2;i++){
        btn = [[UIButton alloc]init];
        btn.frame = RECT(187*KWIDTH+ i* 187*KWIDTH,0*KWIDTH,187*KWIDTH,60*KWIDTH);
        [btn setTitle:title[i] forState:0];
        //btn.backgroundColor = UIColor.redColor;
        btn.tag = i+100;
        [btn addTarget:self action:@selector(click:) forControlEvents:1<< 6];
         [self.view addSubview:btn];
        //label
//        UILabel *label = UILabel.new;
//        label.frame = RECT(btn.x+ 50*KWIDTH,btn.y+btn.height + 100,btn.width-100*KWIDTH,1);
//        label.tag = i+100;
//        [self.view addSubview:label];
        
        
        
        //style
        if(i == 0){
        [btn setTitleColor: colorWithHexString(@"#4CB13B") forState:0];
           // label.backgroundColor = UIColor.redColor;
        }else if(i == 1){
             [btn setTitleColor: colorWithHexString(@"#999999") forState:0];
            //btn.backgroundColor = UIColor.yellowColor;
        }
        
    }
    btn1 = (UIButton*)[self.view viewWithTag:100];
    btn2 = (UIButton *)[self.view viewWithTag:101];
    CGFloat l_w = 32*KWIDTH;
    CGFloat labelX = btn1.x + (btn.width/2  - l_w/2);
     CGFloat labelX1 = btn2.x + (btn.width/2  - l_w/2);
    label1 = UILabel.new;
    label1.frame = RECT(labelX,btn.y+btn.height + 1,l_w,1);
    label1.backgroundColor = colorWithHexString(@"#4CB13B");
    [self.view addSubview:label1];
    
    label2 = UILabel.new;
    label2.frame = RECT(labelX1,label1.y,label1.width,1);
    label2.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:label2];
    

    
    
    
    //大小
    //view1 = [[concedePointsView alloc]initWithFrame:RECT(0,200,SCREEN_WIDTH,100*KWIDTH)];
      view1 = [[UIView alloc]initWithFrame:RECT(0,btn.y + btn.height+2,SCREEN_WIDTH,918*KWIDTH)];
    view1.backgroundColor = UIColor.redColor;
    
    [self.view addSubview:view1];
    
    //让球
   // view2 = [[UIView alloc]initWithFrame:RECT(0,200,SCREEN_WIDTH,100*KWIDTH)];
    view2 = [[UIView alloc]initWithFrame:RECT(0,view1.y,SCREEN_WIDTH,view1.height)];
    view2.backgroundColor = UIColor.yellowColor;
    
    /*
     方法有2类 一类是直接在就有UIView里initTalebiewView
             还有一类就是直接创建一个VC 并且直接加载到 view里  父view在加载到self.view里
     */
    
    
    
    
    BallDataVC *vc = [[BallDataVC alloc]init];
    [self addChildViewController:vc];
    vc.view.frame = self.view.bounds;
    [view2 addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    [self.view addSubview:view2];
    
    
    
    BallSizeDataVC *vc1 = [[BallSizeDataVC alloc]init];
    [self addChildViewController:vc1];
    vc1.view.frame = self.view.bounds;
    [view1 addSubview:vc1.view];
    [vc1 didMoveToParentViewController:self];
    
    

    
    
}
-(void)click:(UIButton*)sender{
    NSLog(@"点击了:%ld",(long)sender.tag);
    
//     UILabel *label1 = (UILabel *)[self.view viewWithTag:100];
//     UILabel *label2 = (UILabel *)[self.view viewWithTag:101];
    if(sender == btn1 ){
         [btn1 setTitleColor: colorWithHexString(@"#4CB13B") forState:0];
         [btn2 setTitleColor: colorWithHexString(@"#999999") forState:0];
        
        label1.backgroundColor = colorWithHexString(@"#4CB13B");
        label2.backgroundColor = UIColor.whiteColor;
        [view1 removeFromSuperview];
        [self.view addSubview:view2];
    }else{
        [btn2 setTitleColor: colorWithHexString(@"#4CB13B") forState:0];
        [btn1 setTitleColor: colorWithHexString(@"#999999") forState:0];
        
        
        
        label2.backgroundColor = colorWithHexString(@"#4CB13B");
        label1.backgroundColor = UIColor.whiteColor;
        [view2 removeFromSuperview];
        [self.view addSubview:view1];
    }
    
    
    
}
@end
