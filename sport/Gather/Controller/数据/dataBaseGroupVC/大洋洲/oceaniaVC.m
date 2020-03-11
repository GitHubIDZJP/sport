//
//  interVC.m
//  Sports
//
//  Created by test on 2020/1/9.
//  Copyright © 2020 test. All rights reserved.
//





#import "oceaniaVC.h"
#define ChooseColor UIColor.whiteColor
#import "MyCollectionViewCell.h"
@interface oceaniaVC ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    
    NSInteger collectionIndex;
}
@property(nonatomic,strong)NSArray *textLabel;
@property(nonatomic,strong)NSArray *collectionCounts;
@property(nonatomic,strong) NSArray *bosses;//老板

@property(nonatomic,strong) NSArray *bamboo;//竹林
@property(nonatomic,strong) NSArray *mountains;//山间
@end


@implementation oceaniaVC
-(NSArray *)collectionCounts{
    
    if(!_collectionCounts){
        _collectionCounts = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39"];
    }
    return _collectionCounts;
}
//大佬
-(NSArray *)bosses
{
    if(!_bosses){
        _bosses =  @[@"西甲",@"中超",@"飞利浦",@"加林",@"流甲",@"西已",@"西曼",];
    }
    return _bosses;
}
//竹林
-(NSArray *)bamboo
{
    if(!_bamboo){
        _bamboo =  @[@"西甲2",@"中超2",@"飞利浦2",@"加林2",@"流甲2",@"西已2",@"西曼2",];
    }
    return _bamboo;
}
//山间
-(NSArray *)mountains
{
    if(!_mountains){
        _mountains =  @[@"西甲1",@"中超1",@"飞利浦1",@"加林1",@"流甲1",@"西已1",@"西曼1",];
    }
    return _mountains;
}

-(UICollectionViewFlowLayout*)layout
{
    if(!_layout)
    {
        _layout = [[UICollectionViewFlowLayout alloc]init];
        
        // _layout.itemSize=CGSizeMake(157*KWIDTH,68*KWIDTH);
        _layout.minimumLineSpacing=20*KWIDTH;
        //设置最小列间距
        _layout.minimumInteritemSpacing=20*KWIDTH;
        //设置上下左右四边距
        CGFloat sInset  = 20*KWIDTH;
        _layout.sectionInset=UIEdgeInsetsMake(sInset,sInset ,sInset ,sInset );
        //设置滚动的方向
        _layout.scrollDirection=UICollectionViewScrollDirectionVertical;
        
    }
    return _layout;
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
        //_collection.pagingEnabled = YES;
        //reg
        [_collection registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _collection;
}
-(NSArray*)textLabel{
    
    if(!_textLabel){
        
        _textLabel = @[@"国际赛事",@"沙滩赛事",@"中超赛事"];
    }
    return _textLabel;
    
}
-(UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,177*KWIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = color(242, 242, 242);
        _tableView.backgroundColor = colorWithHexString(@"#F3F6F4");
        // _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = tableSeparatorColor;
        _tableView.rowHeight = 80*KWIDTH;
        IOS11;
        
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSub];
    
    
    
    
    
}
-(void)loadSub{
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.collection];
    
}
#pragma mark 设置个数
//代理collection
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //控制个数
    // return 4;//self.collectionCounts.count;
    if(isSel == 0)
    {
        return   self.bosses.count;
    }else if (isSel == 1){
        return  self.bamboo.count;
    }else if (isSel== 2)
    {
        return  self.mountains.count;
    }
    return section;
}
-(UICollectionViewCell *)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    MyCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    collectionIndex = indexPath.row;
    if(isSel == 0){
        
        cell.titleLabel.text= self.bosses[indexPath.row];
    }else if (isSel == 1){
        cell.titleLabel.text = self.bamboo[indexPath.row];
    }else if (isSel == 2){
        cell.titleLabel.text= self.mountains[indexPath.row];
    }
    return cell;
}
//选中操作
-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{

    
}
//选中操作:
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    /*
    if(indexPath.row == 0){
        __block  UIViewController *vc = self;
        NSLog(@"写信");
        Class class=NSClassFromString(@"TeamListVC");
        if(class) {
            UIViewController *ctrl =class.new;
            ctrl.modalPresentationStyle = 0;
            [vc presentViewController:ctrl animated:NO completion:nil];
        }
    };*/
    TeamListVC *childVC = [[TeamListVC alloc]init];
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
//每组的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return  self.textLabel.count;
}
//组之间的距离
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 0.1*KWIDTH;
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00000001;
    
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88*KWIDTH;
}

//数据源
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"it's cell data";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        //初始化
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        
        
    }
    
    if(isSel == 0)
    {
        if(indexPath.row == 0){
            cell.backgroundColor = ChooseColor;
        }else{
            cell.backgroundColor = color(242, 242, 242);
        }
    }else if (isSel == 1){
        
        if(indexPath.row == 1){
            cell.backgroundColor = ChooseColor;
        }else{
            cell.backgroundColor = color(242, 242, 242);
        }
    }else if (isSel== 2)
    {
        
        if(indexPath.row == 2){
            cell.backgroundColor = ChooseColor;
        }else{
            cell.backgroundColor = color(242, 242, 242);
        }
    }
    cell.textLabel.text = self.textLabel[indexPath.row];
    cell.textLabel.font = Font13;
    cell.textLabel.textColor = colorWithHexString(@"#777777");
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在手指离开的那一刻进行反选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    isSel = indexPath.row;
    switch (isSel) {
        case 0:
        {
            
            
            [self.collection reloadData];
            
            break;
        }
        case 1:
        {
            
            
            [self.collection reloadData];
            break;
        }case 2:
        {
            
            
            [self.collection reloadData];
            break;
        }
        default:
            break;
    }
    [self.tableView reloadData];
    
    
}


@end
