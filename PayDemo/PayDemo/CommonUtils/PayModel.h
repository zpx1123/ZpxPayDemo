//
//  PayModel.h
//  MicroBusinessBank
//
//  Created by 周鹏翔 on 16/6/1.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PayModel : NSObject

@property(nonatomic,strong)NSString * alipay_appid;
@property(nonatomic,strong)NSString * alipay_partner;
@property(nonatomic,strong)NSString * alipay_secret;

@property(nonatomic,strong)NSString * orderid;
@property(nonatomic,strong)NSString * shopid;
@property(nonatomic,strong)NSString * order_number;
@property(nonatomic,strong)NSString * timestamp;
@property(nonatomic,strong)NSString * noncestr;
@property(nonatomic,strong)NSString * sign;
@property(nonatomic,assign)float  order_amount;



@property(nonatomic,strong)NSString * unionpay_merid;
@property(nonatomic,strong)NSString * unionpay_tn;

@property(nonatomic,strong)NSString * weixin_appid;
@property(nonatomic,strong)NSString * weixin_mch_id;
@property(nonatomic,strong)NSString * weixin_secret;
@property(nonatomic,strong)NSString * weixin_noncestr;
@property(nonatomic,strong)NSString * weixin_packageStr;
@property(nonatomic,strong)NSString * weixin_prepayid;
@property(nonatomic,strong)NSString * weixin_sign;
@property(nonatomic,strong)NSString * weixin_timestamp;





@end
