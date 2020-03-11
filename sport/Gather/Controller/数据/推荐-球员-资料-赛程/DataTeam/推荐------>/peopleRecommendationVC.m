//
//  peopleRecommendationVC.m
//  Sports
//
//  Created by test on 2020/1/18.
//  Copyright © 2020 test. All rights reserved.
//

#import "peopleRecommendationVC.h"
#import "HXNewsMainLanQiuListCell.h"
#import "HXNewsMainZuQiuListCell.h"
#import "HXZiXunDetailVC.h"

@interface peopleRecommendationVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray * tableViewtitleArr;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation peopleRecommendationVC



- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
    [self initView];
    [self initObject];
}


#pragma mark -- 初始化对象
- (void)initObject {
    [self addTableViewAndCollectionView];
}

#pragma mark -- 获取数据
- (void)getData {
    
    self.tableViewtitleArr = @[@[@"3",@"0.8",@"0.8",@"0.5",@"0.9",@"0.3",@"0.8",@"01-19 12:56"],@[@"9",@"1.3",@"4.2",@"5.5",@"2.6",@"1.6",@"5.8",@"01-21 15:18"],@[@"11",@"3",@"1.4",@"2.1",@"0.6",@"5.7",@"1.8",@"01-21 18:45"],@[@"41",@"3",@"4",@"5",@"6",@"7",@"8",@"01-22 08:28"],@[@"3",@"0.8",@"0.8",@"0.5",@"0.9",@"0.3",@"0.8",@"01-19 12:56"],@[@"9",@"1.3",@"4.2",@"5.5",@"2.6",@"1.6",@"5.8",@"01-21 15:18"],@[@"11",@"3",@"1.4",@"2.1",@"0.6",@"5.7",@"1.8",@"01-21 18:45"],@[@"41",@"3",@"4",@"5",@"6",@"7",@"8",@"01-22 08:28"],@[@"3",@"0.8",@"0.8",@"0.5",@"0.9",@"0.3",@"0.8",@"01-19 12:56"],@[@"9",@"1.3",@"4.2",@"5.5",@"2.6",@"1.6",@"5.8",@"01-21 15:18"],@[@"11",@"3",@"1.4",@"2.1",@"0.6",@"5.7",@"1.8",@"01-21 18:45"],@[@"41",@"3",@"4",@"5",@"6",@"7",@"8",@"01-22 08:28"],@[@"3",@"0.8",@"0.8",@"0.5",@"0.9",@"0.3",@"0.8",@"01-19 12:56"],@[@"9",@"1.3",@"4.2",@"5.5",@"2.6",@"1.6",@"5.8",@"01-21 15:18"],@[@"11",@"3",@"1.4",@"2.1",@"0.6",@"5.7",@"1.8",@"01-21 18:45"],@[@"41",@"3",@"4",@"5",@"6",@"7",@"8",@"01-22 08:28"]];
}

#pragma mark -- 初始化视图
- (void)initView {
    self.view.backgroundColor = QCColor(243, 243, 243);
}

#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 19;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 142;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        HXNewsMainLanQiuListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HXNewsMainLanQiuListCell" forIndexPath:indexPath];
        return cell;
    }
    HXNewsMainZuQiuListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HXNewsMainZuQiuListCell" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HXZiXunDetailVC *vc = [HXZiXunDetailVC new];
    [self.navigationController pushViewController:vc animated:YES];
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
        [self.tableView registerNib:[UINib nibWithNibName:@"HXNewsMainLanQiuListCell" bundle:nil] forCellReuseIdentifier:@"HXNewsMainLanQiuListCell"];
        [self.tableView registerNib:[UINib nibWithNibName:@"HXNewsMainZuQiuListCell" bundle:nil] forCellReuseIdentifier:@"HXNewsMainZuQiuListCell"];
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
