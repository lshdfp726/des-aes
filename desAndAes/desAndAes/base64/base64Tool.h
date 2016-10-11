//
//  base64Tool.h
//  base64
//
//  Created by 刘松洪 on 16/10/10.
//  Copyright © 2016年 刘松洪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface base64Tool : NSObject

+ (NSString *)base64EncodingWithData:(NSData *)sourceData;//加密


+ (id)base64DecyptionWithData:(NSString *)destionString; //解密
@end
