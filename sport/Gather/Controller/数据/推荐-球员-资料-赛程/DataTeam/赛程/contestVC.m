//
//  contestVC.m
//  Sports
//
//  Created by test on 2020/1/18.
//  Copyright © 2020 test. All rights reserved.
//

#import "contestVC.h"
#import "contestVCTableCell.h"
@interface contestVC ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)UITableView *tableView;
@end

@implementation contestVC
-(UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0*KWIDTH,SCREEN_WIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = color(243,243,243);
        // _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = color(251, 251,251);
        _tableView.rowHeight = 100;
        IOS11;
    }
    return _tableView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100*KWIDTH;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
//    if(section == 0){
//        return 50*KWIDTH;
//    }
    return 50*KWIDTH;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1*KWIDTH;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* sectionview = [[UIView alloc]init];
    //sectionview.backgroundColor = UIColor.redColor;
    //////

    NSString *richText= @"|  2020-01";
    //富文本
    NSRange rangStrA = [richText rangeOfString:@"|"];
    NSRange rangStrB = [richText rangeOfString:@"2020-01"];
    NSMutableAttributedString *str_describe = [[NSMutableAttributedString alloc] initWithString:richText];
    [str_describe addAttribute:NSForegroundColorAttributeName value:colorWithHexString(@"#4CB13B") range:rangStrA];//Foreground前景
    [str_describe addAttribute:NSForegroundColorAttributeName value:colorWithHexString(@"#333333") range:rangStrB];
    //[str_describe addAttribute:NSForegroundColorAttributeName value:Font9 range:rangStrA];
    ////////

    UILabel *headTag = UILabel.new;
    headTag.frame = RECT(30*KWIDTH,10*KWIDTH,200*KWIDTH,30*KWIDTH);
    //headTag.backgroundColor = UIColor.redColor;
   // headTag.text = @"df";
     headTag.attributedText= str_describe;
     [sectionview addSubview:headTag];
    return sectionview;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier =@"Cell";
    contestVCTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil)
    {
        cell= [[[NSBundle mainBundle]loadNibNamed:@"contestVCTableCell" owner:nil options:nil]lastObject];
    }
    [cell setTeamJName:@"利物浦" TeamYName:@"莱斯特城" TeamJLogo:@"利" TeamYLogo:@"莱"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"点击了第%ld行",indexPath.row);
}


@end
