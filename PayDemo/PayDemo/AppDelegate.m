//
//  AppDelegate.m
//  PayDemo
//
//  Created by 周鹏翔 on 16/7/25.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "AlipayHelper.h"
#import <AlipaySDK/AlipaySDK.h>
#import "AppMethod.h"
#import "WXApi.h"
#import "WXApiManager.h"
#import "UPPaymentControl.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //初始化微信sdk
    [self configWeixin];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    ViewController * MainViewController=[[ViewController alloc]init];
    self.window.rootViewController=MainViewController;
    
    return YES;
}
-(void)configWeixin{
    
    [WXApi registerApp:@"wx12397e70d9d23a65" withDescription:@"weixin"];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return  [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    
    //    //创建一个消息对象
//    [[NSNotificationCenter defaultCenter] postNotificationOnMainThreadWithName:@"payBack" object:nil userInfo:@{@"1":@"123"} waitUntilDone:YES];
    
    
    
    //如果极简开发包不可用，会跳转支付宝钱包进行支付，需要将支付宝钱包的支付结果回传给开发包
    if ([url.host isEqualToString:@"safepay"]) {
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,就是在这个方法里面处理跟callback一样的逻辑】
            NSString *message = @"";
            switch([[resultDic objectForKey:@"resultStatus"] integerValue])
            {
                case 9000:message = @"订单支付成功";break;
                case 8000:message = @"正在处理中";break;
                case 4000:message = @"订单支付失败";break;
                case 6001:message = @"用户中途取消";break;
                case 6002:message = @"网络连接错误";break;
                default:message = @"未知错误";
            }
            
            UIAlertController *aalert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
            [aalert addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil]];
            UIViewController *root = self.window.rootViewController;
            [root presentViewController:aalert animated:YES completion:nil];
            
            NSLog(@"result = %@",resultDic);
        }];
    }else if([url.host isEqualToString:@"uppayresult"]){
        
        [[UPPaymentControl defaultControl] handlePaymentResult:url completeBlock:^(NSString *code, NSDictionary *data) {
            
            
            //结果code为成功时，先校验签名，校验成功后做后续处理
            if([code isEqualToString:@"success"]) {
                
                //判断签名数据是否存在
                if(data == nil){
                    //如果没有签名数据，建议商户app后台查询交易结果
                    return;
                }
                
                //数据从NSDictionary转换为NSString
                NSData *signData = [NSJSONSerialization dataWithJSONObject:data
                                                                   options:0
                                                                     error:nil];
                NSString *sign = [[NSString alloc] initWithData:signData encoding:NSUTF8StringEncoding];
                
                
                
                //验签证书同后台验签证书
                //此处的verify，商户需送去商户后台做验签
                if([self verify:sign]) {
                    //支付成功且验签成功，展示支付成功提示
                    
                    NSLog(@"支付成功");
                    
                }
                else {
                    //验签失败，交易结果数据被篡改，商户app后台查询交易结果

                    NSLog(@"支付失败");
                }
            }
            else if([code isEqualToString:@"fail"]) {
                //交易失败
            }
            else if([code isEqualToString:@"cancel"]) {
                //交易取消
            }
        }];
        
    }else{
        
        return [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
    }
    
    
    
    
    
    return YES;
}

//银联验签
-(BOOL) verify:(NSString *) resultStr {
    
    
    NSData *postData = [resultStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString * httpUrl=[NSString stringWithFormat:@"%@%@",@"192.168.1.1",@"/hsyh1/callback/checkFrontSign.do"];
    NSURL *url = [NSURL URLWithString:httpUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)postData.length] forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSError *error = nil;
    NSHTTPURLResponse *response = nil;
    NSData *retData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    
    NSString *isverfy = [[NSString alloc] initWithData:retData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",isverfy);
    if (error)
    {
        //error
        return NO;
    }
    else
    {
        //no error
        return YES;
    }
    
    //验签证书同后台验签证书
    //此处的verify，商户需送去商户后台做验签
    //    return NO;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
