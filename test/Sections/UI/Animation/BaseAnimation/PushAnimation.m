//
//  PushAnimation.m
//  test
//
//  Created by li’Pro on 2019/4/16.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "PushAnimation.h"

@implementation PushAnimation


// This is used for percent driven interactive transitions, as well as for
// container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return [transitionContext isAnimated] ? 0.35 : 0;
}

// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    BOOL isPresent = [toViewController.navigationController.viewControllers containsObject:fromViewController];
    
    [containerView addSubview:toView];
    
    /*
     push
     (lldb) po toInitialFrame
     (origin = (x = 0, y = 0), size = (width = 0, height = 0))
     
     (lldb) po toFinalFrame
     (origin = (x = 0, y = 0), size = (width = 375, height = 667))
     
     pop
     (lldb) po toInitialFrame
     (origin = (x = 0, y = 0), size = (width = 0, height = 0))
     
     (lldb) po toFinalFrame
     (origin = (x = 0, y = 0), size = (width = 375, height = 667))
     */
    CGRect toInitialFrame = [transitionContext initialFrameForViewController:toViewController];
    CGRect toFinalFrame = [transitionContext finalFrameForViewController:toViewController];
    
    CGRect fromFinalFrame = fromView.frame;
    
    toInitialFrame.size = toFinalFrame.size;
    if (isPresent) {
        toInitialFrame.origin.x = CGRectGetMinX(containerView.frame);
        toInitialFrame.origin.y = CGRectGetMaxY(containerView.frame);
        toView.frame = toInitialFrame;

    } else {
        fromFinalFrame = CGRectOffset(fromView.frame, 0, fromFinalFrame.size.height);
        fromView.frame = toInitialFrame;
        [containerView addSubview:fromView];
    }
    
    NSTimeInterval time = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:time animations:^{
        if (isPresent) {
            toView.frame = toFinalFrame;
        } else {
            fromView.frame = fromFinalFrame;
        }
    } completion:^(BOOL finished) {
        [transitionContext completeTransition: !transitionContext.transitionWasCancelled];
    }];
}

@end
