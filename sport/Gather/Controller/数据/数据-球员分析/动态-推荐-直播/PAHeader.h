




#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN




@interface PAHeader : UIView
@property(nonatomic,strong)UIImageView *bgImg;
@property(nonatomic,strong)UIButton *LB;
@property(nonatomic,strong)UIButton *interestB;
@property(nonatomic,strong)UILabel *ballplayerName;
@property(nonatomic,strong)UIImageView *bCountry;
@property(nonatomic,strong)UILabel *bCity;
@property(nonatomic,strong)UILabel *bInfo;
@property(nonatomic,strong)UILabel *fansCount;
@property(nonatomic,strong)UILabel *fansTitle;
@property(nonatomic,strong)UILabel *bPrice;
@property(nonatomic,strong)UILabel *bPriceHint;
@property(nonatomic,strong)UIImageView *bHeaderPic;

//按钮点击事件
@property(nonatomic,copy)void(^returnPage)(UIButton*);
@property(nonatomic,copy)void(^interestBlock)(UIButton*);
@end

NS_ASSUME_NONNULL_END
