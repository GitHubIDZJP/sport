//
//  HXTextView.h
//  QCGlobalSport
//
//  Created by test on 2020/2/17.
//  Copyright © 2020 com.qqty. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HXTextView : UITextView
@property(nonatomic,strong)UITextView *TView;
@property(nonatomic,strong)UILabel *hintLabel;
-(void)inputPromptText:(NSString*)Hint;
@end

NS_ASSUME_NONNULL_END
