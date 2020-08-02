//
//  FeedsBaseViewController.h
//  test
//
//  Created by li’Pro on 2020/8/2.
//  Copyright © 2020 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FeedsPageType) {
    FeedsPageTypeCircle = 0,
    FeedsPageTypeHot    = 1
};

@interface FeedsBaseViewController : UIViewController

- (instancetype)initWithPageType:(FeedsPageType)pageType NS_DESIGNATED_INITIALIZER;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil
                         bundle:(nullable NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
- (nullable instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
