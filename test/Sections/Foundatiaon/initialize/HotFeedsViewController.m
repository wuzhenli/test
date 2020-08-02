//
//  HotFeedsViewController.m
//  test
//
//  Created by li’Pro on 2020/8/2.
//  Copyright © 2020 wzl. All rights reserved.
//

#import "HotFeedsViewController.h"

@interface HotFeedsViewController ()

@property (copy, nonatomic, readonly) NSString *communityId;

@end

@implementation HotFeedsViewController

- (instancetype)initWithCommunityId:(NSString *)communityId {
    if (self = [super initWithPageType:FeedsPageTypeHot]) {
        _communityId = communityId.copy;
    }
    return self;
}

@end
