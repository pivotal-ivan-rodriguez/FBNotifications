//
//  MainView.m
//  FacebookNotifications
//
//  Created by DX169-XL on 2014-08-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import "MainView.h"
#import <FacebookSDK/FacebookSDK.h>

@interface MainView () <FBLoginViewDelegate>

@end

@implementation MainView

#pragma mark - Public Methods

- (void)configureFacebookButton {
    FBLoginView *loginView = [[FBLoginView alloc] initWithReadPermissions:@[@"public_profile", @"email", @"user_friends",@"manage_notifications"]];
    loginView.delegate = self;
    loginView.defaultAudience = FBSessionDefaultAudienceEveryone;
    CGRect frame = CGRectMake(self.center.x - (CGRectGetWidth(loginView.frame)/ 2), self.center.y - (CGRectGetHeight(loginView.frame)/2),CGRectGetWidth(loginView.frame),CGRectGetHeight(loginView.frame));
    loginView.frame = frame;
    [self addSubview:loginView];
}

#pragma mark - FBLoginViewDelegate Methods

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user {
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    FBSession *session = [FBSession activeSession];

    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.io.pivotal.FacebookNotifications"];
    NSString *facebookTokenKey = @"FBAccessTokenInformationKeyData";
    [sharedDefaults setObject:[session.accessTokenData dictionary] forKey:facebookTokenKey];
    [sharedDefaults synchronize];
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {

}

- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    NSString *alertMessage, *alertTitle;

    if ([FBErrorUtility shouldNotifyUserForError:error]) {
        alertTitle = @"Facebook error";
        alertMessage = [FBErrorUtility userMessageForError:error];

    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession) {
        alertTitle = @"Session Error";
        alertMessage = @"Your current session is no longer valid. Please log in again.";

    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
        NSLog(@"user cancelled login");

    } else {
        alertTitle  = @"Something went wrong";
        alertMessage = @"Please try again later.";
        NSLog(@"Unexpected error:%@", error);
    }

    if (alertMessage) {

    }
}

@end
