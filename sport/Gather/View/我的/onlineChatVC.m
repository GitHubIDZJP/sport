//
//  onlineChatVC.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "onlineChatVC.h"

@interface onlineChatVC ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)customNavigationBar *NavBar;

@end


@implementation onlineChatVC
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
        
       // _NavBar.backgroundColor =  colorWithHexString(@"#07913B");
       // [self.NavBar setCenterTextColor:UIColor.blackColor];
    }
    
    
    
    return _NavBar;
}
-(UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,JH_NavBarHeight,SCREEN_WIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = [UIColor whiteColor];
        // _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = tableSeparatorColor;
        IOS11;
    }
    return _tableView;
}
-(UIImageView *)imageViewFly
{
    if(!_imageViewFly)
    {
        CGFloat y=self.NavBar.height + self.NavBar.y;
        _imageViewFly  = getImgView(RECT(0,y,SCREEN_WIDTH,SCREEN_HEIGHT - y), UIViewContentModeScaleToFill);//内容模式缩放方面填充
        
        _imageViewFly.image = [UIImage imageNamed:@"在线客服@2x"];
        
        
    }
    return _imageViewFly;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imageViewFly];
    [self.view addSubview:self.NavBar];
 
    [self.NavBar setRightButtonIsHidden:NO];
    
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        NSLog(@"导航条按钮");
          [vc.navigationController popToRootViewControllerAnimated:YES];
    }];
   
    [self.NavBar setCenterText: @"个人信息"];
    [self.NavBar setRightButtonTitle:@"意见反馈"];
    [self.NavBar setRightBtnTag:100];
    UIButton *rRespondBtn = (UIButton *)[self.NavBar viewWithTag:100];
    CGRect frame = rRespondBtn.frame;
    frame.size.width = 108*KWIDTH;
    frame.size.height = 50*KWIDTH;
    frame.origin.x -= 10*KWIDTH;
    rRespondBtn.frame = frame;
    rRespondBtn.backgroundColor = [UIColor clearColor];
    [rRespondBtn setTitleColor:colorWithHexString(@"#07913B") forState:UIControlStateNormal];
    rRespondBtn.titleLabel.font = Font12;
    [rRespondBtn setTitleColor:UIColor.whiteColor forState:0];
   
    
    
    
    [self.NavBar setPushBlock:^{
        NSLog(@"意见反馈");
    }];
    
}


@end
