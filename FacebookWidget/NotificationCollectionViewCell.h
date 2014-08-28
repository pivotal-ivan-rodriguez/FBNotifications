//
//  NotificationCollectionViewCell.h
//  FacebookNotifications
//
//  Created by DX169-XL on 2014-08-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FBNotificationObject;

@interface NotificationCollectionViewCell : UICollectionViewCell

- (void)configureForNotification:(FBNotificationObject *)notification;

@end
