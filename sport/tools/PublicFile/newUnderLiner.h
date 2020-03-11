//
//  newUnderLiner.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/10/30.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface newUnderLiner : UITextField
{
    CGContextRef context;
}
//-(void)setContextLinerSpacingGetHeight:(int)h GetWidth:(int)w;
@property(nonatomic,strong)UILabel *labelSize;//这个需要定义么 
@end

NS_ASSUME_NONNULL_END
