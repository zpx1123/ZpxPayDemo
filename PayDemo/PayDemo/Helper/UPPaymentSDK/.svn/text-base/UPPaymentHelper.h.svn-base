//
//  UPPaymentHelper.h
//  MicroBusinessBank
//
//  Created by 周鹏翔 on 16/5/31.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^UPPayResult)(NSDictionary *result);

@interface UPPaymentHelper : NSObject

@property (nonatomic, strong) NSMutableData        *responseData;
@property (nonatomic, strong) id        view_controller;
+ (UPPaymentHelper *)shared;

- (void)UPPay:(id )product viewContorller:(id )VC block:(UPPayResult)block;

@end
