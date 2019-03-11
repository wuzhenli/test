//
//  JLPanGestureRecognizer.h
//  test
//
//  Created by li’Pro on 2018/11/8.
//  Copyright © 2018 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

typedef NS_ENUM(NSUInteger, JLPanGestureDirection) {
    JLPanGestureDirectionHorizontal = 0,
    JLPanGestureDirectionVertical = 1
};

NS_ASSUME_NONNULL_BEGIN

@interface JLPanGestureRecognizer : UIPanGestureRecognizer

@property (assign, nonatomic) JLPanGestureDirection direction;

@property (nonatomic, assign) UIGestureRecognizer *gestureRecognizerToFailPan;

@end

NS_ASSUME_NONNULL_END
