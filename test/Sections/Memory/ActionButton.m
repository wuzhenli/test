//
//  ActionButton.m
//  test
//
//  Created by 吴贞利 on 2020/4/8.
//  Copyright © 2020 wzl. All rights reserved.
//

#import "ActionButton.h"

@implementation ActionButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
}

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    NSLog(@"-- ActionButton action:%@ target:%@", NSStringFromSelector(action), target);
    static int i = 0;
    if ( i == 0) {
        [super sendAction:@selector(handleLogin) to:self forEvent:event];
    } else {
        [super sendAction:action to:target forEvent:event];
    }
    
    i++;
}

- (void)handleLogin {
    NSLog(@"%s", __func__);
}

@end
