//
//  customTextView.m
//  Sports
//
//  Created by test on 2020/1/7.
//  Copyright © 2020 test. All rights reserved.
//

#import "customTextView.h"
@interface customTextView ()<UITextViewDelegate>
{
    
}
@end

@implementation customTextView
-(UILabel*)hint
{
    if(!_hint){
        
        _hint= UILabel.new;
        _hint.frame = RECT(23*KWIDTH,20*KWIDTH,self.width,26*KWIDTH);
        _hint.tintColor = colorWithHexString(@"#999999");
        _hint.font = Font14;
        _hint.text = @"内容";
        
    }
    return _hint;
    
}
-(UIImageView *)uploadImg
{
    if(!_uploadImg){
        
        _uploadImg = UIImageView.new;
        _uploadImg.frame = RECT(_hint.x,self.height -108*KWIDTH,88*KWIDTH,88*KWIDTH);
        _uploadImg.backgroundColor = UIColor.blueColor;
    }
    return _uploadImg;
}
-(UIButton*)upBtn
{
 
    if(!_upBtn){
        _upBtn = UIButton.new;
        _upBtn.frame = RECT(118*KWIDTH,232*KWIDTH,_uploadImg.width,_uploadImg.height
                            );
        [_upBtn setBackgroundImage:[UIImage imageNamed:@"addImgBtn@2x.png"] forState:0];
    }
    return _upBtn;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //self.verticalAlignment = VerticalAlignmentMiddle;
     //   [self initializationLoad];
        self.userInteractionEnabled = YES;
        [self addSubview:self.hint];
        self.delegate = self;
        [self addSubview:self.uploadImg];
        [self addSubview:self.upBtn];
        [self.upBtn addTarget:self action:@selector(click:) forControlEvents:1 << 6];
        
        
    }
    return self;
}
-(void)click:(UIButton*)up{
    self.UpLoadBlock();
    
}
-(void)textViewDidChange:(UITextView *)textView{
  
    if([textView.text length] == 0){
        [_hint setHidden:NO];
    }else{
        [_hint setHidden:YES];
        
    }
    
}
-(void)getImage:(NSString *)img{
    _uploadImg.image = [UIImage imageNamed:img];
    
}
@end
