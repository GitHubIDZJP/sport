//
//  homePageBarItemViewController.m
//  Sports
//
//  Created by test on 2019/12/31.
//  Copyright © 2019 test. All rights reserved.
//

#import "homePageBarItemViewController.h"

@interface homePageBarItemViewController ()

@end

@implementation homePageBarItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //这里写:
  //  [];
    
  //  http://orepool.zhifengwangluo.com/api/banner/info_detail
        
        //这里写:
      //  [];
        
      //  http://orepool.zhifengwangluo.com/api/banner/info_detail
        
        [self updatedgetApiPath];
        
      //  self.view.backgroundColor = UIColor.redColor;
        
         NSLog(@"sdhjdfdf");
        
        
}
 #pragma mark - 获取路径
- (void)updatedgetApiPath
{
   

    
    NSMutableDictionary *parameter =[[NSMutableDictionary alloc]init];
       requestPost(@"https://sports.hxweixin.top/api/v1/fbinfo/infoNav", parameter, ^(NSError *error) {
           NSLog(@"解析失败");
       }, ^(NSDictionary *dic) {
           NSLog(@"解析成功");
           if([dic[@"code"] intValue] == 200){
                NSDictionary *Api = dic[@"data"];//key值
//               NSLog(@"网页地址1:%@", Api[@"alipay_url"]);
//               NSLog(@"网页地址2:%@", Api[@"api_url"]);
//               NSLog(@"网页地址3:%@", Api[@"paypal_url"]);
//               NSLog(@"网页地址4:%@", Api[@"wxpay_url"]);
//               NSLog(@"网页地址5:%@", Api[@"site"]);
             //   NSString *
           }
           NSLog(@"解析:%@",dic);//打印
       });
    
    /*
    
        AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
        securityPolicy.validatesDomainName = NO;//验证域名
        securityPolicy.allowInvalidCertificates = YES;//无效证书
        session.securityPolicy = securityPolicy;//安全策略
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];

        //App版本
        NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        //参数
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[@"api_id"] = @"2";
        dict[@"version"] = app_Version;
        [session POST:[NSString stringWithFormat:@"http://www.cnstorm.com/index.php?route=api/tool/config"] parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            if([responseObject[@"code"] intValue] == 1)
            {
                NSDictionary *dic = responseObject[@"result"];//key值
                //saveUserInfo:保地数据
                saveUserInfo(@"alipay_url", dic[@"alipay_url"]);
                saveUserInfo(@"api_url", dic[@"api_url"]);
                saveUserInfo(@"paypal_url", dic[@"paypal_url"]);
                saveUserInfo(@"wxpay_url", dic[@"wxpay_url"]);
                saveUserInfo(@"site", dic[@"site"]);
            }
            NSLog(@"%@",responseObject);
            [session.session  finishTasksAndInvalidate];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [session.session  finishTasksAndInvalidate];//完成任务并使之无效
    //        DBLog(error.localizedDescription);//本地化描述

        }];
//
    
        
        */
    }

@end
