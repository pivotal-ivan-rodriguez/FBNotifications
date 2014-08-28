//
//  FBNotificationObject.m
//  FacebookNotifications
//
//  Created by DX169-XL on 2014-08-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import "FBNotificationObject.h"
#import "FBUserObject.h"

@implementation FBNotificationObject

#pragma mark - Public Methods

+ (instancetype)notificationObjectFromData:(NSDictionary *)data {
    FBNotificationObject *notification = [FBNotificationObject new];
    notification.objectID = data[@"id"];
    notification.application = data[@"application"];
    notification.from = [FBUserObject userObjectFromData:data[@"from"]];
    notification.to = [FBUserObject userObjectFromData:data[@"to"]];
    notification.link = data[@"link"];
    notification.title = data[@"title"];
    notification.date = data[@"updated_time"];
    notification.read = [data[@"unread"] boolValue];
    return notification;
}

@end
