//
//  CustomUITextField.h
//  Sports
//
//  Created by test on 2020/1/6.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomUITextField : UITextField
{
    
    UILabel *line;
}
@property(strong,nonatomic)UILabel *hintText;
-(Boolean)setHidden:(Boolean)isOn;
-(void)setHintText:(NSString*)ht;
@end



NS_ASSUME_NONNULL_END
