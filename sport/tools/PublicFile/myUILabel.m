
#import "myUILabel.h"

@implementation myUILabel
@synthesize verticalAlignment = verticalAlignment_;
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.verticalAlignment = VerticalAlignmentMiddle;
    }
    return self;
}

- (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment {
    verticalAlignment_ = verticalAlignment;
    [self setNeedsDisplay];
}


- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAlignment) {
        case VerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case VerticalAlignmentMiddle:
            // Fall through.
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
    
}

-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
    

}
/*
 
 myUILabel *laebl = [[myUILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 200)];
 laebl.backgroundColor = [UIColor redColor];
 
 laebl.text = @"哈哈哈哈哈";
 //放到顶部
 [laebl setVerticalAlignment:VerticalAlignmentTop];
 //放到中间
 //  [laebl setVerticalAlignment:VerticalAlignmentMiddle];
 //放到最先面
 // [laebl setVerticalAlignment:VerticalAlignmentBottom];
 [self.view addSubview:laebl];

 
 */

@end
