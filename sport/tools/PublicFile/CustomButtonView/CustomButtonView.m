
#import "CustomButtonView.h"
#define lineMagrinBtn 2
#define lineY (IS_iPhoneX ? (  2.f) : 0.f)
#define MainWidth [[UIScreen mainScreen] bounds].size.width
@interface CustomButtonView()
{
    
    NSArray *titleArr;
    UIButton *button;
    CGFloat buttonW;
    CGFloat x ;
    CGFloat lineX;
    CGFloat botLinW;
}
@property(nonatomic,strong)UIButton *selectBtn;
@property(nonatomic,strong)UIView *botLine;
@end
@implementation CustomButtonView

- (id)initWithFrame:(CGRect)frame
{
    
    if (self = [super initWithFrame:frame]) {
        [self createUI];
        self.backgroundColor =[UIColor whiteColor];
    }
    
    return self;
}

- (void)createUI
{
    
    //按钮
    titleArr = @[@"动态",@"推荐",@"直播"];
    for (NSInteger i=0; i<titleArr.count; i++) {
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        // button.frame = CGRectMake(MainWidth/titleArr.count *i,0, MainWidth/titleArr.count, 49);
        buttonW = MainWidth/titleArr.count;
        x =MainWidth/titleArr.count *i;
        button.frame = CGRectMake(x,-9,buttonW, 35);
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        button.titleLabel.font = Font14;
        [button setTitleColor:colorWithHexString(@"#4CB13B") forState:UIControlStateSelected];
        [button setTitleColor:colorWithHexString(@"#999999") forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        if (i==0) {
            [self btnClick:button];
        }
    }
    
    //线条
    _botLine = [[UIView alloc] init];
    //  _botLine.frame = CGRectMake(lineX, 43, MainWidth/titleArr.count, 3);
    CGFloat b_w = botLinW- 15;
    CGFloat b_X =  botLinW/2 -0;//
    _botLine.frame = CGRectMake(lineX+5, button.y+button.height-lineMagrinBtn-lineY, b_w, 1);
    _botLine.backgroundColor = colorWithHexString(@"#4CB13B");
    [self addSubview:_botLine];
    
    
    
    
}

//代理事件
- (void)btnClick:(UIButton *)sender
{
    
    //判断是否执行这个方法(实现了才会指向下面的方法)
    if ([_delegate respondsToSelector:@selector(CustomView:didSelectButtonFrom:to:)]) {
        [_delegate CustomView:self didSelectButtonFrom:(int)_selectBtn.tag to:(int)sender.tag];
    }
    //反选
    _selectBtn.selected = NO;
    sender.selected = YES;
    _selectBtn = sender;
    
    //动画
    [UIView animateWithDuration:0.3 animations:^{
        
        // _botLine.frame = CGRectMake(0+MainWidth/titleArr.count*sender.tag,43, MainWidth/titleArr.count/3, 3);
        // CGFloat BtnW =MainWidth/titleArr.count/3;
        botLinW = buttonW/4;
        lineX = buttonW/2- botLinW/2;
        _botLine.frame = CGRectMake(lineX+ 5 + (buttonW)  *sender.tag,button.y+button.height-lineMagrinBtn-lineY,botLinW-15 ,1);
        
    } completion:^(BOOL finished) {
    }];
}

@end
