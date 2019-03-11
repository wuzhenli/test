//
//  CircleGestureRecognizer.m
//  test
//
//  Created by li’s Air on 2018/8/4.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "CircleGestureRecognizer.h"


@implementation CircleGestureRecognizer

- (void)reset {
    [super reset];
    
    [self.arrPoint removeAllObjects];
    self.state = UIGestureRecognizerStatePossible;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
//    if (touches.count != 1) {
//        self.state = UIGestureRecognizerStateFailed;
//    } else
        self.state = UIGestureRecognizerStateBegan;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    if (self.state == UIGestureRecognizerStateFailed) {
        NSLog(@" touchesMoved --- Failed");
        return;
    }
    
    CGPoint location = [touches.anyObject locationInView:self.view.window];
    [self.arrPoint addObject:[NSValue valueWithCGPoint:location]];
    self.state = UIGestureRecognizerStateEnded;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    self.state = UIGestureRecognizerStateEnded;
}


- (NSMutableArray<NSValue *> *)arrPoint {
    if (!_arrPoint) {
        _arrPoint = @[].mutableCopy;
    }
    return _arrPoint;
}

@end
