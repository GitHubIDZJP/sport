//
//  addAttentionVC.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "addAttentionVC.h"
#import "setButtonRadius.h"
#import "UIView+BorderLine.h"
#define lineSpece 1.5
@interface addAttentionVC ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)customNavigationBar *NavBar;

@property(nonatomic,strong)setButtonRadius *selBtn;


@end



@implementation addAttentionVC
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
        
       // _NavBar.backgroundColor =  colorWithHexString(@"#07913B");
    }
    return _NavBar;
}
-(UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,JH_NavBarHeight,SCREEN_WIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = color(242, 242,242);
        // _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = tableSeparatorColor;
        IOS11;
    }
    return _tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = color(242, 242, 242);
    [self.view addSubview:self.NavBar];
    [self.view addSubview:self.tableView];
    [self.NavBar setRightButtonIsHidden:YES];
     __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        NSLog(@"导航条按钮");
     
          [vc.navigationController popViewControllerAnimated:YES];
    }];
    selecIndex =100;
    NSArray *buttonLabels = @[@"关注",@"粉丝"];
    for(int b = 0;b< buttonLabels.count;b++){
        _selBtn = setButtonRadius.new;
        
        CGFloat selBtnW = 152*KWIDTH;
               
               CGFloat selBtnX = SCREEN_WIDTH/2 - selBtnW;
               
               _selBtn.frame  = CGRectMake(selBtnX + (selBtnW)*b,50*KWIDTH+zjpTest,selBtnW,58*KWIDTH);
        
        [_selBtn addTarget:self action:@selector(TestOnClick:) forControlEvents:1 << 6];
        _selBtn.backgroundColor = UIColor.whiteColor;
        _selBtn.tag = 100+b;
        [_selBtn setTitle:buttonLabels[b] forState:UIControlStateNormal];
        if(b == 0){
            
            _selBtn.backgroundColor = colorWithHexString(@"#4CB13B");
            [_selBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
            [_selBtn viewRadius:2 RectCorner:UIRectCornerTopLeft | UIRectCornerBottomLeft view:_selBtn];
            [_selBtn borderForColor:colorWithHexString(@"#4CB13B") borderWidth:0.5 borderType:UIBorderSideTypeRight];
            
            
            
            
            
          
        }else if (b == 1){
            [_selBtn viewRadius:2 RectCorner:UIRectCornerBottomRight | UIRectCornerTopRight view:_selBtn];
           [_selBtn borderForColor:colorWithHexString(@"#4CB13B") borderWidth:0.5 borderType:UIBorderSideTypeLeft];
        //#4CB13B
             [_selBtn setTitleColor:colorWithHexString(@"#4CB13B") forState:UIControlStateNormal];
         
            
            
            
          
                     _selBtn.layer.borderColor=color(65,142,69).CGColor;
            
            [_selBtn  borderForColor:colorWithHexString(@"#4CB13B") borderWidth:lineSpece borderType:UIBorderSideTypeRight];
                              [_selBtn  borderForColor:colorWithHexString(@"#4CB13B") borderWidth:lineSpece borderType:UIBorderSideTypeTop];
                              [_selBtn  borderForColor:colorWithHexString(@"#4CB13B") borderWidth:lineSpece borderType:UIBorderSideTypeBottom];
        }
       
        [self.NavBar addSubview:_selBtn];
    }
    
}
-(void)TestOnClick:(UIButton *)sender{
      UIButton *btn1 = (UIButton *)[self.view viewWithTag:100];
      UIButton *btn2 = (UIButton *)[self.view viewWithTag:101];
    selecIndex = sender.tag;
      if (sender.tag == 100 || selecIndex == 100) {
     
          [btn2 borderForColor:colorWithHexString(@"#4CB13B") borderWidth:lineSpece borderType:UIBorderSideTypeRight];
                   [btn2 borderForColor:colorWithHexString(@"#4CB13B") borderWidth:lineSpece borderType:UIBorderSideTypeTop];
                   [btn2 borderForColor:colorWithHexString(@"#4CB13B") borderWidth:lineSpece borderType:UIBorderSideTypeBottom];
          
          
          
           [btn2 borderForColor:colorWithHexString(@"#4CB13B") borderWidth:0.5 borderType:UIBorderSideTypeLeft];
          
          btn2.layer.borderColor = color(104, 175, 77).CGColor;//不选中
          btn2.backgroundColor = UIColor.whiteColor;
          btn1.backgroundColor =colorWithHexString(@"#4CB13B");
          [btn1 setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
          [btn2 setTitleColor:color( 65,142,69) forState:UIControlStateNormal];
          [self.tableView reloadData];
      }else if(sender.tag ==  101  || selecIndex == 101){
          btn2.backgroundColor =colorWithHexString(@"#4CB13B");
          btn1.backgroundColor = UIColor.whiteColor;
          [btn2 setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
          
          
           [btn1 borderForColor:colorWithHexString(@"#4CB13B") borderWidth:lineSpece borderType:UIBorderSideTypeLeft];
           [btn1 borderForColor:colorWithHexString(@"#4CB13B") borderWidth:lineSpece borderType:UIBorderSideTypeTop];
           [btn1 borderForColor:colorWithHexString(@"#4CB13B") borderWidth:lineSpece borderType:UIBorderSideTypeBottom];
          [btn1 borderForColor:colorWithHexString(@"#4CB13B") borderWidth:0.5 borderType:UIBorderSideTypeRight];
          btn1.layer.borderColor = color( 65,142,69).CGColor;//不选中
           [btn1 setTitleColor:color( 65,142,69) forState:UIControlStateNormal];
          [self.tableView reloadData];
      }
    /*
     selecIndex = sender.selectedSegmentIndex;
      if(selecIndex == 0){
         
          [self.tableView reloadData];
      }else if (selecIndex == 1){
        
          [self.tableView reloadData];
     
      }
     */
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
//每组的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return  1;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
//    if(section ==0){
//        return 30*KWIDTH;
//    }
    return 20*KWIDTH;
}
//
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if(section == 0){
        return 0.01;
    }
    return section;
    
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150*KWIDTH;
}
//数据源
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"it's cell data";
    static NSString *pig = @"pig test";
    if(selecIndex == 100){
        mySelfFansViewControllerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(!cell){
            
            cell= [[mySelfFansViewControllerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            
        }
        cell.backgroundColor = UIColor.whiteColor;
        btn = (UIButton*)[cell viewWithTag:10010];
        if(indexPath.section == 0){
            [cell setHeaderImg:@"头像" userName:@"黄大师"  sig:@"签名嘻嘻嘻嘻嘻嘻嘻嘻寻寻寻寻寻寻寻寻寻"];
           
          
            [btn addTarget:self action:@selector(changeTitle:) forControlEvents:1 << 6];
         
            tagFirst = indexPath.row;
            
        }else if (indexPath.section == 1){
            tagSecond = indexPath.row;

             [btn addTarget:self action:@selector(changeTitle1:) forControlEvents:1 << 6];
            [cell setHeaderImg:@"头像" userName:@"刘大脑袋" sig:@"签名嘻嘻嘻嘻嘻嘻嘻嘻寻寻寻寻寻寻寻寻寻"];
            
        }
        
        
        return cell;
    }else if (selecIndex == 101){
        
        mySelfFansViewControllerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pig];
        if(!cell){
            
            cell= [[mySelfFansViewControllerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            
        }
        btn1 = (UIButton*)[cell viewWithTag:10010];
        if(indexPath.section == 0){
             [btn1 addTarget:self action:@selector(changeTitle2:) forControlEvents:1 << 6];
             tagThird =indexPath.row;
            [cell setHeaderImg:@"头像" userName:@"太锦鲤" sig:@"签名嘻嘻嘻嘻嘻嘻嘻嘻寻寻寻寻寻寻寻寻寻" ];
            
        }else if (indexPath.section == 1){
            
             [btn1 addTarget:self action:@selector(changeTitle3:) forControlEvents:1 << 6];
            tagFourth = indexPath.row;
            [cell setHeaderImg:@"头像" userName:@"小赤佬" sig:@"签名嘻嘻嘻嘻嘻嘻嘻嘻寻寻寻寻寻寻寻寻寻" ];
           
        }
        
        return cell;
    }
    
    return nil;
    
}
-(void)changeTitle:(UIButton*)sender{
    if( (sender.selected = !sender.selected))
    {
        sender.backgroundColor = colorWithHexString(@"#14A03E");
        sender.layer.borderWidth = 1;
        sender.layer.borderColor = color(239,239,239).CGColor;
        [sender setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [sender setTitle:@"已关注" forState:UIControlStateNormal];
        sender.selected = YES;
    }else{
        
        //sender.backgroundColor = UIColor.whiteColor;//不选中
        sender.layer.borderColor = color(239,239,239).CGColor;
        [sender setTitleColor:colorWithHexString(@"#999999") forState:UIControlStateNormal];
        sender.backgroundColor =UIColor.whiteColor;
        [sender setTitle:@"不关注" forState:UIControlStateNormal];
        sender.selected= NO;
    }
    
    }
-(void)changeTitle1:(UIButton*)sender{
    
    if( (sender.selected = !sender.selected))
    {
        sender.backgroundColor = colorWithHexString(@"#14A03E");
        sender.layer.borderWidth = 1;
        sender.layer.borderColor = color(239,239,239).CGColor;
        [sender setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [sender setTitle:@"已关注" forState:UIControlStateNormal];
        sender.selected = YES;
    }else{
        
        //sender.backgroundColor = UIColor.whiteColor;//不选中
        sender.layer.borderColor = color(239,239,239).CGColor;
        [sender setTitleColor:colorWithHexString(@"#999999") forState:UIControlStateNormal];
        sender.backgroundColor =UIColor.whiteColor;
        [sender setTitle:@"不关注" forState:UIControlStateNormal];
        sender.selected= NO;
    }
    
}

-(void)changeTitle2:(UIButton*)sender{
    if( (sender.selected = !sender.selected))
    {
        sender.backgroundColor = colorWithHexString(@"#14A03E");
        sender.layer.borderWidth = 1;
        sender.layer.borderColor = color(239,239,239).CGColor;
        [sender setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [sender setTitle:@"已关注" forState:UIControlStateNormal];
        sender.selected = YES;
    }else{
        
        //sender.backgroundColor = UIColor.whiteColor;//不选中
        sender.layer.borderColor = color(239,239,239).CGColor;
        [sender setTitleColor:colorWithHexString(@"#999999") forState:UIControlStateNormal];
        sender.backgroundColor =UIColor.whiteColor;
        [sender setTitle:@"不关注" forState:UIControlStateNormal];
        sender.selected= NO;
    }
    
}
-(void)changeTitle3:(UIButton*)sender{
    if( (sender.selected = !sender.selected))
    {
        sender.backgroundColor = colorWithHexString(@"#14A03E");
        sender.layer.borderWidth = 1;
        sender.layer.borderColor = color(239,239,239).CGColor;
        [sender setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [sender setTitle:@"已关注" forState:UIControlStateNormal];
        sender.selected = YES;
    }else{
        
        //sender.backgroundColor = UIColor.whiteColor;//不选中
        sender.layer.borderColor = color(239,239,239).CGColor;
        [sender setTitleColor:colorWithHexString(@"#999999") forState:UIControlStateNormal];
        sender.backgroundColor =UIColor.whiteColor;
        [sender setTitle:@"不关注" forState:UIControlStateNormal];
        sender.selected= NO;
    }
    
}


@end
