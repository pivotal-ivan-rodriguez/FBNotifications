//
//  CustomSessionTokenCachingStrategy.m
//  FacebookNotifications
//
//  Created by DX169-XL on 2014-08-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import "CustomSessionTokenCachingStrategy.h"

static NSString * const kFBAccessTokenKey = @"FBAccessTokenInformationKeyData";

@interface CustomSessionTokenCachingStrategy ()

@end

@implementation CustomSessionTokenCachingStrategy

#pragma mark - Helper Methods

- (void)writeData:(NSDictionary *)data {
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.io.pivotal.FacebookNotifications"];
    [sharedDefaults setObject:data forKey:kFBAccessTokenKey];
    [sharedDefaults synchronize];
}

- (NSDictionary *)readData {
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.io.pivotal.FacebookNotifications"];
    return [sharedDefaults objectForKey:kFBAccessTokenKey];
}

- (void)cacheFBAccessTokenData:(FBAccessTokenData *)accessToken {
    NSDictionary *tokenInformation = [accessToken dictionary];
    [self writeData:tokenInformation];
}

#pragma mark - FBSessionTokenCachingStrategy Methods

- (FBAccessTokenData *)fetchFBAccessTokenData {
    NSDictionary *tokenInformation = [self readData];
    if (nil == tokenInformation) {
        return nil;
    } else {
        return [FBAccessTokenData createTokenFromDictionary:tokenInformation];
    }
}

- (void)clearToken {
    [self writeData:[NSDictionary dictionaryWithObjectsAndKeys:nil]];
}

#pragma mark - Public Methods

- (FBAccessTokenData *)currentAccessTokenData {
    return [self fetchFBAccessTokenData];
}

@end
