//
//  underLiner.h
//  回家
//
//  Created by Mac on 2019/10/9.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface underLiner : UITextField
{
    CGContextRef context;
}
//-(void)setContextLinerSpacingGetHeight:(int)h GetWidth:(int)w;
@property(nonatomic,strong)UILabel *labelSize;//这个需要定义么 
@end

NS_ASSUME_NONNULL_END
