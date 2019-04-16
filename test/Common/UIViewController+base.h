//
//  UIViewController+base.h
//  test
//
//  Created by li’Pro on 2019/4/16.
//  Copyright © 2019 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (base)

@property (strong, nonatomic) id<UIViewControllerAnimatedTransitioning> bs_pushTransitioning;

@end

NS_ASSUME_NONNULL_END
