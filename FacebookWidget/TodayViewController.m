//
//  TodayViewController.m
//  FacebookWidget
//
//  Created by DX169-XL on 2014-08-28.
//  Copyright (c) 2014 Pivotal Labs. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import <FacebookSDK/FacebookSDK.h>

#import "CustomSessionTokenCachingStrategy.h"
#import "FBNotificationObject.h"
#import "NotificationCollectionViewCell.h"

static NSUInteger const kMaxNumberOfNotifications = 5;

@interface TodayViewController () <TodayViewDelegate, NCWidgetProviding, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) CustomSessionTokenCachingStrategy *tokenCaching;
@property (nonatomic, strong) NSArray *notifications;

@end

@implementation TodayViewController

#pragma mark - Getters

- (CustomSessionTokenCachingStrategy *)tokenCaching {
    if (!_tokenCaching) {
        _tokenCaching = [CustomSessionTokenCachingStrategy new];
    }
    return _tokenCaching;
}

#pragma mark - Lifecycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.delegate = self;
    self.preferredContentSize = CGSizeMake(320.0f, 240.0f);

    self.view.collectionView.dataSource = self;
    self.view.collectionView.delegate = self;
    NSString *cellIdentifier = NSStringFromClass([NotificationCollectionViewCell class]);
    [self.view.collectionView registerNib:[UINib nibWithNibName:cellIdentifier bundle:nil] forCellWithReuseIdentifier:cellIdentifier];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    [self.view startLoadingAnimation];

    FBSession *session = [[FBSession alloc] initWithAppID:nil permissions:@[@"public_profile", @"email", @"user_friends",@"manage_notifications"] urlSchemeSuffix:nil tokenCacheStrategy:self.tokenCaching];
    if (session.state == FBSessionStateCreatedTokenLoaded) {
        [FBSession setActiveSession:session];

        if (!session.isOpen) {
            [session openWithCompletionHandler:^(FBSession *session, FBSessionState status, NSError *error) {}];
        }

        [FBRequestConnection startWithGraphPath:@"me/notifications?include_read=1" completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
            if (!error) {
                NSMutableArray *array = [NSMutableArray new];
                for (NSDictionary *data in result[@"data"]) {
                    [array addObject:[FBNotificationObject notificationObjectFromData:data]];
                }
                self.notifications = array;
                [self.view.collectionView reloadData];
                completionHandler(NCUpdateResultNewData);
            } else {
                completionHandler(NCUpdateResultFailed);
            }
            [self.view stopLoadingAnimation];
        }];

    } else {
        [self.view stopLoadingAnimation];
    }

    //NCUpdateResultFailed | NCUpdateResultNoData | NCUpdateResultNewData
}

#pragma mark - TodayViewDelegate Methods

#pragma mark - NCWidgetProviding Methods

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    return UIEdgeInsetsZero;
}

#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return MIN(self.notifications.count,kMaxNumberOfNotifications);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = NSStringFromClass([NotificationCollectionViewCell class]);
    NotificationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell configureForNotification:self.notifications[indexPath.item]];
    return cell;
}

#pragma mark - UICollectionViewDelegate Methods

@end
