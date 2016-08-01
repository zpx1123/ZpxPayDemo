//
//  PayUntil.m
//  MicroBusinessBank
//
//  Created by 周鹏翔 on 16/6/15.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "PayUntil.h"
#import "WXApiObject.h"
#import "AppMethod.h"
#import "AlipayHelper.h"
#import "WXApi.h"
#import <sys/time.h>
#import <pthread.h>
@implementation PayUntil
singleton_implementation(PayUntil)


- (void)aliPayClick:(PayModel *)model;
{
    // 添加商品信息
    Product *product = [Product new];
    //    product.orderId = [AppMethod getRandomString];
    product.orderId = model.order_number;
    product.subject = model.order_number;
    product.body = model.order_number;
    product.price = model.order_amount;
    
    
    // 调起支付宝客户端
    [[AlipayHelper shared] alipay:product partner:model.alipay_partner seller:model.alipay_appid privateKey:model.alipay_secret block:^(NSDictionary *result) {
        // 返回结果
        NSString *message = @"";
        //        MyOrderVC * myorder=[[MyOrderVC alloc]init];
        //        [self.navigationController pushVC:myorder animated:YES];
        switch([[result objectForKey:@"resultStatus"] integerValue])
        {
            case 9000:message = @"订单支付成功";break;
            case 8000:message = @"正在处理中";break;
            case 4000:message = @"订单支付失败";break;
            case 6001:message = @"用户中途取消";break;
            case 6002:message = @"网络连接错误";break;
            default:message = @"未知错误";
        }
        
        
        
        
        
    }];
    
}
- (void)wechatPayClick:(PayModel *)model{
    
    PayReq* req             = [[PayReq alloc] init];
    req.partnerId           = model.weixin_mch_id;
    req.prepayId            = model.weixin_prepayid;
    req.nonceStr            = model.weixin_noncestr;
    req.timeStamp           = [model.weixin_timestamp intValue];
    req.package             = model.weixin_packageStr;
    //    req.sign                = model.weixin_sign;
    // 添加签名数据并生成签名
    NSMutableDictionary *rdict = [NSMutableDictionary dictionary];
    [rdict setObject:model.weixin_appid forKey:@"appid"];
    [rdict setObject:req.partnerId forKey:@"partnerid"];
    [rdict setObject:req.prepayId forKey:@"prepayid"];
    [rdict setObject:req.nonceStr forKey:@"noncestr"];
    [rdict setObject:[NSString stringWithFormat:@"%u",(unsigned int)req.timeStamp] forKey:@"timestamp"];
    [rdict setObject:req.package forKey:@"package"];
    NSDictionary *result = [AppMethod partnerSignOrder:rdict partnerId:@"15084512587kjhytrvbgdy157403517j"];
    req.sign                = [result objectForKey:@"sign"];
    
    // 调起客户端
//    dispatch_async_on_main_queue(^{
//        [WXApi sendReq:req];
//    });
    
    if (pthread_main_np()) {
     [WXApi sendReq:req];
    } else {
       
        dispatch_async(dispatch_get_main_queue(), ^(){
            
             [WXApi sendReq:req];
            
        });
    }
    
    
    
}
@end
