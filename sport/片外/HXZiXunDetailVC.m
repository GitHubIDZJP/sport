//
//  HXZiXunDetailVC.m
//  QCGlobalSport
//
//  Created by HuXin on 2020/1/16.
//  Copyright © 2020 com.qqty. All rights reserved.
//

#import "HXZiXunDetailVC.h"
#import "HXZiXunDetailFirstCell.h"
#import "HXZiXunDetailPayedCell.h"
#import "HXZiXunDetailContentCell.h"
#import "HXZiXunDetailTuiJianCell.h"

@interface HXZiXunDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray * tableViewtitleArr;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation HXZiXunDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
    [self initView];
    [self initObject];
    self.title = @"资讯详情";
    UIImage *img = [[UIImage imageNamed:@"back_black_hx"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStyleDone target:self action:@selector(leftBarBtnClicked)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)leftBarBtnClicked {
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark -- 初始化对象
- (void)initObject {
    [self addTableViewAndCollectionView];
}

#pragma mark -- 获取数据
- (void)getData {
    self.tableViewtitleArr = @[];
}

#pragma mark -- 初始化视图
- (void)initView {
    self.view.backgroundColor = QCColor(243, 243, 243);
}

#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
         return 298;
    } else if (indexPath.row == 1) {
        return 130;
    } else if (indexPath.row == 2) {
        return 293;
    }
     return 216;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        HXZiXunDetailFirstCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HXZiXunDetailFirstCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.row == 1) {
        HXZiXunDetailPayedCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HXZiXunDetailPayedCell" forIndexPath:indexPath];
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    } else if (indexPath.row == 2) {
        HXZiXunDetailContentCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HXZiXunDetailContentCell" forIndexPath:indexPath];
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        HXZiXunDetailTuiJianCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HXZiXunDetailTuiJianCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return [UITableViewCell new];
}

#pragma mark -- 列表

- (void)addTableViewAndCollectionView {
    
    if (![self.view.subviews containsObject:self.tableView]) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:(UITableViewStylePlain)];
        [self.view addSubview:self.tableView];
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.showsVerticalScrollIndicator =
        NO;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.bounces = NO;
        //注册
        [self.tableView registerNib:[UINib nibWithNibName:@"HXZiXunDetailFirstCell" bundle:nil] forCellReuseIdentifier:@"HXZiXunDetailFirstCell"];
        [self.tableView registerNib:[UINib nibWithNibName:@"HXZiXunDetailPayedCell" bundle:nil] forCellReuseIdentifier:@"HXZiXunDetailPayedCell"];
        [self.tableView registerNib:[UINib nibWithNibName:@"HXZiXunDetailContentCell" bundle:nil] forCellReuseIdentifier:@"HXZiXunDetailContentCell"];
          [self.tableView registerNib:[UINib nibWithNibName:@"HXZiXunDetailTuiJianCell" bundle:nil] forCellReuseIdentifier:@"HXZiXunDetailTuiJianCell"];
        
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 3) {
        HXZiXunDetailVC *vc = [HXZiXunDetailVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark -- 懒加载
- (NSArray *)tableViewtitleArr {
    if (!_tableViewtitleArr) {
        _tableViewtitleArr = [[NSArray alloc] init];
    }
    return _tableViewtitleArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
