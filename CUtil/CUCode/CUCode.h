//
//  CUCode.h
//  CommonUtilities
//
//  Created by Acttos on 24/11/2016.
//  Copyright © 2016 Acttos.org. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDefault_Unique_Identifier_Key_In_Keychain @"kDefault_Unique_Identifier_Key_In_Keychain"

@interface CUCode : NSObject

/**
 生成一个全球唯一的Id ^_-，可结合

 @return 全球唯一的编号
 */
+ (NSString *)uniqueIdentifier;


/**
 采用Keychain来保存唯一ID,如果之前有保存过，则覆盖旧值

 @param identifier 用来保存的唯一ID
 @warning 跟Keychain相关的读写操作，仅在真机上验证通过
 */
+ (void)saveInKeychainWithIdentifier:(NSString *)identifier;


/**
 从Keychain中加载保存的唯一ID

 @return Key中保存的唯一ID，如果之前未保存过，返回nil
 @warning 跟Keychain相关的读写操作，仅在真机上验证通过
 */
+ (NSString *)loadIdentifierFromKeychain;

/**
 将给定的字符串进行BASE64编码

 @param string 源字符串
 @return 经过BASE64编码后的字符串
 */
+ (NSString*) BASE64EncodeWithString:(NSString*)string;

/**
 将给定的字符串进行BASE64解码

 @param string 源字符串
 @return 经过BASE64解码后的字符串
 */
+ (NSString*) BASE64DecodeWithString:(NSString*)string;

/**
 将给定的字符串进行MD5摘要
 
 @param sourceString 源字符串
 @return 进行了MD5摘要后的字符串
 */
+ (NSString *) MD5CodeWithString:(NSString *)sourceString;

/**
 将给定的NSData实例进行MD5摘要
 
 @param data 给定的NSData实例
 @return 进行了MD5摘要后的字符串
 */
+ (NSString *) MD5CodeWithData:(NSData *) data;

/**
 根据给定的path对应的文件进行MD5摘要

 @param path 文件的path
 @return 文件的MD5摘要
 */
+ (NSString *) MD5CodeWithFileAtPath:(NSString *) path;

/**
 根据给定的url对应的文件进行MD5摘要
 
 @param url 文件的url
 @return 文件的MD5摘要
 */
+ (NSString *) MD5CodeWithFileAtURL:(NSURL *) url;

/**
 将给定的字符串进行SHA1摘要

 @param sourceString 源字符串
 @return 进行了SHA1摘要后的字符串
 */
+ (NSString *) SHA1CodeWithString:(NSString *)sourceString;

/**
 将给定的NSData实例进行SHA1摘要
 
 @param data 给定的NSData实例
 @return 进行了SHA1摘要后的字符串
 */
+ (NSString*) SHA1CodeWithData:(NSData*)data;

/**
 根据给定的path对应的文件进行SHA1摘要
 
 @param path 文件的path
 @return 文件的SHA1摘要
 */
+ (NSString *) SHA1CodeWithFileAtPath:(NSString *) path;

/**
 根据给定的url对应的文件进行SHA1摘要
 
 @param url 文件的url
 @return 文件的SHA1摘要
 */
+ (NSString *) SHA1CodeWithFileAtURL:(NSURL *) url;

@end