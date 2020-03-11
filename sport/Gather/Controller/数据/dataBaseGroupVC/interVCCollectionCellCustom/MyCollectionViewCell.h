//
//  MyCollectionViewCell.h
//  UICollectionView
//
//  Created by mac on 2017/11/16.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectionViewCell : UICollectionViewCell
//@property(nonatomic,strong)UIImageView *bgIamge;
@property(nonatomic,strong)UILabel *titleLabel;
-(void)setData:(NSString*)d;
@end
