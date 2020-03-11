//
//  money.m
//  Sports
//
//  Created by test on 2020/1/8.
//  Copyright © 2020 test. All rights reserved.
//

#import "money.h"
#import "moneyModel.h"
@implementation money


-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.purpleColor;
        self.moneyTitle = [[UILabel alloc] init];
        [self addSubview:self.moneyTitle];
        self.moneyCount = [[UILabel alloc] init];
        [self addSubview:self.moneyCount];
        
        self.moneyTitle.frame = CGRectMake(30*KWIDTH,30*KWIDTH,300*KWIDTH,40*KWIDTH);
        self.moneyTitle.font = Font14;
        self.moneyTitle.textAlignment = NSTextAlignmentLeft;
        self.moneyTitle.text  = @"球币余额";
        
        self.moneyCount.frame = CGRectMake(400*KWIDTH,self.moneyTitle.y,SCREEN_WIDTH - 470*KWIDTH - 30*KWIDTH,40*KWIDTH);
        self.moneyCount.font = Font14;
        self.moneyCount.textColor  = colorWithHexString(@"#FF2D2D");
        self.moneyCount.textAlignment = NSTextAlignmentRight;
        
        //self.moneyTitle.backgroundColor = UIColor.redColor;
        //self.moneyCount.backgroundColor = UIColor.yellowColor;
        
        
        
    }
    return self;
}
-(void)getprice:(NSString *)p
{
    
    self.moneyCount.text = p;

}
@end
