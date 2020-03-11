//
//  ViewController.m
//  2个按钮来回切换更改状态
//
//  Created by 邹俊平 on 2020/1/10.
//  Copyright © 2020 test. All rights reserved.
//

#import "HXFootballViewController.h"
#import "HXZJPPersonalCenterCell.h"
#define KscreenW ([[UIScreen mainScreen] bounds].size.width)
#import "currentView.h"
#import "nextView.h"
#import "UISegmentedControl+Style_OC.h"
#import "UISegmentedControl+Category.h"
#import "UISegmentedControl+Common.h"
@interface HXFootballViewController ()<UINavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate>
{
    nextView *view;
    currentView *view1;
    NSInteger btnViewHeight;
}

@end



@implementation HXFootballViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = color(240, 240,240);
    sview = [[UIView alloc]init];
    sview.userInteractionEnabled = YES;
    sview.backgroundColor = UIColor.whiteColor;
    sview.frame = RECT(0, 240*KWIDTH, ScreenWidth, 70*KWIDTH);
    [self.view addSubview:sview];
    
    //给sview加img 文字
    UIImageView *diamondImg = getImgView(RECT(30*KWIDTH,20*KWIDTH,26*KWIDTH,26*KWIDTH), UIViewContentModeScaleAspectFill);//菱形图片
    diamondImg.image = [UIImage imageNamed:@"diamondIcon"];
    [sview addSubview:diamondImg];
    
    
    
    //富文本--->
    NSString *richText= @"预测场次(1场)";
    //富文本
    NSRange rangStrA = [richText rangeOfString:@"预测场次"];
    NSRange rangStrB = [richText rangeOfString:@"(1场)"];
    NSMutableAttributedString *str_describe = [[NSMutableAttributedString alloc] initWithString:richText];
    [str_describe addAttribute:NSForegroundColorAttributeName value:colorWithHexString(@"#333333") range:rangStrA];//Foreground前景
    [str_describe addAttribute:NSForegroundColorAttributeName value:color(164,164,164) range:rangStrB];
    UILabel *predictEvents = [[UILabel alloc]initWithFrame:CGRectMake(diamondImg.x + diamondImg.width+ 20*KWIDTH,diamondImg.y,195*KWIDTH,26*KWIDTH)];
    predictEvents.textAlignment = NSTextAlignmentLeft;
    predictEvents.font = Font14;
   // predictEvents.textAlignment =NSTextAlignmentCenter;
    predictEvents.attributedText= str_describe;
    
    [sview addSubview:predictEvents];
    
    
    [self createSegMentController];
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.centerTableView];
    [self.view addSubview:self.cellTableView];
    self.cellTableView.hidden = YES;
    self.centerTableView.hidden = YES;
    self.leftTableView.scrollEnabled = NO;
    self.centerTableView.scrollEnabled = NO;
    self.cellTableView.scrollEnabled = NO;
    
    
    
    self.navigationController.navigationBar.translucent = NO;//不加 否则view的高度从最顶部开始
    NSArray *titles = @[@"亚知V8",@"亚知V8"];
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // float spaWidth = (self.view.frame.size.width -80*KWIDTH)/4.0;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(30*KWIDTH + idx*( 100*KWIDTH + 30*KWIDTH), 35*KWIDTH, 100*KWIDTH, 40*KWIDTH)];
        btn.tag = 100;
        btnViewHeight = btn.y + btn.height + 10*KWIDTH;
        btn.titleLabel.font = Font10;
        btn.layer.cornerRadius =  10;
        btn.layer.masksToBounds = YES;
        
        [btn setTitle:titles[idx] forState:UIControlStateNormal];
        btn.layer.borderWidth = 1;
        //[btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        
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
        
        btn.tag = idx+100;
        [self.view addSubview:btn];
    }];
    
    
    
    
    
    //
    view =nextView.new;//[[[NSBundle mainBundle] loadNibNamed:@"nextView" owner:self options:nil]lastObject];
    view.frame = CGRectMake(0, btnViewHeight,ScreenWidth ,130*KWIDTH );
    //  view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    view1 =currentView.new;//[[[NSBundle mainBundle] loadNibNamed:@"currentView" owner:self options:nil]lastObject];
    view1.frame = CGRectMake(0, btnViewHeight,ScreenWidth , 130*KWIDTH);
    //view1.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view1];
    
}
- (void)onClick:(UIButton *)sender{
    
    UIButton *btn1 = (UIButton *)[self.view viewWithTag:100];
    UIButton *btn2 = (UIButton *)[self.view viewWithTag:101];
    
    if (sender.tag == 100) {
        //选哪个哪个remove
        
        [view removeFromSuperview];
        [self.view addSubview:view1];
        ////选中颜色
        //        [btn1 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        //        [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        /*
         选中和默认 背景色 -->白色
         选中和默认 边框颜色  -=-->  color(76,177,59)
         选中和默认 字体颜色 --- >color(76,177,59)
         */
        /*
         不选中和不默认 背景色 --> color(245,245,245)；
         不选中和不默认 边框颜色  -=-->  color(178,178,178);
         不选中和不默认 字体颜色 --- >  color(178,178,178);
         
         */
        
        [btn1 setTitleColor:color(76,177,59) forState:UIControlStateNormal];//选中
        [btn2 setTitleColor:color(178,178,178) forState:UIControlStateNormal];//不选中
        
        btn1.layer.borderColor = color(76,177,59).CGColor;//选中
        btn2.layer.borderColor = color(178,178,178).CGColor;//不选中
    }else if(sender.tag ==  101){
        
        [view1 removeFromSuperview];
        [self.view addSubview:view];
        
        btn2.layer.borderColor = color(76,177,59).CGColor;//选中
        btn1.layer.borderColor = color(178,178,178).CGColor;
        [btn2 setTitleColor:color(76,177,59) forState:UIControlStateNormal];//选中
        [btn1 setTitleColor:color(178,178,178) forState:UIControlStateNormal];//不选中
        
    }
    
    
}

-(void)createSegMentController{
    NSArray *segmentedArray = [NSArray arrayWithObjects:@"全部",@"让分",@"总分",nil];
    
    segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
   // segmentedControl.backgroundColor = UIColor.purpleColor;
    segmentedControl.frame = CGRectMake(ScreenWidth - 260*KWIDTH, 10*KWIDTH, 216*KWIDTH, 50*KWIDTH);
    
    segmentedControl.selectedSegmentIndex = 0;
    
    segmentedControl.tintColor = [UIColor clearColor];
    
    // 正常状态下
    NSDictionary * normalTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:10.0f],NSForegroundColorAttributeName : colorWithHexString(@"#333333")};
    [segmentedControl setTitleTextAttributes:normalTextAttributes forState:UIControlStateNormal];
   // [segmentedControl ensureiOS12Style];
    [segmentedControl segmentedIOS13Style];
    // 选中状态下
    NSDictionary * selctedTextAttributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:10.0f],NSForegroundColorAttributeName : colorWithHexString(@"#4CB13B")};
    [segmentedControl setTitleTextAttributes:selctedTextAttributes forState:UIControlStateSelected];
    
    [segmentedControl addTarget:self action:@selector(indexDidChangeForSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    
    [sview addSubview:segmentedControl];
    
    
    
}

-(UITableView*)leftTableView
{
    if(!_leftTableView){
        CGFloat y =sview.frame.origin.y + sview.frame.size.height ;
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,y,[UIScreen mainScreen].bounds.size.width,100)style:UITableViewStyleGrouped];
        //最重要的就是代理了
        // _leftTableView.backgroundColor = [UIColor grayColor];
        _leftTableView.showsVerticalScrollIndicator = NO;
        _leftTableView.delegate=self;
        _leftTableView.dataSource=self;
        
        _leftTableView.rowHeight = 100;
        
        if (@available(iOS 11.0, *)) {
            self.leftTableView.estimatedRowHeight = 0;
            self.leftTableView.estimatedSectionHeaderHeight = 0;
            self.leftTableView.estimatedSectionFooterHeight = 0;
        }
    }
    return _leftTableView;
}
-(UITableView*)centerTableView
{
    if(!_centerTableView){
        
        _centerTableView = [[UITableView alloc]initWithFrame:CGRectMake(_leftTableView.frame.origin.x,_leftTableView.frame.origin.y,_leftTableView.frame.size.width,100)style:UITableViewStyleGrouped];
        //最重要的就是代理了
        
        _centerTableView.showsVerticalScrollIndicator = NO;
        _centerTableView.delegate=self;
        _centerTableView.dataSource=self;
        
        _centerTableView.rowHeight = 100;
        
        if (@available(iOS 11.0, *)) {
            self.centerTableView.estimatedRowHeight = 0;
            self.centerTableView.estimatedSectionHeaderHeight = 0;
            self.centerTableView.estimatedSectionFooterHeight = 0;
        }
    }
    return _centerTableView;
}
-(UITableView*)cellTableView
{
    if(!_cellTableView)
    {
        
        
        
        
        _cellTableView = [[UITableView alloc]initWithFrame:CGRectMake(_leftTableView.frame.origin.x,_leftTableView.frame.origin.y,_leftTableView.frame.size.width,100
                                                                      ) style:UITableViewStyleGrouped];
        _cellTableView.separatorColor = [UIColor grayColor];
        _cellTableView.delegate=self;
        _cellTableView.dataSource = self;
        _cellTableView.rowHeight = 100;
        _cellTableView.separatorInset = UIEdgeInsetsMake(0,10, 70, 10);        // 设置端距，这里表示separator离左边和右边均80像素
        
        _cellTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        if (@available(iOS 11.0, *)) {
            self.cellTableView.estimatedRowHeight = 0;
            self.cellTableView.estimatedSectionHeaderHeight = 0;
            self.cellTableView.estimatedSectionFooterHeight = 0;
        }
    }
    return _cellTableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if([tableView isEqual:self.leftTableView]){
        return 1;
    }else if ([tableView isEqual:_centerTableView]){
        return 1;
    }else if ([tableView isEqual:_cellTableView]){
        return 2;
    }
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if([tableView isEqual:self.leftTableView] )
    {
        return 1;
    }else if([tableView isEqual:self.centerTableView ]){
        return 1;
    }else if ( [tableView isEqual:self.cellTableView]){
        return 1;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* sectionview = [[UIView alloc]init];
    
    return sectionview;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([tableView isEqual:self.leftTableView]){
        
        static NSString *identifier = @"leftCell";
        HXZJPPersonalCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(!cell){
            
            //cell =[[PersonalCenterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
            cell = [[[NSBundle mainBundle]loadNibNamed:@"HXZJPPersonalCenterCell" owner:nil options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
        
    }else if ([tableView isEqual:self.centerTableView]){
        static NSString *identifier = @"gh";
        HXZJPPersonalCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil){
            cell = [[[NSBundle mainBundle]loadNibNamed:@"HXZJPPersonalCenterCell" owner:nil options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [cell setTeamName:@"中超" GameTime:@"3/1 12:09" TeamComparison:@"北京0-10日本" GamePlay:@"玩法:让分" OutcomePredict:@"预测:必输"];
        return cell;
        
    }else if ([tableView isEqual:self.cellTableView]){
        static NSString *identifier = @"df";
        HXZJPPersonalCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(cell == nil){
            cell = [[[NSBundle mainBundle]loadNibNamed:@"HXZJPPersonalCenterCell" owner:nil options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [cell setTeamName:@"澳洲乙" GameTime:@"8/10 10:09" TeamComparison:@"北京0-10美国" GamePlay:@"玩法:不让分" OutcomePredict:@"预测:必输"];
        return cell;
        
    }
    return nil;
    
    
}
-(void)indexDidChangeForSegmentedControl:(UISegmentedControl *)sender
{
    NSInteger selecIndex = sender.selectedSegmentIndex;
    
    
    
    if(selecIndex == 0){
        _leftTableView.hidden = NO;
        _cellTableView.hidden = YES;
        _centerTableView.hidden = YES;
        [_leftTableView reloadData];
    }else if (selecIndex == 2){
        _centerTableView.hidden = YES;
        _leftTableView.hidden = YES;
        _cellTableView.hidden = NO;
        [_cellTableView reloadData];
        
    }else if (selecIndex == 1){
        _leftTableView.hidden = YES;
        _cellTableView.hidden = YES;
        _centerTableView.hidden = NO;
        [_centerTableView reloadData];
    }
    
    
    
    
}
@end










