//
//  GestureLabel.m
//  test
//
//  Created by li’Pro on 2017/11/23.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import "GestureLabel.h"

@implementation GestureLabel

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%s", __func__);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    NSLog(@"%s", __func__);
}

@end
