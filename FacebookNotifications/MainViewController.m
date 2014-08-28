//
//  ViewController.m
//  FacebookNotifications
//
//  Created by DX169-XL on 2014-08-28.
//  Copyright (c) 2014 Pivotal Labs. All rights reserved.
//

#import "MainViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface MainViewController () <MainViewDelegate>

@end

@implementation MainViewController

#pragma mark - Lifecycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.delegate = self;
    [self.view configureFacebookButton];
}

#pragma mark - MainViewDelegate Methods


@end
