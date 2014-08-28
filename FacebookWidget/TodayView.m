//
//  TodayView.m
//  FacebookNotifications
//
//  Created by DX169-XL on 2014-08-28.
//  Copyright (c) 2014 Pivotal Labs. All rights reserved.
//

#import "TodayView.h"

@interface TodayView ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation TodayView

#pragma mark - Public Methods

- (void)startLoadingAnimation {
    self.spinner.hidden = NO;
    [self.spinner startAnimating];
}

- (void)stopLoadingAnimation {
    [self.spinner stopAnimating];
}

@end
