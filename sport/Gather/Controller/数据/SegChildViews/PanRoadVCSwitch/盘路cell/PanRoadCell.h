
//PanRoadCell




#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PanRoadCell : UITableViewCell
//@property(nonatomic,strong)UILabel *bootText;//引导文字
@property(nonatomic,strong)UIImageView *ballImage;
@property(nonatomic,strong)UILabel *ballName;




@property(nonatomic,strong)UILabel *data;
-(void)setDataLabelTextArray:(NSArray*)dataLabelArray;

/*
-(void)setBootTextBGColor:(UIColor*)color;
-(void)setBootTextTextColor:(UIColor*)tC;
-(void)setBootTextCornerRadius:(CGFloat)btcr;
-(void)setMaskToBounds:(BOOL)mtb;
-(void)setBootTextStr:(NSString*)btStr;

*/
-(void)getBallImageName:(NSString*)bIMG BallNameText:(NSString*)bnT;

@end

NS_ASSUME_NONNULL_END
