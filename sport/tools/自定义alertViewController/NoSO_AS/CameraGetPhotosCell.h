//
//  CameraGetPhotosCell.h
//  TooBrocadeCarp
//
//  Created by tjl on 2019/11/5.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CameraGetPhotosCell : UITableViewCell

@property(nonatomic,strong)UILabel *selectCamera;
-(void)setConteentDescCamera:(NSString*)camera;

@end

NS_ASSUME_NONNULL_END
