//
//  AppMethod.m
//  PNeayBy
//
//  Created by wpf on 15/11/15.
//  Copyright © 2015年 wpf. All rights reserved.
//

#import "AppMethod.h"
#include <ifaddrs.h>
#include <arpa/inet.h>
#import <CommonCrypto/CommonDigest.h>
#import "AppUtils.h"
@implementation AppMethod

+ (AppMethod *)shared
{
    static AppMethod *_share;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _share = [[AppMethod alloc]init];
    });
    return _share;
}

+ (NSString *)getRandomString
{
    NSString *str = [NSString stringWithFormat:@"%s",genRandomString(32)];
    return str;
}

char* genRandomString(int length)
{
    int flag, i;
    char* string;
    srand((unsigned) time(NULL ));
    if ((string = (char*) malloc(length)) == NULL )
    {
        //NSLog(@"Malloc failed!flag:14\n");
        return NULL ;
    }
    
    for (i = 0; i < length - 1; i++)
    {
        flag = rand() % 3;
        switch (flag)
        {
            case 0:
                string[i] = 'A' + rand() % 26;
                break;
            case 1:
                string[i] = 'a' + rand() % 26;
                break;
            case 2:
                string[i] = '0' + rand() % 10;
                break;
            default:
                string[i] = 'x';
                break;
        }
    }
    string[length - 1] = '\0';
    return string;
}



+ (NSMutableDictionary *)partnerSignOrder:(NSDictionary*)paramDic partnerId:(NSString *)partner_Id
{
    NSArray *keyArray = [paramDic allKeys];
    // 对字段进行字母序排序
    NSMutableArray *sortedKeyArray = [NSMutableArray arrayWithArray:keyArray];
    [sortedKeyArray sortUsingComparator:^NSComparisonResult(NSString* key1, NSString* key2) {
        return [key1 compare:key2];
    }];
    
    NSMutableString *paramString = [NSMutableString stringWithString:@""];
    // 拼接成 A=B&X=Y
    for (NSString *key in sortedKeyArray)
    {
        if ([paramDic[key] length] != 0)
        {
            [paramString appendFormat:@"&%@=%@", key, paramDic[key]];
        }
    }
    
    if ([paramString length] > 1)
    {
        [paramString deleteCharactersInRange:NSMakeRange(0, 1)];    // remove first '&'
    }
    
    [paramString appendFormat:@"&key=%@", partner_Id];
    NSString *signString = [[AppMethod signString:paramString] uppercaseString];
    
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:paramDic];
    [dict setObject:signString forKey:@"sign"];
    return dict;
}


+ (NSString *)signString:(NSString*)origString
{
    const char *original_str = [origString UTF8String];
    unsigned char result[32];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);//调用md5
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++){
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}



@end
