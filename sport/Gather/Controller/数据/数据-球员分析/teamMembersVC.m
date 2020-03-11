
//球员榜


#import "teamMembersVC.h"

@interface teamMembersVC ()

@end

@implementation teamMembersVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,140,70,70)];
    label.text = @"2";
    [self.view addSubview:label];
}



@end
