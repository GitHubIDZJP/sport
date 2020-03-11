//
//  BallTeamMember.m
//  Sports
//
//  Created by test on 2020/1/18.
//  Copyright © 2020 test. All rights reserved.
//

#import "BallTeamMember.h"
#import "imgOrTitleBtn.h"
#import "teamBtn.h"
@interface BallTeamMember ()

@end

@implementation BallTeamMember

- (void)viewDidLoad {
    [super viewDidLoad];
 
    //self.view.backgroundColor = UIColor.redColor;
    VCBGCOLOR;
    
    /*
     
     CGFloat w = (SCREEN_WIDTH- 60*KWIDTH)/4;
     NSInteger index =idx % 4;//每排的个数
     NSInteger page = idx / 4;//有多少列
     addM.frame = RECT(index * (w ) + 0,90*KWIDTH +page * (w)+ 0,w,w);
     [cell addSubview:addM];
     [addM setImg:btnIcon[idx] title:titles[idx]];
     addM.tag = idx+1;
     
     
     */
    NSArray *TeamLeader = [NSArray arrayWithObjects:@"林书豪头像",@"肋布朗",@"科比",@"凯文",@"易建联",@"本田",@"梅西",@"姚明",nil];
    NSArray  *ballplayerName=@[@"林书豪",@"肋布朗",@"科比",@"凯文·杜",@"易建联",@"本田垚佑",@"里奥·梅西",@"姚明"];
    //NSArray *ballplayerName = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
    [ballplayerName enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       teamBtn *name = teamBtn.new;
        CGFloat w = 330*KWIDTH;
        CGFloat h = 88*KWIDTH;
        NSInteger index =idx % 2;//每排的个数
        NSInteger page = (idx / 2)+2;//有多少列
        CGFloat m_left = 30*KWIDTH;
      
        
        
        CGFloat centerEdge = 30*KWIDTH;
        name.frame = RECT(index * (w + centerEdge ) +m_left, ( page*(idx+h)-100*KWIDTH) ,w,h);
        name.backgroundColor = White;
        [name ballImgNmae:TeamLeader[idx] ballName:ballplayerName[idx] nNmmber:@"12"];
        [self.view addSubview:name];
        name.layer.cornerRadius = 10*KWIDTH;
        name.layer.masksToBounds = YES;

    }];
    
    
    
    
    
    
    
    
}




@end
