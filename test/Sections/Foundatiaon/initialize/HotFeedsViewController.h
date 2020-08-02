//
//  HotFeedsViewController.h
//  test
//
//  Created by li’Pro on 2020/8/2.
//  Copyright © 2020 wzl. All rights reserved.
//

#import "FeedsBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HotFeedsViewController : FeedsBaseViewController

- (instancetype)initWithCommunityId:(NSString *)communityId NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithPageType:(FeedsPageType)pageType NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
