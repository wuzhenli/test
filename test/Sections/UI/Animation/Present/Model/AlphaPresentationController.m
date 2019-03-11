//
//  AlphaPresentationController.m
//  test
//
//  Created by li’s Air on 2018/11/15.
//  Copyright © 2018 wzl. All rights reserved.
//  https://juejin.im/post/5a9651d25188257a5911f666

#import "AlphaPresentationController.h"

@interface AlphaPresentationController ()

@property (strong, nonatomic) UIView *blackView;

@end


@implementation AlphaPresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController {
    
    if (self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController]) {
        presentedViewController.modalPresentationStyle = UIModalPresentationCustom;
//        self.frameOfPresentedViewInContainerView
    }
    return self;
}

#pragma -mark override

- (void)presentationTransitionWillBegin {
    self.blackView.alpha = 0;
    [self.containerView addSubview:self.blackView];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.blackView.alpha = 1;
    }];
}

- (void)dismissalTransitionWillBegin {
    [UIView animateWithDuration:0.5 animations:^{
        self.blackView.alpha = 0;
    }];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed {
    if (completed) {
        [self.blackView removeFromSuperview];
    }
}

- (CGRect)frameOfPresentedViewInContainerView {
    CGSize scSize = [UIScreen mainScreen].bounds.size;
    CGFloat h = 200;
    return CGRectMake(0, scSize.height - h, scSize.width, h);
}

//override var frameOfPresentedViewInContainerView: CGRect {
//    return CGRect(x: 0, y: UIScreen.main.bounds.height-controllerHeight, width: UIScreen.main.bounds.width, height: controllerHeight)
//}

#pragma -mark getter

- (UIView *)blackView {
    if (!_blackView) {
        _blackView = [[UIView alloc] init];
        _blackView.frame = self.containerView.bounds;
        _blackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
    return _blackView;
}



@end
