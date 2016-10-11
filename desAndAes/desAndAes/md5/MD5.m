//
//  MD5.m
//  base64
//
//  Created by 刘松洪 on 16/10/10.
//  Copyright © 2016年 刘松洪. All rights reserved.
//

#import "MD5.h"
#import <CommonCrypto/CommonHMAC.h>
@implementation MD5

+ (NSString *)md5Encrypt:(NSString *)str {
    
    const char *cStr = [str UTF8String];

    unsigned char result[16];
    
    CC_MD5(cStr,(unsigned int)strlen(cStr),result);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for (int i = 0 ; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x",result[i]];
    }
    return output;
}

@end
