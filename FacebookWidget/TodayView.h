//
//  TodayView.h
//  FacebookNotifications
//
//  Created by DX169-XL on 2014-08-28.
//  Copyright (c) 2014 Pivotal Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TodayViewDelegate <NSObject>

@end

@interface TodayView : UIView

@property (nonatomic, weak) id<TodayViewDelegate>delegate;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

- (void)startLoadingAnimation;
- (void)stopLoadingAnimation;

@end
