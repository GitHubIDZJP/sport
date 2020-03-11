//
//  publishedArticlesVC.m
//  Sports
//
//  Created by test on 2020/1/3.
//  Copyright © 2020 test. All rights reserved.
//

#import "publishedArticlesVC.h"
#define TEXTVIEWSTR @"\u3000\u3000为贯彻落实国家有关弘扬中华优秀传统文化、推动戏曲繁荣发展的系列文件精神，广东音像出版社有限公司组织编写了这本《戏曲实用知识读本》，力图为“戏曲进校园”普及推广戏曲基础知识、为读者提供一本既简明实用又相对系统的戏曲入门书。\n\n\n \u3000\u3000中国戏曲源远流长，博大精深，是中华优秀传统文化的重要组成部分，也是一座丰富无比的知识宝库，要在本书里讲完备是不可能的，好在中国戏曲又是雅俗共赏、来自民间长在民间的瑰宝，并不神秘。在近千年的传承发展过程中，我们祖辈中许多一字不识的人也能与许多大家一样欣赏戏曲、理解戏曲、酷爱戏曲。我们相信这本书能为初学者提供帮助，也希望有更多的戏曲爱好者和戏曲工作者能在此基础上进一步深入了解学习戏曲，在实践中不断提升戏曲欣赏和创作表演水平。在历史的长河中，中国戏曲的三百多个剧种不仅积累了大量优秀的传统剧目，涌现出一大批杰出的戏曲艺术家，也留下了丰富的学术研究成果。本书在编写过程中，尽量采用已经过实践证明、达成共识的主流论述，包括已经编入许多戏曲院校教材的知识。一些尚待探讨没有定论的观点暂未列入。"
@interface publishedArticlesVC ()

@end



@implementation publishedArticlesVC
-(customNavigationBar*)NavBar{
    if(!_NavBar){
        _NavBar  = [[customNavigationBar alloc]initWithFrame:RECT(0,0,SCREEN_WIDTH,JH_NavBarHeight)];
        
       // _NavBar.backgroundColor =  colorWithHexString(@"#07913B");
    }
    return _NavBar;
}
-(UITextView*)textView
{
    if(!_textView){
        _textView = UITextView.new;
        _textView.textColor = color(72, 72, 72);
        //_textView.frame = RECT(30*KWIDTH,30*KWIDTH,SCREEN_WIDTH - 60*KWIDTH,697*KWIDTH);
        _textView.backgroundColor = color(240, 240, 241);
        
    }
    return _textView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = color(240, 240, 241);
   // [self.view addSubview:self.tableView];
    [self.view addSubview:self.NavBar];
    [self.NavBar setRightButtonIsHidden:YES];
    [self.NavBar setCenterText:@"关于我们"];
   // [self.NavBar setCenterTextColor:UIColor.whiteColor];
    __block  UIViewController *vc = self;
    [self.NavBar setBackBlock:^{
        NSLog(@"导航条按钮");
      //  [vc dismissViewControllerAnimated:NO completion:nil];
        [vc.navigationController popViewControllerAnimated:YES];
    }];
    
    [self.view addSubview:self.textView];
    self.textView.text  = TEXTVIEWSTR;
    self.textView.font = Font13;
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(30*KWIDTH);
        make.top.mas_offset(185*KWIDTH+zjpTest);

        make.size.mas_equalTo(CGSizeMake(689*KWIDTH,697*KWIDTH));
    }];
}
@end
