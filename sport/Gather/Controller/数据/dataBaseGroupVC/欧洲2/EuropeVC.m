//
//  interVC.m
//  Sports
//
//  Created by test on 2020/1/9.
//  Copyright © 2020 test. All rights reserved.
//



#import "EuropeVC.h"
#define ChooseColor UIColor.whiteColor
#import "MyCollectionViewCell.h"
@interface EuropeVC ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
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
@end
@implementation EuropeVC
-(UICollectionViewFlowLayout*)layout
{
    if(!_layout)
    {
        _layout = [[UICollectionViewFlowLayout alloc]init];
        _layout.minimumLineSpacing=20*KWIDTH;
        _layout.minimumInteritemSpacing=20*KWIDTH;
        CGFloat sInset  = 20*KWIDTH;
        _layout.sectionInset=UIEdgeInsetsMake(sInset,sInset ,sInset ,sInset );
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

-(UITableView *)tableView{
    
    if(!_tableView){
      //  NSInteger tabH =self.textLabel.count * 88*KWIDTH;
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,177*KWIDTH,SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = color(242, 242, 242);
        _tableView.backgroundColor = colorWithHexString(@"#F3F6F4");
        // _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = tableSeparatorColor;
       // _tableView.rowHeight = 80*KWIDTH;
        _tableView.showsVerticalScrollIndicator = NO;//q去掉右侧滑动条
        _tableView.contentOffset = CGPointMake(177*KWIDTH, SCREEN_HEIGHT*1.5);
        IOS11;
        
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
       [self initData];
    });
    [self loadSub];
}
-(void)loadSub{
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.collection];
    
}
-(void)initData{
 
NSDictionary *parameter = [[NSDictionary alloc]init];
//https://sports.hxweixin.top/api/v1/fbinfo/infoNav
//http://www.cnstorm.com/index.php?route=api/tool/config
 [[zjpNetWork manager]POST:@"https://sports.hxweixin.top/api/v1/fbinfo/infoNav" parameters:parameter success:^(id responseBody) {
                  NSLog(@"成功");
           if([responseBody[@"code"] intValue] == 200){
                         
               
               
               self->apiGlobalArr = responseBody[@"data"];
               NSString *str =self->apiGlobalArr[1][@"country_array"][0][@"country_name"][0];
                         NSLog(@"数组-1-%@",str);
                NSString *str1 =self->apiGlobalArr[1][@"country_array"][1][@"country_name"][0];
                NSString *str2 =self->apiGlobalArr[1][@"country_array"][2][@"country_name"][0];
                NSString *str3 =self->apiGlobalArr[1][@"country_array"][3][@"country_name"][0];
                NSString *str4 =self->apiGlobalArr[1][@"country_array"][4][@"country_name"][0];
                NSString *str5 =self->apiGlobalArr[1][@"country_array"][5][@"country_name"][0];
                NSString *str6 =self->apiGlobalArr[1][@"country_array"][6][@"country_name"][0];
                NSString *str7 =self->apiGlobalArr[1][@"country_array"][7][@"country_name"][0];
                NSString *str8 =self->apiGlobalArr[1][@"country_array"][8][@"country_name"][0];
                NSString *str9 =self->apiGlobalArr[1][@"country_array"][9][@"country_name"][0];
                NSString *str10 =self->apiGlobalArr[1][@"country_array"][10][@"country_name"][0];
                NSString *str11 =self->apiGlobalArr[1][@"country_array"][11][@"country_name"][0];
                NSString *str12 =self->apiGlobalArr[1][@"country_array"][12][@"country_name"][0];
                NSString *str13 =self->apiGlobalArr[1][@"country_array"][13][@"country_name"][0];
                NSString *str14 =self->apiGlobalArr[1][@"country_array"][14][@"country_name"][0];
                NSString *str15 =self->apiGlobalArr[1][@"country_array"][15][@"country_name"][0];
                NSString *str16 =self->apiGlobalArr[1][@"country_array"][16][@"country_name"][0];
                NSString *str17 =self->apiGlobalArr[1][@"country_array"][17][@"country_name"][0];
                NSString *str18 =self->apiGlobalArr[1][@"country_array"][18][@"country_name"][0];
                NSString *str19 =self->apiGlobalArr[1][@"country_array"][19][@"country_name"][0];
                NSString *str20 =self->apiGlobalArr[1][@"country_array"][20][@"country_name"][0];
                NSString *str21 =self->apiGlobalArr[1][@"country_array"][21][@"country_name"][0];
                NSString *str22 =self->apiGlobalArr[1][@"country_array"][22][@"country_name"][0];
                NSString *str23 =self->apiGlobalArr[1][@"country_array"][23][@"country_name"][0];
                NSString *str24 =self->apiGlobalArr[1][@"country_array"][24][@"country_name"][0];
                NSString *str25 =self->apiGlobalArr[1][@"country_array"][25][@"country_name"][0];
                NSString *str26 =self->apiGlobalArr[1][@"country_array"][26][@"country_name"][0];
                NSString *str27 =self->apiGlobalArr[1][@"country_array"][27][@"country_name"][0];
                NSString *str28 =self->apiGlobalArr[1][@"country_array"][28][@"country_name"][0];
                NSString *str29 =self->apiGlobalArr[1][@"country_array"][29][@"country_name"][0];
                NSString *str30=self->apiGlobalArr[1][@"country_array"][30][@"country_name"][0];
                NSString *str31=self->apiGlobalArr[1][@"country_array"][31][@"country_name"][0];
               NSString *str32=self->apiGlobalArr[1][@"country_array"][32][@"country_name"][0];
               NSString *str33=self->apiGlobalArr[1][@"country_array"][33][@"country_name"][0];
               NSString *str34=self->apiGlobalArr[1][@"country_array"][34][@"country_name"][0];
               NSString *str35=self->apiGlobalArr[1][@"country_array"][35][@"country_name"][0];
               NSString *str36=self->apiGlobalArr[1][@"country_array"][36][@"country_name"][0];
               NSString *str37=self->apiGlobalArr[1][@"country_array"][37][@"country_name"][0];
               NSString *str38=self->apiGlobalArr[1][@"country_array"][38][@"country_name"][0];
               NSString *str39=self->apiGlobalArr[1][@"country_array"][39][@"country_name"][0];
               NSString *str40=self->apiGlobalArr[1][@"country_array"][40][@"country_name"][0];
               NSString *str41=self->apiGlobalArr[1][@"country_array"][41][@"country_name"][0];
               NSString *str42=self->apiGlobalArr[1][@"country_array"][42][@"country_name"][0];
                NSString *str43=self->apiGlobalArr[1][@"country_array"][43][@"country_name"][0];
                NSString *str44=self->apiGlobalArr[1][@"country_array"][44][@"country_name"][0];
                NSString *str45=self->apiGlobalArr[1][@"country_array"][45][@"country_name"][0];
                NSString *str46=self->apiGlobalArr[1][@"country_array"][46][@"country_name"][0];
                NSString *str47=self->apiGlobalArr[1][@"country_array"][47][@"country_name"][0];
                NSString *str48=self->apiGlobalArr[1][@"country_array"][48][@"country_name"][0];
                NSString *str49=self->apiGlobalArr[1][@"country_array"][49][@"country_name"][0];
                NSString *str50=self->apiGlobalArr[1][@"country_array"][50][@"country_name"][0];
               NSString *str51=self->apiGlobalArr[1][@"country_array"][51][@"country_name"][0];
               NSString *str52=self->apiGlobalArr[1][@"country_array"][52][@"country_name"][0];
               NSString *str53=self->apiGlobalArr[1][@"country_array"][53][@"country_name"][0];
          
                          _textLabel = @[str,str1,str2,str3,str4,str5,str6,str7,str8,str9,str10,str11,str12,str13,str14,str15,str16,str17,str18,str19,str20,str21,str22,str23,str24,str25,str26,str27,str28,str29,str30,str31,str32,str33,str34,str35,str36,str37,str38,str39,str40,str41,str42,str43,str44,str45,str46,str47,str48,str49,str50,str51,str52,str53];
                 
               [self.tableView reloadData];

            _bosses =self->apiGlobalArr[1][@"country_array"][0][@"union_array"];
            _bamboo = self->apiGlobalArr[1][@"country_array"][1][@"union_array"];
            _mountains= self->apiGlobalArr[1][@"country_array"][2][@"union_array"];
             [self.collection reloadData];
                                
               
                     }
        
              } failure:^(NSError *error) {
                  NSLog(@"失败");
              }];
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
        
        cell.titleLabel.text=  self.bosses[indexPath.row][@"union_name"][0];
    }else if (isSel == 1){
        cell.titleLabel.text =  self.bamboo[indexPath.row][@"union_name"][0];
    }else if (isSel == 2){
        
        cell.titleLabel.text= self.mountains[indexPath.row][@"union_name"][0];
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
    //
    
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
    };
     */
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
    for(int i = 0;i <self.textLabel.count;i++ ){
        if(isSel == indexPath.row){
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
