



#import <UIKit/UIKit.h>
#import "MCTabBar.h"
@protocol MCTabBarControllerDelegate<UITabBarControllerDelegate>
// 重写了选中方法，主要处理中间item选中事件
- (void)mcTabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
@end
@interface MCTabBarController : UITabBarController
@property (nonatomic, weak) id<MCTabBarControllerDelegate> mcDelegate;
@property (nonatomic, strong) MCTabBar *mcTabbar;
@end
