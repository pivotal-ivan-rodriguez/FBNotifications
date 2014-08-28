//
//  FBUserObject.m
//  FacebookNotifications
//
//  Created by DX169-XL on 2014-08-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import "FBUserObject.h"

@implementation FBUserObject

+ (instancetype)userObjectFromData:(NSDictionary *)data {
    FBUserObject *user = [FBUserObject new];
    user.objectID = data[@"id"];
    user.name = data[@"name"];
    return user;
}

@end
