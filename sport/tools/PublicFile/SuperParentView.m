//
//  SuperParentView.m
//  Sports
//
//  Created by test on 2020/1/7.
//  Copyright © 2020 test. All rights reserved.
//

#import "SuperParentView.h"

@implementation SuperParentView

-(UIButton *)btn{
    if(!_btn){
        //
        _btn = [[UIButton alloc]initWithFrame:CGRectMake(_btn.x + _btn.width + 10*KWIDTH,_btn.y,80*KWIDTH,_btn.height)];
        //_btn.backgroundColor = UIColor.redColor;
        [_btn setImage:[UIImage imageNamed:@"selectNo"] forState:UIControlStateNormal];
        //[_btn setImage:[UIImage imageNamed:@"selectYes"] forState:UIControlStateSelected|UIControlStateSelected];
        [_btn addTarget:self  action:@selector(selectPayStyle:)forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}
-(UILabel*)secretLabel{
    
    if(!_secretLabel){
        
        _secretLabel = [[UILabel alloc]init];
        _secretLabel.frame = CGRectMake(0,0 ,50*KWIDTH,50*KWIDTH);
        //_secretLabel.backgroundColor = [UIColor redColor];
    }
    return _secretLabel;
}
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //self.verticalAlignment = VerticalAlignmentMiddle;
        // [self initializationLoad]
       
        self.userInteractionEnabled = YES;
        [self addSubview:self.btn];
        [self addSubview:self.secretLabel];
    }
    return self;
}
-(void)setSecretLabelText:(NSString *)title
{
    self.secretLabel.text  = title;
}
-(void)selectPayStyle:(UIButton*)sender{
 
    self.myBlock(sender);
   
}

//- (void)selectPayStyle:(UIButton*)btn{
//
//}

@end
