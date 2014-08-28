//
//  CustomSessionTokenCachingStrategy.h
//  FacebookNotifications
//
//  Created by DX169-XL on 2014-08-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import <FacebookSDK/FacebookSDK.h>

@class FBAccessTokenData;

@interface CustomSessionTokenCachingStrategy : FBSessionTokenCachingStrategy

- (FBAccessTokenData *)currentAccessTokenData;

@end
