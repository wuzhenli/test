//
//  CircleGestureRecognizer.h
//  test
//
//  Created by li’s Air on 2018/8/4.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface CircleGestureRecognizer : UIGestureRecognizer

@property (strong, nonatomic) NSMutableArray<NSValue *> *arrPoint;

@end
