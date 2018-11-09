//
//  JLPanGestureRecognizer.m
//  test
//
//  Created by li’Pro on 2018/11/8.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "JLPanGestureRecognizer.h"

@interface JLPanGestureRecognizer ()

@property (nonatomic, strong) NSNumber *isFail;
@property (assign, nonatomic) CGPoint firstVelocity;

@end

@implementation JLPanGestureRecognizer

- (void)reset {
    [super reset];
    self.isFail = nil;
    self.firstVelocity = CGPointZero;
//    self.animator.direction = ZFModalTransitonDirectionBottom;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    CGPoint velocity = [self velocityInView:self.view];
    //    NSLog(@"velocity.x:%lf   velocity.y:%lf", velocity.x, velocity.y);
    if (velocity.x == 0 && velocity.y == 0) {
        return;
    }
    
    
    if (CGPointEqualToPoint(self.firstVelocity, CGPointZero) &&
        CGPointEqualToPoint(velocity, CGPointZero) == NO) {
        self.firstVelocity = velocity;
        
        if (JLPanGestureDirectionVertical == self.direction) {
            if (velocity.y < 0 || (fabs(velocity.x) > fabs(velocity.y))) {
                self.state = UIGestureRecognizerStateFailed;
                self.isFail = @YES;
            }
        } else if (JLPanGestureDirectionHorizontal == self.direction) {
            if (velocity.x < 0 || (fabs(velocity.x) < fabs(velocity.y))) {
                self.state = UIGestureRecognizerStateFailed;
                self.isFail = @YES;
            }
        } else {
            if (velocity.x > velocity.y) { // horizontal
                if (fabs(velocity.x) < fabs(velocity.y)) {
                    self.state = UIGestureRecognizerStateFailed;
                    self.isFail = @YES;
                }
            } else {    
                if (fabs(velocity.y) < fabs(velocity.x)) {
                    self.state = UIGestureRecognizerStateFailed;
                    self.isFail = @YES;
                }
            }
        }
    }
}


- (void)setGestureRecognizerToFailPan:(UIGestureRecognizer *)gestureRecognizerToFailPan {
    [self requireGestureRecognizerToFail:gestureRecognizerToFailPan];
}

@end
