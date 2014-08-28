//
//  NotificationCollectionViewCell.m
//  FacebookNotifications
//
//  Created by DX169-XL on 2014-08-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import "NotificationCollectionViewCell.h"
#import "FBNotificationObject.h"
#import "FBUserObject.h"

@interface NotificationCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (weak, nonatomic) IBOutlet UILabel *toLabel;

@end

@implementation NotificationCollectionViewCell

- (void)configureForNotification:(FBNotificationObject *)notification {
    self.titleLabel.text = notification.title;
    self.fromLabel.text = notification.from.name;
    self.toLabel.text = notification.to.name;
}

@end
