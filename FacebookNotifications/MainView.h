//
//  MainView.h
//  FacebookNotifications
//
//  Created by DX169-XL on 2014-08-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainViewDelegate <NSObject>

@end

@interface MainView : UIView

@property (nonatomic, weak) id<MainViewDelegate>delegate;

- (void)configureFacebookButton;

@end
