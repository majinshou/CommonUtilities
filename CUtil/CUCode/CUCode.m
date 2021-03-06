//
//  CUCode.m
//  CUtil
//
//  Created by Acttos on 24/11/2016.
//  Sources https://github.com/acttos/CommonUtilities
//  Copyright © 2016 Acttos.org. All codes follow MIT License.
//

#import "CUCode.h"
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>

#import "CUDefine.h"
#import "CUStorage.h"

@implementation CUCode

+ (NSString *)uniqueIdentifier {
    NSString *result = nil;
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    result = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
    
    if (result == nil || [result isEqualToString:@""]) {
        result = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    
    return result;
}

+ (void)saveInKeychainWithIdentifier:(NSString *)identifier {
    [CUStorage storeInKeychainWithKey:kDefault_Unique_Identifier_Key_In_Keychain data:identifier];
}

+ (NSString *)loadIdentifierFromKeychain {
    return [CUStorage loadFromKeychainWithKey:kDefault_Unique_Identifier_Key_In_Keychain];
}

+ (NSString*) BASE64EncodeWithString:(NSString*)string {
    if(string == nil || [string length] == 0) {
        Logger(@"The parameter 'string' can NOT be empty, return nil.");
        return nil;
    }
    
    NSData* strData = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [strData base64EncodedStringWithOptions:0];
}

+ (NSString*) BASE64DecodeWithString:(NSString*)string {
    if(string == nil || [string length] == 0) {
        Logger(@"The parameter 'string' can NOT be empty, return nil.");
        return nil;
    }
    
    NSData *strData = [[NSData alloc] initWithBase64EncodedString:string options:0];
    NSString *decodedStr = [[NSString alloc] initWithData:strData encoding:NSUTF8StringEncoding];

    return decodedStr;
}

+ (NSString *) MD5CodeWithString:(NSString *)sourceString {
    if (sourceString == nil || sourceString.length == 0) {
        Logger(@"The parameter 'sourceString' can NOT be empty, return nil.");
        return nil;
    }
    
    const char *cStr = [sourceString UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5( cStr, (int)sourceString.length, digest );
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return result;
}

+ (NSString *) MD5CodeWithData:(NSData *) data {
    if(data == nil || data.length == 0) {
        Logger(@"The parameter 'data' can NOT be nil, return nil.");
        return nil;
    }
    
    const char *cStr = (const char*)[data bytes];
    unsigned char digest[16];
    CC_MD5( cStr, (int)data.length, digest ); // This is the MD5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return  output;
}

+ (NSString *) MD5CodeWithFileAtPath:(NSString *) path {
    if (nil == path || path.length == 0) {
        Logger(@"The parameter 'path' can NOT be empty, return nil.");
        return nil;
    }
    
    path = [path hasPrefix:@"file://"] ? [path substringFromIndex:7] : path;
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    if (data) {
        return [CUCode MD5CodeWithData:data];
    } else {
        Logger(@"The file at path:%@ can NOT be found.", path);
        return nil;
    }
}

+ (NSString *) MD5CodeWithFileAtURL:(NSURL *) url {
    if (nil == url) {
        Logger(@"The parameter 'url' can NOT be nil, return nil.");
        return nil;
    }
    
    NSString *path = [url absoluteString];
    url = [path hasPrefix:@"file://"] ? url : [NSURL URLWithString:[NSString stringWithFormat:@"file://%@", path]];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    if (data) {
        return [CUCode MD5CodeWithData:data];
    } else {
        Logger(@"The file at url:%@ can NOT be found.", path);
        return nil;
    }
}

+ (NSString *) SHA1CodeWithString:(NSString *)sourceString {
    if (sourceString == nil || sourceString.length == 0) {
        Logger(@"The parameter 'sourceString' can NOT be empty, return nil.");
        return nil;
    }
    
    const char *cStr = [sourceString UTF8String];
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1( cStr, (int)sourceString.length, digest );
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return result;
}

+ (NSString*) SHA1CodeWithData:(NSData*)data {
    if(data == nil || data.length == 0) {
        Logger(@"The parameter 'data' can NOT be nil, return nil.");
        return nil;
    }
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (int)data.length, digest);// This is the SHA1 call
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

+ (NSString *) SHA1CodeWithFileAtPath:(NSString *) path {
    if (nil == path || path.length == 0) {
        Logger(@"The parameter 'path' can NOT be empty, return nil.");
        return nil;
    }
    
    path = [path hasPrefix:@"file://"] ? [path substringFromIndex:7] : path;
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    if (data) {
        return [CUCode SHA1CodeWithData:data];
    } else {
        Logger(@"The file at path:%@ can NOT be found.", path);
        return nil;
    }
}

+ (NSString *) SHA1CodeWithFileAtURL:(NSURL *) url {
    if (nil == url) {
        Logger(@"The parameter 'url' can NOT be nil, return nil.");
        return nil;
    }
    
    NSString *path = [url absoluteString];
    url = [path hasPrefix:@"file://"] ? url : [NSURL URLWithString:[NSString stringWithFormat:@"file://%@", path]];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    if (data) {
        return [CUCode SHA1CodeWithData:data];
    } else {
        Logger(@"The file at url:%@ can NOT be found.", path);
        return nil;
    }
}

@end
