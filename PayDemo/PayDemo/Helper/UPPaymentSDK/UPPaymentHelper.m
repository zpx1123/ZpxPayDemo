//
//  UPPaymentHelper.m
//  MicroBusinessBank
//
//  Created by 周鹏翔 on 16/5/31.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//
#define kURL_TN_Normal                @"http://101.231.204.84:8091/sim/getacptn"
#define UPPAY_BACKCALL                @"http://112.26.168.118:28080/hsyh1/callback/unionpay.do"


#define kVCTitle          @"商户测试"
#define kBtnFirstTitle    @"获取订单，开始测试"
#define kWaiting          @"正在获取TN,请稍后..."
#define kNote             @"提示"
#define kConfirm          @"确定"
#define kErrorNet         @"网络错误"
#define kResult           @"支付结果：%@"
#import "UPPaymentHelper.h"

#import <UIKit/UIKit.h>
#import "UPPaymentControl.h"

@interface UPPaymentHelper(){
    
    UIAlertView* _alertView;
}

@end

@implementation UPPaymentHelper
+ (UPPaymentHelper *)shared
{
    static UPPaymentHelper *_UPPaypay;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _UPPaypay = [[UPPaymentHelper alloc]init];
    });
    return _UPPaypay;
}

- (void)UPPay:(NSString *)tn viewContorller:(id )VC block:(UPPayResult)block{
    _view_controller=VC;
    
    //    测试
        [self startNetWithURL:[NSURL URLWithString:kURL_TN_Normal]];
   
    
//    正式
    
    
//    [[UPPaymentControl defaultControl] startPay:tn fromScheme:@"UPPay" mode:@"00" viewController:_view_controller];
    

   
}

- (void)startNetWithURL:(NSURL *)url
{
    NSURLRequest * urlRequest=[NSURLRequest requestWithURL:url];
    NSURLConnection* urlConn = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    [urlConn start];
}


#pragma mark - connection

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse*)response
{
    NSHTTPURLResponse* rsp = (NSHTTPURLResponse*)response;
    NSInteger code = [rsp statusCode];
    if (code != 200)
    {
        
        [connection cancel];
    }
    else
    {
        _responseData = [[NSMutableData alloc] init];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //    [_responseData appendData:data];
    _responseData = [data copy];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    //交易流水号，商户后台向银联后台提交订单信息后，由银联后台生成并下发给商户后台的交易凭证
    NSString* tn = [[NSMutableString alloc] initWithData:_responseData encoding:NSUTF8StringEncoding];
    if (tn != nil && tn.length > 0)
    {
        [[UPPaymentControl defaultControl] startPay:tn fromScheme:@"UPPay" mode:@"01" viewController:_view_controller];
        
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@",error);
    
    [self showAlertMessage:error.localizedDescription];
    
    
}

#pragma mark UPPayPluginResult
- (void)UPPayPluginResult:(NSString *)result
{
    //    NSString* msg = [NSString stringWithFormat:kResult, result];
    NSString* msg = [NSString stringWithFormat:kResult, result];
    [self showAlertMessage:msg];
}
- (void)showAlertMessage:(NSString*)msg
{
    [self hideAlert];
    _alertView = [[UIAlertView alloc] initWithTitle:kNote message:msg delegate:self cancelButtonTitle:kConfirm otherButtonTitles:nil, nil];
    
}

- (void)hideAlert
{
    if (_alertView != nil)
    {
        [_alertView dismissWithClickedButtonIndex:0 animated:NO];
        _alertView = nil;
    }
}
@end
