//
//  DesAndAes.h
//  desAndAes
//
//  Created by 刘松洪 on 16/10/10.
//  Copyright © 2016年 刘松洪. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,DesAndAesType){
    Encrypt, //加密
    Decrypt, //解密
};

@interface DesAndAes : NSObject

+ (NSString *)encrypt:(NSString *)sourceStr encryptOrDecrypt:(DesAndAesType)type key:(NSString *)key;

@end
