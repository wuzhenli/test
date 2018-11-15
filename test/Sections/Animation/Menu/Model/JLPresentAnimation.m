//
//  JLPresentAnimation.m
//  test
//
//  Created by li’s Air on 2018/4/15.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "JLPresentAnimation.h"

@implementation JLPresentAnimation

// This is used for percent driven interactive transitions, as well as for
// container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return [transitionContext isAnimated] ? 0.25 : 0;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    BOOL isPresent = fromViewController.presentedViewController == toViewController;
    [containerView addSubview:toView];
    
    CGRect toInitialFrame = [transitionContext initialFrameForViewController:toViewController];
    CGRect toFinalFrame = [transitionContext finalFrameForViewController:toViewController];
    
    CGRect fromFinalFrame = fromView.frame;
    
    if (isPresent) {
        toInitialFrame.origin.x = CGRectGetMinX(containerView.frame);
        toInitialFrame.origin.y = CGRectGetMaxY(containerView.frame);
        toInitialFrame.size = toFinalFrame.size;
        toView.frame = toInitialFrame;
    } else {
        fromFinalFrame = CGRectOffset(fromView.frame, 0, fromFinalFrame.size.height);
    }
    NSTimeInterval time = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:time animations:^{
        if (isPresent) {
            toView.frame = toFinalFrame;
        } else
            fromView.frame = fromFinalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition: !transitionContext.transitionWasCancelled];
    }];
}
@end














