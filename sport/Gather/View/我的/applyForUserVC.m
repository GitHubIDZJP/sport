//
//  applyForUserVC.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#pragma mark 申请专家

#import "applyForUserVC.h"
#import "CustomUITextField.h"
#define descStr @"正、反、手持证件照，须清晰可辨识，与身份证信息一致。"
@interface applyForUserVC ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UIButton *btn;
    CGFloat getTextFieldY;
}
@property(nonatomic,strong)UIView *basementView;

@end

@implementation applyForUserVC
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
        
      //  _NavBar.backgroundColor =  colorWithHexString(@"#07913B");
    }
    return _NavBar;
}
-(UIView*)basementView{
    if(!_basementView){
        
        
        _basementView = UIView.new;
        _basementView.backgroundColor = White;
        _basementView.frame = RECT(30*KWIDTH,self.NavBar.height + self.NavBar.y + 91*KWIDTH,SCREEN_WIDTH - 60*KWIDTH,616*KWIDTH);
       // _basementView.layer.cornerRadius = 10;
      //  [_basementView border:50 color:UIColor.redColor
        _basementView.clipsToBounds = YES;
        _basementView.layer.cornerRadius = 10;
    }
    return _basementView;
}
-(UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,JH_NavBarHeight,SCREEN_WIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = color(243,243,243);
        // _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = color(251, 251,251);
        IOS11;
    }
    return _tableView;
}
-(UIButton*)applyBtn
{
    
    if(!_applyBtn){
        _applyBtn = [[UIButton alloc]init];
        _applyBtn.backgroundColor = colorWithHexString(@"#07913B");
      //  [_applyBtn setTitle:@"提交申请" forState:0];
        [_applyBtn setBackgroundImage:[UIImage imageNamed:@"申请"] forState:0];
        _applyBtn.frame= RECT(30*KWIDTH,973*KWIDTH+zjpTest,SCREEN_WIDTH - 60*KWIDTH,78*KWIDTH);//left 30  right 30 top  973 bottom  283
        _applyBtn.layer.cornerRadius = 10*KWIDTH;
        _applyBtn.layer.masksToBounds = YES;
        [_applyBtn addTarget:self action:@selector(ask:) forControlEvents:1 << 6];
        
    }
    return _applyBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addBtn];
    
    // left : 30px
    // m_left: 37px;
    
    self.view.backgroundColor = color(243, 243, 243);
    //[self.view addSubview:self.tableView];
    [self.view addSubview:self.NavBar];
    [self.NavBar setRightButtonIsHidden:YES];
    [self.NavBar setCenterText:@"申请专家"];
    //[self.NavBar setCenterTextColor:UIColor.whiteColor];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        NSLog(@"导航条按钮");
       // [vc dismissViewControllerAnimated:NO completion:nil];
          [vc.navigationController popViewControllerAnimated:YES];
    }];
    
    [self.view addSubview:self.applyBtn];
    [self.view addSubview:self.basementView];
    
    //文本提示
    UILabel *TextPrompt = getLabel(RECT(31*KWIDTH, self.NavBar.y + self.NavBar.height + 30*KWIDTH,450*KWIDTH,31*KWIDTH), @"成为专家  观点制造财富", colorWithHexString(@"#333333"), Font16);
    TextPrompt.font = [UIFont systemFontOfSize:16 weight:20];
    [self.view addSubview:TextPrompt];
    
    
    
    
    for(int i = 0;i< 3;i++){
        CGFloat h = 140*KWIDTH;
        CustomUITextField *addTf = [[CustomUITextField alloc]initWithFrame:RECT(30*KWIDTH, 0+i* (h), self.basementView.width, h)];
        
        addTf.backgroundColor = UIColor.whiteColor;
        [addTf setPlaceholder:@"绑定了不可以更改"];
        [self.basementView addSubview:addTf];
        i==0?[addTf setHintText:@"真是姓名"]:[addTf setHintText:@"身份证号"];
        i==2?[addTf setHintText:@"手持身份证号"] :nil;
        i==2?[addTf setPlaceholder:descStr]:nil;
       // i ==2?[addTf setValue:Font12 forKeyPath:@"_placeholderLabel.font"]:nil;
        if(i == 2){
            
        }
        //i== 2?[addTf ];
        addTf.tag = 100+i;
        if(i ==2){
            [addTf setHidden:YES];
            [addTf setUserInteractionEnabled:NO];
        }
       
        UITextField *tf      = (UITextField*)[_basementView viewWithTag:102];
        getTextFieldY = tf.height + tf.y ;
    }
    [self addUpLoadBtn];
   

    
  //  UIButton *btnSel = [UIButton alloc]initWithFrame:RECT(30*KWIDTH,self.basementView.height + self.basementView.y);
    btn = [[UIButton alloc]initWithFrame:CGRectMake(30*KWIDTH,self.basementView.height + self.basementView.y+ 20*KWIDTH,24*KWIDTH,24*KWIDTH)];
    [btn setBackgroundImage:[UIImage imageNamed:@"矩形 10@2x"] forState:UIControlStateNormal];
 
    [btn addTarget:self action:@selector(selBtn:) forControlEvents:UIControlEventTouchDown ];
    [self.view addSubview:btn];
 //   [btn setBackgroundImage:[UIImage imageNamed:@"gou@2x"] forState:UIControlStateSelected];
    // btn.backgroundColor = UIColor.purpleColor;
    
    NSString *richText= @"申请专家则表示您认同《球频道的专家号服务协议》";
    //富文本
    NSRange rangStrA = [richText rangeOfString:@"球频道的专家号服务协议"];
    NSRange rangStrB = [richText rangeOfString:@"申请专家则表示您认同"];
    NSMutableAttributedString *str_describe = [[NSMutableAttributedString alloc] initWithString:richText];
    [str_describe addAttribute:NSForegroundColorAttributeName value:colorWithHexString(@"#3289FF") range:rangStrA];//Foreground前景
    [str_describe addAttribute:NSForegroundColorAttributeName value:colorWithHexString(@"#333333") range:rangStrB];
    UILabel * terms = [[UILabel alloc]initWithFrame:CGRectMake(btn.width + btn.x + 8*KWIDTH, btn.y+ 5*KWIDTH ,400*KWIDTH,17*KWIDTH)];
#pragma mark 设置背景色 
    //terms.backgroundColor = UIColor.redColor;
    terms.textAlignment =NSTextAlignmentLeft;
    
    terms.font = Font9;
    terms.attributedText= str_describe;
    
    [self.view addSubview:terms];
   
}
-(void)ask:(UIButton*)ask{
    NSLog(@"申请");
}
-(void)addUpLoadBtn{
    
    //其实这个是img
    CGFloat space = 20*KWIDTH;
    NSArray *imageBtn = [NSArray arrayWithObjects:@"1w@2x",@"2w@2x",@"3w@2x",nil];
    [imageBtn enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [[UIButton alloc]init];
        CGFloat w  =(self.basementView.width - 120*KWIDTH)/3;
        [btn setBackgroundImage:[UIImage imageNamed:imageBtn[idx]] forState:0];
        btn.frame = RECT(45*KWIDTH+ idx* (w + space),getTextFieldY,w,150*KWIDTH);
       // btn.backgroundColor = RandomColor;
        [self.basementView addSubview:btn];
    }];
    
    
}

-(void)addBtn{
  
    
    
}
-(void)selBtn:(UIButton*)sender{
    /*
    btn.selected = NO;
    if(btn == sender){
        btn.selected = YES;
    }else{
        sender.selected = YES;
        btn.selected = NO;
        btn= sender;
    }*/
    
    sender= btn;
    [btn setBackgroundImage:[UIImage imageNamed:@"gou@2x"] forState:UIControlStateNormal];
    // btn.backgroundColor = UIColor.purpleColor;
    
}


@end
