

#import "HXTextView.h"
@interface HXTextView()<UITextViewDelegate>

@end
@implementation HXTextView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.font = Font15;
        self.layer.cornerRadius = 10*KWIDTH;
        self.layer.masksToBounds = YES;
        self.hintLabel= [[UILabel alloc] init];
        self.hintLabel.frame = RECT(29*KWIDTH,32*KWIDTH,300*KWIDTH,26*KWIDTH);
        self.hintLabel.textAlignment = NSTextAlignmentLeft;
        self.hintLabel.textColor = colorWithHexString(@"#CCCCCC");
        //self.hintLabel.text = @"dfsddddddddsdsddssddsds";
        //self.hintLabel.backgroundColor = UIColor.redColor;
        [self addSubview:self.hintLabel];
        //设置提示竖线距离左边的距离
        self.textContainerInset =UIEdgeInsetsMake(29*KWIDTH, 25*KWIDTH, 0, 0);//top:33 left: 25
        self.delegate =self;
         
    }
    return self;
}
//TextView Delegate
- (void) textViewDidChange:(UITextView *)textView{
    
    if ([textView.text length] == 0) {
        
        [self.hintLabel setHidden:NO];
        
    }else{
        
        [self.hintLabel setHidden:YES];
        
    }
    
}
-(void)inputPromptText:(NSString*)Hint{
    self.hintLabel.text = Hint;
    
}
@end
