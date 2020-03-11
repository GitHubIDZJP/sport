//
//  IntegralVC.m
//  Sports
//
//  Created by test on 2020/1/9.
//  Copyright © 2020 test. All rights reserved.
//

#import "IntegralVC.h"

@interface IntegralVC ()

@end

@implementation IntegralVC

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    
    self.view.backgroundColor = UIColor.redColor;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,140,70,70)];
    label.text = @"1";
    [self.view addSubview:label];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
