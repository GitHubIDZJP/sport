
//资讯------->
#import "watchBarItemViewController.h"

@interface watchBarItemViewController ()
@end
@implementation watchBarItemViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *parameter =[[NSMutableDictionary alloc]init];
       parameter[@"api_id"] = @"2";
       parameter[@"version"] = @"sd";
       requestPost(@"http://www.cnstorm.com/index.php?route=api/tool/config", parameter, ^(NSError *error) {
           NSLog(@"解析失败");
       }, ^(NSDictionary *dic) {
           NSLog(@"解析成功");
           if([dic[@"code"] intValue] == 1){
                NSDictionary *dicValue = dic[@"result"];//key值
               NSLog(@"网页地址1:%@", dicValue[@"alipay_url"]);
               NSLog(@"网页地址2:%@", dicValue[@"api_url"]);
               NSLog(@"网页地址3:%@", dicValue[@"paypal_url"]);
               NSLog(@"网页地址4:%@", dicValue[@"wxpay_url"]);
               NSLog(@"网页地址5:%@", dicValue[@"site"]);
           }   
           NSLog(@"解析:%@",dic);//打印
       });
    
}

@end
