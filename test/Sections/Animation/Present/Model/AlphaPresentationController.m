//
//  AlphaPresentationController.m
//  test
//
//  Created by li’s Air on 2018/11/15.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "AlphaPresentationController.h"

@implementation AlphaPresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController {
    
    if (self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController]) {
        presentedViewController.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

@end
