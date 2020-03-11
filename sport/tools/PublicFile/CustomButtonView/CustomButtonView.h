#import <UIKit/UIKit.h>

@class CustomButtonView;
//协议
@protocol CustomButtonViewDelegate <NSObject>
//协议方法
- (void)CustomView:(CustomButtonView *)top didSelectButtonFrom:(int)from to:(int)to;
@end

@interface CustomButtonView : UIView
//代理对象
@property (nonatomic,assign)id<CustomButtonViewDelegate>delegate;


@end
