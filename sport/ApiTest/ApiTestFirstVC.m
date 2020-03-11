

#import "ApiTestFirstVC.h"
#import "NSArray+Log.h"
@interface ApiTestFirstVC ()
{
    NSDictionary *ApiData;
    NSMutableArray *_arrDataFirst;
    NSMutableArray *_arrDataSecond;
    NSArray *sd;
}
//@property(nonatomic,strong)NSDictionary *ApiData;
@property (weak, nonatomic) IBOutlet UILabel *label0;

@property (weak, nonatomic) IBOutlet UILabel *label1;

@property (weak, nonatomic) IBOutlet UILabel *label2;

@property (weak, nonatomic) IBOutlet UILabel *label3;

@property (weak, nonatomic) IBOutlet UILabel *label4;

@property (weak, nonatomic) IBOutlet UILabel *label5;

@property (weak, nonatomic) IBOutlet UILabel *label6;

@property (weak, nonatomic) IBOutlet UILabel *label7;

@property (weak, nonatomic) IBOutlet UILabel *label8;
@end
@implementation ApiTestFirstVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self jsonApi];
}
-(void)jsonApi
{
    NSMutableDictionary *parameter =[[NSMutableDictionary alloc]init];
                requestPost(@"https://sports.hxweixin.top/api/v1/fbinfo/infoNav", parameter, ^(NSError *error) {
                    NSLog(@"解析失败");
                }, ^(NSDictionary *dic) {
                    NSLog(@"解析成功");
                    if([dic[@"code"] intValue] == 200){
                        /*
                         字典Key: continent_id
                         字典Key: continent_name(3个元素) -->数组
                         字典Key: country_array(2个元素)-->数组
                                    Key字典: country_id
                                    Key字典: country_name (3个元素)
                                    Key字典: union_array (45元素)--->数组
                                               key字典:union_id
                                               key字典:union_name (3个元素) ---数组
                                                       数组元素: [
                                                                 "世界杯",
                                                                 "世界盃",
                                                                 "World Cup"
                                                                ]
                         */
                     //数组1--index(0)
            //dic[@"data"][0][@"country_arry"][0][@"country_name"][0]
                       //【】数组 ，{}字典
                        //continent:大陆 
                        //Union:
                        //country:
                        //continent_name:  洲  6组
                  //  country_array: 左边Tab  国际赛事  沙滩赛事 中超赛事
                       // NSArray *arr =[dic[@"data"][0][@"continent_id"],dic[@"data"][1][@"continent_id"]];
                        NSString *strId =dic[@"data"][0][@"continent_id"];
                        NSLog(@"数组id:%@",strId);
                       
                        NSString *str =dic[@"data"][0][@"continent_name"][0];
                        NSLog(@"数组--T%@",str);
                         self.label0.text = str;
                         NSString *str1 =dic[@"data"][0][@"continent_name"][1];
                        NSLog(@"数组2%@",str1);
                         NSString *str2 =dic[@"data"][0][@"continent_name"][2];
                        NSLog(@"数组2%@",str2);

                        NSString *MoreStrId = dic[@"data"][0][@"country_array"][0][@"country_id"];
                         NSLog(@"MoreStrId:%@",MoreStrId);
                        NSString *MoreStrArr = dic[@"data"][0][@"country_array"][0][@"country_name"][0];
                                              NSLog(@"MoreStrId:%@",MoreStrArr);
                        NSString *MoreStrArrF = dic[@"data"][0][@"country_array"][0][@"country_name"][1];
                        NSLog(@"MoreStrId:%@",MoreStrArrF);
                        NSString *MoreStrArrS = dic[@"data"][0][@"country_array"][0][@"country_name"][2];
                        NSLog(@"MoreStrId:%@",MoreStrArrS);
                        
                        //union——array
                        
                        NSString *unionStrId = dic[@"data"][0][@"country_array"][0][@"union_array"][0][@"union_id"];
                        NSLog(@"MoreStrId:%@",unionStrId);
                        NSString *unionStrArr = dic[@"data"][0][@"country_array"][0][@"union_array"][0][@"union_name"][0];
                                               NSLog(@"MoreStrId:%@",unionStrArr);
                        NSString *unionStrArrF = dic[@"data"][0][@"country_array"][0][@"union_array"][0][@"union_name"][1];
                        NSLog(@"MoreStrId:%@",unionStrArrF);
                        NSString *unionStrArrS = dic[@"data"][0][@"country_array"][0][@"union_array"][0][@"union_name"][2];
                        NSLog(@"MoreStrId:%@",unionStrArrS);
                    
                    }
                   // NSLog(@"解析:%@",dic);//打印
                    });
}

@end
