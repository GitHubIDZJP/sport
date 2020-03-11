

#import "collectCell.h"

@implementation collectCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.layer.cornerRadius = 10*KWIDTH;
        self.layer.masksToBounds = YES;
    
        
    }
    return self;
    
}


        
- (void)setFrame:(CGRect)frame{
    CGFloat margin = 15*KWIDTH;
    frame.origin.x += margin;
    frame.size.width -= 30*KWIDTH;
    frame.size.height -=30*KWIDTH;
    [super setFrame:frame];
}
@end
