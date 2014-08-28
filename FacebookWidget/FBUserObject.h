//
//  FBUserObject.h
//  FacebookNotifications
//
//  Created by DX169-XL on 2014-08-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBUserObject : NSObject

@property (nonatomic, strong) NSNumber *objectID;
@property (nonatomic, strong) NSString *name;

+ (instancetype)userObjectFromData:(NSDictionary *)data;

@end
