//
//  FeedsBaseViewController.m
//  test
//
//  Created by li’Pro on 2020/8/2.
//  Copyright © 2020 wzl. All rights reserved.
//

#import "FeedsBaseViewController.h"

@interface FeedsBaseViewController ()

@property (assign, nonatomic, readonly) FeedsPageType pageType;

@end

@implementation FeedsBaseViewController

- (instancetype)initWithPageType:(FeedsPageType)pageType {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _pageType = pageType;
    }
    return self;
}


@end
