#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface statusBtn : UIView
@property(nonatomic,strong)UIButton *clickAddCurrentValue;
@property(nonatomic,strong)UILabel *current;
//@property(nonatomic,copy)void(^myBlock)(void);
//参数回传

-(void)setclickAddCurrentValuebackgroundImage:(NSString*)imgName currentLabelText:(NSString*)currentText;
@end

NS_ASSUME_NONNULL_END
