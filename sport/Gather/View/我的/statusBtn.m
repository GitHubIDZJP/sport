
#import "statusBtn.h"
#define KWIDTH [UIScreen mainScreen].bounds.size.width/750.0
@implementation statusBtn






- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        /// NSLog(@"%s",__func__);
        [self createSubViews];
    }
    return self;
}
-(void)createSubViews{
    CGFloat btnH = 25*KWIDTH;
  
    CGFloat btnY = 70*KWIDTH/2-btnH/2;
    NSLog(@"父视图的高度:%f",btnY);
    _clickAddCurrentValue = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40*KWIDTH,btnH)];
    
    _current = [[UILabel alloc]initWithFrame:RECT(_clickAddCurrentValue.x + _clickAddCurrentValue.width + 10*KWIDTH,0,80*KWIDTH,25*KWIDTH)];
    // [_clickAddCurrentValue setTitle:@"sd" forState:normal];
    _current.font = Font12;
    
    
    _clickAddCurrentValue.tag = 100;
    _current.tag = 101;
    
    
    
    
    
    
    
    [self addSubview:_clickAddCurrentValue];
    [self addSubview:_current];
    
    
}
-(void)setclickAddCurrentValuebackgroundImage:(NSString*)imgName currentLabelText:(NSString*)currentText{
    [_clickAddCurrentValue setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    _current.text = currentText;
    
}







@end
