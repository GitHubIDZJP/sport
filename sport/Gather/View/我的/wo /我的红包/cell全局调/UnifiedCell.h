

//cell  ：3个vc 都调这个cell 因为是一样的布局
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UnifiedCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bgImg;

@property (weak, nonatomic)IBOutlet UILabel *AmountMoney;//10
@property (weak, nonatomic)IBOutlet UILabel *favourable;//优惠
@property (weak, nonatomic)IBOutlet UILabel *validityDate;//有效期
@end

NS_ASSUME_NONNULL_END
