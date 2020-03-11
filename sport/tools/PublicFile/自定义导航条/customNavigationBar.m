


#import "customNavigationBar.h"
//#import "HomePageViewController.h"

@implementation customNavigationBar








- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        // self.backgroundColor = color(229, 171, 66);
        //初始化
        
        self.backgroundColor =  UIColor.whiteColor;
        
        
        
        
        
        
        CGFloat leftButtonH = 30*KWIDTH;
        CGFloat leftButtonY = self.height/2-leftButtonH/3;
        
        
        
        self.userInteractionEnabled = YES;
        self.leftButton = [[UIButton alloc]initWithFrame:CGRectMake(34*KWIDTH, 68*KWIDTH +zjpTest ,18*KWIDTH,leftButtonH)];
        // self.leftButton.backgroundColor = [UIColor purpleColor];//
        [self.leftButton setBackgroundImage:[UIImage imageNamed:@"返 回@2x"] forState:0];
        [self.leftButton addTarget:self action:@selector(returnPAGE:) forControlEvents:1 << 6];
        self.leftButton.tag = 10010;
        self.leftButton.hitScale = 6;//增加点击范围
        [self addSubview:self.leftButton];
        
        CGFloat middleTextH = 50*KWIDTH;
        CGFloat mideleTextY =self.height/2  - middleTextH /3;
        CGFloat middleTextX = 141*KWIDTH;
        self.middleText =  [[myUILabel alloc]initWithFrame:RECT(middleTextX,59*KWIDTH +zjpTest,SCREEN_WIDTH - 2 *middleTextX,middleTextH)];
        //self.middleText.backgroundColor = [UIColor redColor];
        self.middleText.textColor = UIColor.blackColor;//colorWithHexString(@"#333333");
        self.middleText.font = Font17;
        [self.middleText setVerticalAlignment:VerticalAlignmentMiddle];
        [self addSubview:self.middleText];
        // self.middleText.font = Font13;
        self.middleText.font = [UIFont fontWithName:@"PingFang-SC-Bold" size:17] ;// [UIFont systemFontOfSize: weight:<#(UIFontWeight)#>];
        // self.middleText.text= @"筛选";
        self.middleText.textAlignment = NSTextAlignmentCenter;
        //右按钮
        // w 24 h 24  margin- right = 17pt
        
        
        
        
        
        self.rightButton =  [[UIButton alloc]initWithFrame:CGRectMake(631*KWIDTH,59*KWIDTH +zjpTest,48*KWIDTH,self.leftButton.frame.size.height)];
        self.rightButton.tag = 9;
        self.rightButton.backgroundColor = [UIColor redColor];
        [self addSubview:self.rightButton];
        [self.rightButton addTarget:self action:@selector(push) forControlEvents:1 << 6];
        //   consultantMessage z咨询师信息
        
        
    }
    return self;
    
    
    
}
//左按钮
-(void)returnPAGE:(UIButton*)SENDER{
    self.backBlock();
}
//右按钮
-(void)push{
    self.pushBlock();
}
//-(void)setCenterText:(NSString *)text andSetRightBtnBgImage:(NSString *)img{
//    self.middleText.text = text;
//    [self.rightButton setImage:   [UIImage imageNamed:img] forState:UIControlStateNormal];
//
//
//}
-(void)setCenterText:(NSString *)text
{
    self.middleText.text  = text;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    
    
    
    
}

-(void)changeFrameX:(int)frameX FrameY:(int)frameY FrameW:(int)frameW FrameH:(int)frameH{
    
    
    
    
    CGRect frame = self.rightButton.frame;
    frame.origin.x -=frameX;
    frame.origin.y -=frameY;
    frame.size.width +=frameW;
    frame.size.height +=frameH;
    self.rightButton.frame = frame;
}
-(void)setRightBtnFont:(UIFont*)font {
    
    self.rightButton.titleLabel.font = font;
}
-(void)setRightBtnTextColor:(UIColor*)color bgColor:(UIColor*)bC
{
    
    [self.rightButton setTitleColor:color forState:0];
    self.rightButton.backgroundColor = bC;
}

-(void)setRightButtonTitle:(NSString *)title{
    [self.rightButton setTitle:title forState:UIControlStateNormal];
}


-(void)setLeftBtnbgckgroundImg:(NSString*)bgImg{
    [self.leftButton setBackgroundImage:[UIImage imageNamed:bgImg] forState:UIControlStateNormal];
    
}
-(void)setBtnTag:(int)tag{
    
    self.leftButton.tag = tag;
    
}
-(Boolean)setCenterTextWhetherHide:(Boolean)isTure{
    
    self.middleText.hidden = isTure;
    return isTure;
    
}
-(void)setRightBtnTag:(int)r_tag{
    
    self.rightButton.tag =r_tag;
}
//-(void)click:(UIButton*)sender{
//
//    NSLog(@"返回之前的页面");
////    HomePageViewController *rturnHome = [[HomePageViewController alloc]init];
////  // [self dismissViewControllerAnimated:YES completion:nil];
////    [sender presentViewController:rturnHome animated:NO completion:]nil;
//
//
//    //self.backgroundColor = [UIColor yellowColor];
//
//
//
//
//
//}
-(void)setMySelfColor:(UIColor*)color{
    
    self.backgroundColor = color;
}
-(void)setCenterTextColor:(UIColor*)textColor{
    self.middleText.textColor = textColor;
}
-(Boolean)setRightButtonIsHidden:(Boolean)sure{
    
    self.rightButton.hidden = sure;
    return sure;
}
-(BOOL)setLeftBtnISHidden:(Boolean)b{
    self.leftButton.hidden = b;
    return b;
}
-(void)resettingRightBtnFrame:(CGRect)rect{
    self.rightButton.frame = rect;
    
}
//-(void)changeRightBtnX:(int)X{
//
//
//
//}
-(void)setMySelfBGColor:(UIColor*)color{
    self.backgroundColor = color;
}
@end
