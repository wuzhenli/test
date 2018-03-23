//
//  JLNavigationController.m
//  test
//
//  Created by li’Pro on 2018/1/3.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "JLNavigationController.h"
#import "NSObject+DLIntrospection.h"

@interface JLNavigationController ()<UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation JLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
    
    
    
}

#pragma -mark 
#pragma -mark UIGestureRecognizerDelegate

// called when a gesture recognizer attempts to transition out of UIGestureRecognizerStatePossible. returning NO causes it to transition to UIGestureRecognizerStateFailed
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}
//
//// called when the recognition of one of gestureRecognizer or otherGestureRecognizer would be blocked by the other
//// return YES to allow both to recognize simultaneously. the default implementation returns NO (by default no two gestures can be recognized simultaneously)
////
//// note: returning YES is guaranteed to allow simultaneous recognition. returning NO is not guaranteed to prevent simultaneous recognition, as the other gesture's delegate may return YES
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    NSLog(@"%@  %@", gestureRecognizer, otherGestureRecognizer);
//    if ([otherGestureRecognizer isKindOfClass:NSClassFromString(@"UIScrollViewPanGestureRecognizer")]) {
//        return YES;
//    }
//    return NO;
//}
//
//// called once per attempt to recognize, so failure requirements can be determined lazily and may be set up between recognizers across view hierarchies
//// return YES to set up a dynamic failure requirement between gestureRecognizer and otherGestureRecognizer
////
//// note: returning YES is guaranteed to set up the failure requirement. returning NO does not guarantee that there will not be a failure requirement as the other gesture's counterpart delegate or subclass methods may return YES
//gestureRecognizer: panGesture
//Other:scrollViewPanGesture
/**
 * return:
 * gestureRecognizer 是否失效
 * yes gestureRecognizer 无效，否则有效
 */
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer NS_AVAILABLE_IOS(7_0) {
//    NSLog(@"shouldRequireFailureOfGestureRecognizer");
//    if ([otherGestureRecognizer isKindOfClass:NSClassFromString(@"UIScrollViewPanGestureRecognizer")]) {
//        return YES; 
//    }
//    return NO;
//}

/**
 * return:
 * otherGestureRecognizer 是否失效
 * otherGestureRecognizer 无效，否则有效
 */
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer NS_AVAILABLE_IOS(7_0) {
////    NSLog(@"shouldBeRequiredToFailByGestureRecognizer");
//    
//    if ([otherGestureRecognizer isKindOfClass:NSClassFromString(@"UIScrollViewPanGestureRecognizer")]) {
//        
//        UIScrollView *scrollView = [otherGestureRecognizer valueForKey:@"scrollView"];
//        CGFloat rate = scrollView.contentOffset.x / scrollView.bounds.size.width;
////        NSLog(@"%lf", rate);
//        if (rate < 1) {
//            return YES;// otherGestureRecognizer faile
//        }
//    }
//    return NO;
//}
//
//// called before touchesBegan:withEvent: is called on the gesture recognizer for a new touch. return NO to prevent the gesture recognizer from seeing this touch
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    return YES;
//}
////
////// called before pressesBegan:withEvent: is called on the gesture recognizer for a new press. return NO to prevent the gesture recognizer from seeing this press
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceivePress:(UIPress *)press {
//    return YES;
//}

@end
