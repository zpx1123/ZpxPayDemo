//
//  AppUtils.h
//  PNeayBy
//
//  Created by wpf on 15/11/15.
//  Copyright © 2015年 wpf. All rights reserved.
//
//////////////////////////---系统设置，方法替换---//////////////////////////////

#ifndef AppUtils_h
#define AppUtils_h

#pragma mark - SDK宏定义
//////////////////////////支付宝//////////////////////////////
#define AlipayPARTNER           @"2088021729853191"
#define AlipaySELLER            @"youjue1234@sina.com"
#define AlipayRSA_PRIVATE       @"MIICXQIBAAKBgQDxWF1lzSqcLAPsgR6Sy146Y1zOIvDgu7UfNCKaSKBNlVuW1tWpUrysPK0CgsETEZUHbjxcmu3qgDHxBtUuzRX1OlQB+Ayd5lz6MkoDpFi0uHFDu6PGFDnCiRRM0aug3yepGfbevAH6H7a5Y5MXKb6XXfQVuEPi7eZx5jFlGOhu6QIDAQABAoGAZVCrJKlUUetIWmh55TXqgKhltUOFy1IBXvAL9qi2Yttob5IQb9yDx+pQ1tT9KHwhC9WDEX0Yk3DthjlQFS2TIWaAuxKDrJsePKPq2JD0/mrYn55GFXyj4Fb2Dw3qpc+m+LWk3s9/zG0SgtNPNMdgJpj3SFY9aBt1IWuLpfTLEAECQQD5mzBVJfYgCOsTmWagRl6ed9T4mPf2W4XS1f/Rbff0LF/NGSezPK20qNba3B+QC3/Ci2INJIcUcik+ryZKOWApAkEA94cA8zvSvOwkieN9Hr5ysCEWHSLjh7We8lTf6LOv9+PChT1nV7C3av1cMI798OXODLoNinbXaYWVPz7J241wwQJBAN2FeECpXyURJSgQxX7K1SCIsy8p+y7eDQePuujwUtWWKDPK9mvhFzy1d3FnWG+rdOiAcTW+zE89/hLOuQm4n/kCQEjJ4nWkeewkZPpHc1u/FWrF0ALxZ4dY2UzZuJ5teKmkyGb2D5Wx2b4Uky+UXQiiC12iuKinGeFl7uWSSTnO9gECQQDPQ0WMhlaeGPoKSzeIfC5xVgKGEWBlK4yV/Cb7hmbRrdy7WJYNOZFr/Sm3LIfBg/1k0jW5xOSXojP5iubfabB9"
#define AlipayRSA_ALIPAY_PUBLIC @"mobile.securitypay.pay"
//获取服务器端支付数据地址（商户自定义）
#define AlipayBackURL           @"http://112.26.168.118:28080/hsyh1/pay/createAlipay.do"


//////////////////////////微信//////////////////////////////
#define WeChatAppID             @"wx12397e70d9d23a65"
#define WeChatAppSecret         @"898534b96667afbd27deb40419c610f1"
//商户号，填写商户对应参数
#define WeChatMCH_ID                  @"1271047001"
//商户API密钥，填写相应参数
#define WeChatPARTNER_ID              @"15084512587kjhytrvbgdy157403517j"
//支付结果回调页面
#define WeChatNOTIFY_URL              @"http://112.26.168.118:28080/hsyh1/pay/createWeixinPay.do"


#pragma mark - 方法替换等
//////////////////////////方法替换//////////////////////////////
#ifdef DEBUG
#define WPFLOG(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#elif RELEASE
#define WPFLOG(xx, ...)  ((void)0)
#else
#define WPFLOG(xx, ...)  ((void)0)
#endif


#define IMAGE(a)                     [UIImage imageNamed:(a)]


// 防止循环引用
#define WS(weakSelf)      __weak __typeof(&*self)weakSelf = self;



#pragma mark - 字体
//////////////////////////字体//////////////////////////////
#define mySysFont(a)                 [UIFont systemFontOfSize:(a)]
#define myBolFont(a)                 [UIFont boldSystemFontOfSize:(a)]
#define myItaFont(a)                 [UIFont italicSystemFontOfSize:(a)]

#pragma mark - 颜色
//////////////////////////颜色//////////////////////////////

#define RGBIntegerColor(r,g,b,a)     [UIColor colorWithRed:((r)/255.0f) green:((g)/255.0f) blue:((b)/255.0f) alpha:(a)/100.0f]

#define COLOR_WITHIMAGE(a)           [UIColor colorWithPatternImage:[UIImage imageNamed:(a)]]
//
#define COLOR_CLEARCOLOR             [UIColor clearColor]
#define COLOR_WHITECOLOR             [UIColor whiteColor]
#define COLOR_BLACKCOLOR             [UIColor blackColor]
#define COLOR_GRAYCOLOR              [UIColor grayColor]
#define COLOR_LIGHTGRAYCOLOR         [UIColor lightGrayColor]
#define COLOR_REDCOLOR               [UIColor redColor]
#define COLOR_BLUECOLOR              [UIColor blueColor]
#define COLOR_GREENCOLOR             [UIColor greenColor]





#pragma mark - 系统属性
//////////////////////////系统属性//////////////////////////////
#define NAVHEIGHT         64




#endif /* AppUtils_h */
