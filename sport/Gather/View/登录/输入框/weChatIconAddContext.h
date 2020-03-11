//
//  weChatIconAddContext.h
//  TooBrocadeCarp
//
//  Created by Mac on 2019/10/9.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface weChatIconAddContext : UIView

@property(nonatomic,retain)UIButton *otherloginBtn;
@property(nonatomic,retain)UIImageView *weChatIcon;


-(void)SetOtherBtnTagValue:(int)getTag andweChatIconTag:(int)tag;
//-(void)setWeChatIconPathName:(NSString *)weChatIcon ;

-(void)setcolor:(UIColor*)c;



@end

NS_ASSUME_NONNULL_END
