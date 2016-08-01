//
//  PayModel.m
//  MicroBusinessBank
//
//  Created by 周鹏翔 on 16/6/1.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "PayModel.h"

@implementation PayModel

+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{@"alipay_appid"         : @"alipay_appid",
             @"alipay_partner"       : @"alipay_partner",
             @"alipay_secret"       : @"alipay_secret",
             
             @"orderid"       : @"orderid",
             @"shopid"       : @"shopid",
             @"order_number"       : @"order_number",
             @"timestamp"       : @"timestamp",
             @"noncestr"       : @"noncestr",
             @"sign"       : @"sign",
             @"order_amount"       : @"order_amount",
             
             
             
             @"unionpay_merid"       : @"unionpay_merid",
             @"unionpay_tn"       : @"unionpay_tn",
             
             
             @"weixin_appid"       : @"weixin_appid",
             @"weixin_mch_id"       : @"weixin_mch_id",
              @"weixin_noncestr"       : @"weixin_noncestr",
              @"weixin_packageStr"       : @"weixin_packageStr",
              @"weixin_prepayid"       : @"weixin_prepayid",
              @"weixin_sign"       : @"weixin_sign",
              @"weixin_timestamp"       : @"weixin_timestamp",
             @"weixin_secret"       : @"weixin_secret"
             
             };
}
@end
