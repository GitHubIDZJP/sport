//
//  interVC.m
//  Sports
//
//  Created by test on 2020/1/9.
//  Copyright © 2020 test. All rights reserved.
//



#import "interVC.h"
#define ChooseColor UIColor.whiteColor
#import "MyCollectionViewCell.h"
@interface interVC ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSInteger collectionIndex;
    NSDictionary *apiGlobalDic;
       //定义全局数组
       NSArray *apiGlobalArr;
}
@property(nonatomic,strong)NSArray *textLabel;
@property(nonatomic,strong)NSArray *collectionCounts;
@property(nonatomic,strong) NSArray *bosses;//老板
@property(nonatomic,strong) NSArray *bamboo;//竹林
@property(nonatomic,strong) NSArray *mountains;//山间
@property(nonatomic,copy) NSArray *leftArr;
@property(nonatomic,copy) NSArray *rightArr;
@end
@implementation interVC
-(UICollectionViewFlowLayout*)layout
{
    if(!_layout)
    {
        _layout = [[UICollectionViewFlowLayout alloc]init];
        _layout.minimumLineSpacing=20*KWIDTH;
        _layout.minimumInteritemSpacing=20*KWIDTH; //设置最小列间距
        CGFloat sInset  = 20*KWIDTH;//设置上下左右四边距
        _layout.sectionInset=UIEdgeInsetsMake(sInset,sInset ,sInset ,sInset );
        _layout.scrollDirection=UICollectionViewScrollDirectionVertical;//设置滚动的方向
    }  return _layout;
}
-(UICollectionView*)collection
{
    if(!_collection){
        _collection = [[UICollectionView alloc]initWithFrame:CGRectMake(_tableView.x + _tableView.width,0 ,SCREEN_WIDTH - _tableView.width ,SCREEN_HEIGHT- 200*KWIDTH) collectionViewLayout:self.layout];
        _collection.backgroundColor =UIColor.whiteColor;
        _collection.delegate = self;
        _collection.dataSource = self;
        _collection.bounces = YES;
        _collection.contentSize = CGSizeMake(_collection.width, SCREEN_HEIGHT * 1.6);
        _collection.bouncesZoom = YES;
        [_collection registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }   return _collection;
}
-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,177*KWIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = color(242, 242, 242);
        _tableView.backgroundColor = colorWithHexString(@"#F3F6F4");
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = tableSeparatorColor;
        _tableView.showsVerticalScrollIndicator = NO;//q去掉右侧滑动条
        _tableView.contentOffset = CGPointMake(177*KWIDTH, SCREEN_HEIGHT*1.5);
        IOS11;
    }   return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
      self.isSel = 0;
      [self loadSub];
       [self initData];
}
-(void)loadSub{
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.collection];}
-(void)initData{
  NSDictionary *parameter = [[NSDictionary alloc]init];
  [[zjpNetWork manager]POST:@"https://sports.hxweixin.top/api/v1/fbinfo/infoNav" parameters:parameter success:^(id responseBody) {
                  NSLog(@"成功");
           if([responseBody[@"code"] intValue] == 200){
                NSDictionary *dic = responseBody;
                self.leftArr = dic[@"data"][self.index-1][@"country_array"];
                self.rightArr = self.leftArr[self.isSel][@"union_array"];
               [self.tableView reloadData];
               [self.collection reloadData];  }} failure:^(NSError *error){NSLog(@"失败"); }];
}
#pragma mark 设置个数
//代理collection
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.rightArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    MyCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.titleLabel.text = self.rightArr[indexPath.row][@"union_name"][0];
    //字符串ID
    //cell.titleLabel.text = [NSString stringWithFormat:@"%@",self.rightArr[indexPath.row][@"union_id"]] ;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
}
-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    TeamListVC *childVC = [[TeamListVC alloc]init];
    childVC.title = self.rightArr[indexPath.row][@"union_name"][0];
    //字符串ID
   // childVC.title = [NSString stringWithFormat:@"%@",self.rightArr[indexPath.row][@"union_id"]] ;
    [self.navigationController pushViewController:childVC animated:YES];
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80,34);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.leftArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1*KWIDTH;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00000001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88*KWIDTH;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"it's cell data";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
   if(self.isSel == indexPath.row){
        cell.backgroundColor = ChooseColor;
   }else{
       cell.backgroundColor = color(242, 242, 242);
   }
    cell.textLabel.text = self.leftArr[indexPath.row][@"country_name"][0];
    cell.textLabel.font = Font13;
    cell.textLabel.textColor = colorWithHexString(@"#777777");
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.isSel = indexPath.row;
    self.rightArr = self.leftArr[indexPath.row][@"union_array"];
    [self.tableView reloadData];
    [self.collection reloadData];
}
@end
