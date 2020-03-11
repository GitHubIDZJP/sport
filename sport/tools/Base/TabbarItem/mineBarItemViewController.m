//
//  mineBarItemViewController.m
//  Sports
//
//  Created by test on 2019/12/31.
//  Copyright © 2019 test. All rights reserved.
//



#import "mineBarItemViewController.h"
#import "markCenterView.h"
#import "collectionCell.h"
#import "imgOrTitleBtn.h"
//su
#import "HXPersonalCenterViewController.h"
#import "fansViewController.h"
#import "userProfileVC.h"
#import "HXPublishedArticlesViewController.h"
#import "HXShoppingViewController.h"
#define isX (IS_iPhoneX ? (-44) : -20.f)

static NSString *headerViewIdentifier = @"hederview";
@interface mineBarItemViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UIView *ContFrigging;
}

@property(nonatomic,strong)markCenterView *markView;

@end
@implementation mineBarItemViewController
-(UIView *)scrSuperView
{
    if(!_scrSuperView){
        _scrSuperView = UIView.new;
        _scrSuperView.frame = CGRectMake(0*KWIDTH,isX,SCREEN_WIDTH,620*KWIDTH+isX);
        _scrSuperView.backgroundColor =color(240, 240, 240) ;//[UIColor clearColor];
    }
    return _scrSuperView;
}
-(UICollectionViewFlowLayout*)layout
{
    if(!_layout)
    {
        _layout = [[UICollectionViewFlowLayout alloc]init];
        _layout.scrollDirection=UICollectionViewScrollDirectionVertical; //设置滚动的方向
        _layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH,self.scrSuperView.height);
    }
    return _layout;
}
-(UICollectionView*)collection
{
    if(!_collection)
    {
        _collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0*KWIDTH,0*KWIDTH ,SCREEN_WIDTH ,SCREEN_HEIGHT) collectionViewLayout:self.layout];
        _collection.backgroundColor = color(240, 240, 240);
        _collection.delegate = self;
        _collection.dataSource = self;
        _collection.bounces = NO;
        _collection.contentSize = CGSizeMake(_collection.width, SCREEN_HEIGHT * 2.6);
        _collection.bouncesZoom = YES;
        _collection.alwaysBounceVertical = YES;//总是竖立滚动
        [_collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewIdentifier];
        [_collection registerClass:[collectionCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _collection;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collection];
    self.navigationController.navigationBarHidden = YES;
    [self prefersStatusBarHidden];
    [self addHeaderView];
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;//白色s
}
- (BOOL)prefersStatusBarHidden
{
    return NO;
}
-(void)addHeaderView
{
    _firstLevelView = [[mineHeaderView alloc]initWithFrame:CGRectMake(0*KWIDTH,0,SCREEN_WIDTH,350*KWIDTH)];
    [self.scrSuperView addSubview:_firstLevelView];
    [_firstLevelView setAvatarImg:@"panda" setUserName:@"冉乐先生" setUserSignatureText:@"每个秋天都是一个轮回" setSettingsButtonIcon:@"组 10"];
    [_firstLevelView setSettingButtonTag:2];
    __block  UIViewController *vc0 = self;
    _firstLevelView.myBlock = ^{
        NSLog(@"设置");
        userProfileVC *userMeassage = [[userProfileVC alloc]init];
        userMeassage.modalPresentationStyle = 0;
        [vc0.navigationController pushViewController:userMeassage animated:YES];
    };
    __block  UIViewController *switchVC = self;
    _firstLevelView.HideButtonBlock = ^(UIButton * sender) {
        userProfileVC *userMeassage = [[userProfileVC alloc]init];
        userMeassage.modalPresentationStyle = 0;
        [switchVC.navigationController pushViewController:userMeassage animated:YES];
    };
    UIButton *setBtn = (UIButton*)[_firstLevelView viewWithTag:2];
    __block  UIViewController *vc = self;
    [setBtn addAction:^(id  _Nonnull sender) {
        NSLog(@"消息");
        Class class=NSClassFromString(@"messageCenterVC");
        if(class) {
            UIViewController *ctrl =class.new;
            ctrl.modalPresentationStyle = 0;
            
            [vc.navigationController pushViewController:ctrl animated:YES];
        }
    }];
    _markView  =[[markCenterView alloc]initWithFrame:RECT(30*KWIDTH,_firstLevelView.height + _firstLevelView.y - 50*KWIDTH,SCREEN_WIDTH- 60*KWIDTH,140*KWIDTH)];
    [_markView getCoin:@"100.00" giftCount:@"300.00"];
    navButton *nav = [[navButton alloc]initWithFrame:CGRectMake(_markView.width - 210*KWIDTH,41*KWIDTH,180*KWIDTH,56*KWIDTH)];
    nav.backgroundColor = [UIColor clearColor];
    [nav setBackgroundImage:[UIImage imageNamed:@"充值中心_T"] forState:0];
    __block  UIViewController *vc1 = self;
    [nav   addAction:^(id  _Nonnull sender) {
        NSLog(@"充值中心");
        Class class=NSClassFromString(@"moneyJoinVC");
        if(class) {
            UIViewController *ctrl =class.new;
            ctrl.modalPresentationStyle = 0;
            [vc1.navigationController pushViewController:ctrl animated:YES];
        }
    }];
    
    nav.layer.cornerRadius = 14;
    nav.layer.masksToBounds = YES;
     [_markView addSubview:nav];
    [self.scrSuperView addSubview:self.markView];
   UIButton *inviteBtn = UIButton.new;
    inviteBtn.frame =RECT(_markView.x,_markView.height + _markView.y + 20*KWIDTH,_markView.width,140*KWIDTH);
    [inviteBtn setBackgroundImage:[UIImage imageNamed:@"组 1 拷贝@2x"] forState:0];
    [self.scrSuperView addSubview:inviteBtn];
    __block  UIViewController *vc2 = self;
    [inviteBtn  addAction:^(id  _Nonnull sender) {
        NSLog(@"邀请好友");
        Class class=NSClassFromString(@"InviteFriendsVC");
        if(class) {
            UIViewController *ctrl =class.new;
            ctrl.modalPresentationStyle = 0;
            [vc2.navigationController pushViewController:ctrl animated:YES];}}];}
//代理collection
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{return 1;//self.collectionCounts.count; //控制个数
     
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //如果是头视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerViewIdentifier forIndexPath:indexPath];
        //添加头视图的内容
        //   [self addContent];
        //头视图添加view
        [header addSubview:self.scrSuperView];
        return header;
    }
    //如果底部视图
    //    if([kind isEqualToString:UICollectionElementKindSectionFooter]){
    //
    //    }
    return nil;
}
-(UICollectionViewCell *)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    collectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.userInteractionEnabled = YES;
#pragma mark | 我的功能

    UILabel *verticalLine = [[UILabel alloc]initWithFrame:RECT(20*KWIDTH,20*KWIDTH,4*KWIDTH,30*KWIDTH)];
   // verticalLine.text = @"|";
    verticalLine.backgroundColor = colorWithHexString(@"#4CB13B");
    [cell addSubview:verticalLine];
    UILabel *headText = [[UILabel alloc]initWithFrame:RECT(verticalLine.width+verticalLine.x+ 6*KWIDTH,verticalLine.y,130*KWIDTH,30*KWIDTH)];
    headText.textAlignment =NSTextAlignmentCenter;
    headText.font = Font14;
    headText.textColor = colorWithHexString(@"#333333");
    headText.text = @"我的功能";
    [cell addSubview:headText];
    NSArray *titles = @[@"订阅记录",@"消费记录",@"我的关注",@"我的粉丝",@"我的推荐",@"发布文章",@"申请专家",@"邀请好友",@"联系客服",@"设置",@"我的红包",@"购物车"];
    NSArray *btnIcon = [NSArray arrayWithObjects:@"订阅@2x",@"账单@2x",@"关注(1)@2x",@"粉丝(1)@2x",@"推荐@2x",@"发布@2x",@"专家@2x",@"邀请好友@2x",@"客服@2x",@"设置@2x", @"redPaper@2x",@"购物车_me@2x",nil];
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        imgOrTitleBtn *addM = imgOrTitleBtn.new;
        CGFloat w = (SCREEN_WIDTH- 60*KWIDTH)/4;
        NSInteger index =idx % 4;//每排的个数
        NSInteger page = idx / 4;//有多少列
        addM.frame = RECT(index * (w ) + 0,90*KWIDTH +page * (w)+ 0,w,w);
        [cell addSubview:addM];
        [addM setImg:btnIcon[idx] title:titles[idx]];
        addM.tag = idx+1;
        userAubscribeVC *Aubscribe = [[userAubscribeVC alloc]init];
        recordsOfConsumptionVC  *records =[[recordsOfConsumptionVC alloc]init];
        addAttentionVC *interest = [[addAttentionVC alloc]init];
        fansViewController *fans = [[fansViewController alloc]init];
        UserFocusVC *PersonalCenter = [[UserFocusVC alloc]init];
    
        
        
        
        HXPublishedArticlesViewController *publish = [[HXPublishedArticlesViewController alloc]init];
       // WritingForPublicationVC *publish= [[WritingForPublicationVC alloc]init];
        applyForUserVC *join = [[applyForUserVC alloc]init];
        InviteFriendsVC *invite  = [[InviteFriendsVC alloc]init];
        onlineChatVC *contactService = [[onlineChatVC alloc]init];
        AccountSetVC *setVC  = [[AccountSetVC alloc]init];
        MyRedEnvelopeVC *redPackage  = [[MyRedEnvelopeVC alloc]init];
        HXShoppingViewController *Shop= [[HXShoppingViewController alloc]init];
        
        //数组保存类名
        self.arrVC = [NSMutableArray arrayWithObjects:Aubscribe,records,interest,fans,PersonalCenter,publish,join,invite,contactService,setVC,redPackage,Shop, nil];
        
        
        
        __block  UIViewController *vc3 = self;
        [ addM  addAction:^(id  _Nonnull sender) {
            NSLog(@"写信");
            vc3.modalPresentationStyle = 0;
            vc3.view.backgroundColor = UIColor.whiteColor;
            
            [vc3.navigationController pushViewController:self.arrVC[idx] animated:YES];

        }];
    }];
    
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // return CGSizeMake(80,34);
    return CGSizeMake(SCREEN_WIDTH - 60*KWIDTH, 700*KWIDTH);
}

@end
