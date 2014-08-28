//
//  FBNotificationObject.h
//  FacebookNotifications
//
//  Created by DX169-XL on 2014-08-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FBUserObject;

@interface FBNotificationObject : NSObject

@property (nonatomic, strong) NSString *objectID;
@property (nonatomic, strong) NSDictionary *application;
@property (nonatomic, strong) FBUserObject *from;
@property (nonatomic, strong) FBUserObject *to;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, assign) BOOL read;

+ (instancetype)notificationObjectFromData:(NSDictionary *)data;

@end
