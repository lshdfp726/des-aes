//
//  base64Tool.m
//  base64
//
//  Created by 刘松洪 on 16/10/10.
//  Copyright © 2016年 刘松洪. All rights reserved.
//

#import "base64Tool.h"

@implementation base64Tool

+ (NSString *)base64EncodingWithData:(NSData *)sourceData {
 
    if (!sourceData) {
        return  nil;
    }
    
    NSString *resultString = [sourceData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return resultString;
}


+ (id)base64DecyptionWithData:(NSString *)destionString {
    if (!destionString) {
        return  nil;
    }
    
    id resultData = [[NSData alloc]initWithBase64EncodedString:destionString options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    return resultData;
}


@end
