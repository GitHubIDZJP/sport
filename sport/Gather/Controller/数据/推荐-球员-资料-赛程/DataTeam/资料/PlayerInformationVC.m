//
//  PlayerInformationVC.m
//  Sports
//
//  Created by test on 2020/1/18.
//  Copyright © 2020 test. All rights reserved.
//

#import "PlayerInformationVC.h"

@interface PlayerInformationVC ()

@end

@implementation PlayerInformationVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    NSString *richText= @"|  球队资料";
    //富文本
    NSRange rangStrA = [richText rangeOfString:@"|"];
    NSRange rangStrB = [richText rangeOfString:@"球队资料"];
    NSMutableAttributedString *str_describe = [[NSMutableAttributedString alloc] initWithString:richText];
    [str_describe addAttribute:NSForegroundColorAttributeName value:colorWithHexString(@"#4CB13B") range:rangStrA];//Foreground前景
    [str_describe addAttribute:NSForegroundColorAttributeName value:colorWithHexString(@"#333333") range:rangStrB];
    UILabel *headText = [[UILabel alloc]initWithFrame:RECT(30*KWIDTH,17*KWIDTH,190*KWIDTH,30*KWIDTH)];
    headText.textAlignment =NSTextAlignmentCenter;
    headText.attributedText= str_describe;
    
    
    
    
    [self.view addSubview:headText];
    
    
}


@end
