//
//  DesAndAes.m
//  desAndAes
//
//  Created by 刘松洪 on 16/10/10.
//  Copyright © 2016年 刘松洪. All rights reserved.
//

#import "DesAndAes.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import "base64Tool.h"
static const NSString *ivString = @"abcdefg";//偏移向量（需与服务器端约定好）

@implementation DesAndAes
+ (NSString *)encrypt:(NSString *)sourceStr encryptOrDecrypt:(DesAndAesType)type key:(NSString *)key {

    const void *dataIn;
    size_t dataInLenght;
    
    unsigned char buffer[1024];
    
    size_t outMoved = 0;
    memset(buffer, 0, sizeof(unsigned char));
    
    if (type == Encrypt) {
        NSData *encryptData = [sourceStr dataUsingEncoding:NSUTF8StringEncoding];
        dataInLenght = [encryptData length];
        dataIn       = (const void *)[encryptData bytes];
    }else {//base64 解码一下，变成des加密之后的data
        NSData *decryptData = [[NSData alloc]initWithBase64EncodedString:sourceStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
        dataInLenght = [decryptData length];
        dataIn       = (const void *)[decryptData bytes];
    }
    
    CCCryptorStatus status = kCCSuccess;
    NSMutableData *keyData, *ivData;
    
    keyData = [[key dataUsingEncoding:NSUTF8StringEncoding] mutableCopy];//深拷贝
    ivData  = [[ivString dataUsingEncoding:NSUTF8StringEncoding] mutableCopy];
    
    //设置统一长度（des 需要8个字节）
    [keyData setLength:8];
    [ivData setLength:8];
    
    /*
       dataOutMoved 最后一个参数，操作成功，则返回一个buffer的字节数大小到dataOutMoved里面。
     */
    
    status = CCCrypt(type, kCCAlgorithmDES, kCCOptionPKCS7Padding, [keyData bytes], [keyData length], [ivData bytes], dataIn, dataInLenght, buffer, sizeof(buffer), &outMoved);
    
    if (status == kCCSuccess) {
        if (type == Encrypt) {
            NSData *destData = [NSData dataWithBytes:buffer length:(NSUInteger)outMoved];
            NSString *result = [base64Tool base64EncodingWithData:destData];//base64 加密之后显示的字符串密文
            return result;
        }else if (type == Decrypt){
            NSData *destData = [NSData dataWithBytes:buffer length:(NSUInteger)outMoved];
            NSString *result = [[NSString alloc] initWithData:destData encoding:NSUTF8StringEncoding];
            return result;
        }
    }else {
        NSLog(@"加密失败===%d",status);
    }
    


    
    return  nil;
}

@end
