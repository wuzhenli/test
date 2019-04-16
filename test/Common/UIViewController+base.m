//
//  UIViewController+base.m
//  test
//
//  Created by li’Pro on 2019/4/16.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "UIViewController+base.h"
#import <objc/runtime.h>


static char keyPushTransitioning;

@implementation UIViewController (base)

- (id<UIViewControllerAnimatedTransitioning>)bs_pushTransitioning {
    return objc_getAssociatedObject(self, &keyPushTransitioning);
}

- (void)setBs_pushTransitioning:(id<UIViewControllerAnimatedTransitioning>)bs_pushTransitioning {
    objc_setAssociatedObject(self, &keyPushTransitioning, bs_pushTransitioning, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
