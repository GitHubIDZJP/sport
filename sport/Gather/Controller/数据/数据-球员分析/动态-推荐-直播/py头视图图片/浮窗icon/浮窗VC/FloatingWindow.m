


#import "FloatingWindow.h"
#define kk_WIDTH self.frame.size.width
#define kk_HEIGHT self.frame.size.height

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

#define animateDuration 0.3       //位置改变动画时间
#define showDuration 0.1          //展开动画时间
#define statusChangeDuration  3.0    //状态改变时间
#define normalAlpha  1.0           //正常状态时背景alpha值
#define sleepAlpha  0.5           //隐藏到边缘时的背景alpha值
#define myBorderWidth 1.0         //外框宽度
#define marginWith  5             //间隔

#define WZFlashInnerCircleInitialRaius  20

@interface FloatingWindow ()

@property(nonatomic)NSInteger frameWidth;
@property(nonatomic,strong)UIPanGestureRecognizer *pan;
@property(nonatomic,strong)UITapGestureRecognizer *tap;
@property(nonatomic,strong)UIButton *PKBtn;
@property(nonatomic,strong)UIButton *ShareBtn;
@property(nonatomic,strong)UIColor *bgcolor;
@property(nonatomic,strong)CAAnimationGroup *animationGroup;
@property(nonatomic,strong)CAShapeLayer *circleShape;
@property(nonatomic,strong)UIColor *animationColor;

@end
@implementation FloatingWindow
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame mainImageName:(NSString*)name bgcolor:(UIColor *)bgcolor{
    return [self initWithFrame:frame mainImageName:name bgcolor:bgcolor animationColor:nil];
}

- (instancetype)initWithFrame:(CGRect)frame mainImageName:(NSString*)name bgcolor:(UIColor *)bgcolor animationColor:animationColor

{
    if(self = [super initWithFrame:frame])
    {
        NSAssert(name != nil, @"mainImageName can't be nil !");
        
        self.backgroundColor = [UIColor clearColor];
        self.windowLevel = UIWindowLevelAlert + 1;  //如果想在 alert 之上，则改成 + 2
        self.rootViewController = [UIViewController new];
        [self makeKeyAndVisible];
        
        _bgcolor = bgcolor;
        _frameWidth = frame.size.width;
        _animationColor = animationColor;
        
        
#pragma mark 背景图片//kScreenWidth-65, kScreenHeight-350, 61, 97
        UIImageView *GreenBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height)];
        GreenBackground.image =[UIImage imageNamed:@"FloatingWindow"];
        GreenBackground.userInteractionEnabled = YES;
        [self addSubview:GreenBackground];
        
#pragma mark PK按钮
        _PKBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
        [_PKBtn setFrame:(CGRect){0, 8,frame.size.width, frame.size.height/2}];
        [_PKBtn setImage:[UIImage imageNamed:@"FloatingwindowPK"] forState:UIControlStateNormal];
        _PKBtn.alpha = normalAlpha;
        [_PKBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.PKBtn];
#pragma mark share按钮
        _ShareBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
        [_ShareBtn setFrame:(CGRect){0, frame.size.height/2 - 8,frame.size.width, frame.size.height/2}];
        [_ShareBtn setImage:[UIImage imageNamed:@"FloatingwindowShare"] forState:UIControlStateNormal];
        _ShareBtn.alpha = normalAlpha;
        [_ShareBtn addTarget:self action:@selector(ShareClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.ShareBtn];
        
    }
    return self;
}
- (void)dissmissWindow{
    self.hidden = YES;
}
- (void)showWindow{
    self.hidden = NO;
}
//点击事件
- (void)click:(UITapGestureRecognizer*)p
{
    self.PKBtn.alpha = normalAlpha;
    if (self.callService) {
        self.callService();
    }
}
- (void)ShareClick:(UITapGestureRecognizer*)p
{
    if (self.callService1) {
        self.callService1();
    }
}
- (void)changeStatus
{
    [UIView animateWithDuration:1.0 animations:^{
        self.PKBtn.alpha = sleepAlpha;
    }];
    
}
@end
