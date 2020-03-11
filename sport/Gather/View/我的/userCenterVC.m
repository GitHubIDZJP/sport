//
//  userCenterVC.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "userCenterVC.h"

@interface userCenterVC ()
{
    UIView *ContFrigging;
}

@end

@implementation userCenterVC
-(UIScrollView *)scrSuperView
{
    if(!_scrSuperView){
        
        _scrSuperView = UIScrollView.new;
        
        _scrSuperView.frame = CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
        _scrSuperView.scrollEnabled = YES;
        _scrSuperView.contentSize = CGSizeMake(SCREEN_WIDTH, _scrSuperView.height*1.1);
        _scrSuperView.backgroundColor =color(240, 240, 240) ;//[UIColor clearColor];
        
    }
    return _scrSuperView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrSuperView];
    self.scrSuperView.scrollEnabled = YES;
    ContFrigging = [[UIView alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,360*KWIDTH)];
    ContFrigging.backgroundColor = [UIColor purpleColor];
    
    [self.scrSuperView addSubview:ContFrigging];
    self.navigationController.navigationBarHidden = YES;
    [self prefersStatusBarHidden];
    

    [self addHeaderView];
}

-(void)addHeaderView
{
    _firstLevelView = [[userCenterHeaderView alloc]initWithFrame:CGRectMake(self.scrSuperView.x,self.scrSuperView.y,self.scrSuperView.width,360*KWIDTH)];
    [self.scrSuperView addSubview:_firstLevelView];
    [_firstLevelView setAvatarImg:@"userPic" setUserName:@"冉乐先生" setUserSignatureText:@"每个秋天都是一个轮回"];
    
    __block  UIViewController *vc = self;
    _firstLevelView.returnBtnBlock = ^{
        NSLog(@"返回z上个页面");
      //  [vc dismissViewControllerAnimated:NO completion:nil];
          [vc.navigationController popViewControllerAnimated:YES];
        
    };
    UIButton *setBtn = (UIButton*)[_firstLevelView viewWithTag:2];
    [setBtn addAction:^(id  _Nonnull sender) {
        NSLog(@"消息");
        //        personalInformationViewController *info = [[personalInformationViewController alloc]init];
        //        //    settingViewController *pushJion = [[settingViewController  alloc]init];
        //        info.modalPresentationStyle = 0;
        //        [self presentViewController:info animated:NO completion:nil ];
        
    }];

    [self addCoinOrWelfare];
}
-(void)addCoinOrWelfare{
    
    NSArray *recordData = @[@"11",@"66"];
    //后台获取数据
    NSArray *bottomNumbers = @[@"关注",@"粉丝"];
    for(int i=0; i<recordData.count; i++)
    {
        CGFloat w = 100*KWIDTH;
        
        //CGFloat myMessBtnW = 100;//_scrSuperView.width/recordData.count;
        CGFloat myMessBtnSpacing = (_scrSuperView.width/3);
        //  CGFloat myMessBtnM_LEFT =myMessBtnSpacing/2;
        MyButton *myMessBtn = [[MyButton alloc]initWithFrame:CGRectMake(155*KWIDTH + i * (w + myMessBtnSpacing),274*KWIDTH,w,100*KWIDTH)];
        [_firstLevelView addSubview:myMessBtn];
        // myMessBtn.backgroundColor = [UIColor redColor];
        [myMessBtn setTitleContext: recordData[i] titleData:bottomNumbers[i]];
        if(i == 0){
            [myMessBtn addAction:^(id  _Nonnull sender) {
                NSLog(@"球比");
            }];
        }else if (i == 1){
            [myMessBtn addAction:^(id  _Nonnull sender) {
                NSLog(@"福利");
            }];
        }
        /*
         切花九年级页面时可以通过数组保存VC,
         */
    }
}
- (BOOL)prefersStatusBarHidden

{
    
    
    return YES;//隐藏为YES，显示为NO
    
}

@end
