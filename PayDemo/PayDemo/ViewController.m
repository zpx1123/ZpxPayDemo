//
//  ViewController.m
//  PayDemo
//
//  Created by 周鹏翔 on 16/7/25.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "ViewController.h"
#import "PayUntil.h"
#import "UPPaymentHelper.h"

@interface ViewController ()

@end

/**
 *  微信 支付宝 银联 支付sdk
 
    1 其中AppUtils类 设置微信支付宝 等配置文件
    2 在appdelegate.m文件设置回调
    3 在info.plist设置白名单， 和URL Types
    4 在设置build settings 设置header serarch paths 参考配置文件
    5 paymodel 就是支付所需要的信息， 
 
 
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    //模型中数据 分别是支付宝 微信 银联 所需要的数据， 根据接口返回即可，
//      PayModel * model=[[PayModel alloc]init];
//    model.alipay_appid=@"youjue1234@sina.com";
//    model.alipay_partner=@"2088021729853191";
// model.alipay_secret=@"MIICXQIBAAKBgQDxWF1lzSqcLAPsgR6Sy146Y1zOIvDgu7UfNCKaSKBNlVuW1tWpUrysPK0CgsETEZUHbjxcmu3qgDHxBtUuzRX1OlQB+Ayd5lz6MkoDpFi0uHFDu6PGFDnCiRRM0aug3yepGfbevAH6H7a5Y5MXKb6XXfQVuEPi7eZx5jFlGOhu6QIDAQABAoGAZVCrJKlUUetIWmh55TXqgKhltUOFy1IBXvAL9qi2Yttob5IQb9yDx+pQ1tT9KHwhC9WDEX0Yk3DthjlQFS2TIWaAuxKDrJsePKPq2JD0/mrYn55GFXyj4Fb2Dw3qpc+m+LWk3s9/zG0SgtNPNMdgJpj3SFY9aBt1IWuLpfTLEAECQQD5mzBVJfYgCOsTmWagRl6ed9T4mPf2W4XS1f/Rbff0LF/NGSezPK20qNba3B+QC3/Ci2INJIcUcik+ryZKOWApAkEA94cA8zvSvOwkieN9Hr5ysCEWHSLjh7We8lTf6LOv9+PChT1nV7C3av1cMI798OXODLoNinbXaYWVPz7J241wwQJBAN2FeECpXyURJSgQxX7K1SCIsy8p+y7eDQePuujwUtWWKDPK9mvhFzy1d3FnWG+rdOiAcTW+zE89/hLOuQm4n/kCQEjJ4nWkeewkZPpHc1u/FWrF0ALxZ4dY2UzZuJ5teKmkyGb2D5Wx2b4Uky+UXQiiC12iuKinGeFl7uWSSTnO9gECQQDPQ0WMhlaeGPoKSzeIfC5xVgKGEWBlK4yV/Cb7hmbRrdy7WJYNOZFr/Sm3LIfBg/1k0jW5xOSXojP5iubfabB9";
//
//    
//    
//    //支付宝支付
//     [[PayUntil sharedPayUntil] aliPayClick:model];
//
//    
//    //微信支付
//    [[PayUntil sharedPayUntil] wechatPayClick:model];
//
    
    
    
    
    
    
//    //银联支付
//    UPPaymentHelper * uppay=[UPPaymentHelper shared];
//    [uppay UPPay:model.unionpay_tn viewContorller:self block:^(NSDictionary *result) {
//        
//    }];
    
    //测试
//    [uppay UPPay:@"" viewContorller:self block:^(NSDictionary *result) {
//        
//    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
