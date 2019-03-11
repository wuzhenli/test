//
//  IMBoard.m
//  test
//
//  Created by li’Pro on 2017/11/14.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import "IMBoard.h"

@interface IMBoard() 

@end

@implementation IMBoard

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.window addSubview:self.btnTip];
        self.btnTip.frame = self.window.bounds;
    }
    return self;
}

- (void)btnTipCLicked:(UIButton *)sender {
    NSLog(@"%s", __func__);
}

- (UIButton *)btnTip {
    if (!_btnTip) {
        _btnTip = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnTip.backgroundColor =  [UIColor lightGrayColor];
        [_btnTip setTitle:@"btnTip" forState:UIControlStateNormal];
        [_btnTip setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btnTip setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [_btnTip addTarget:self action:@selector(btnTipCLicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnTip;
}
- (UIWindow *)window {
    if (!_window) {
        CGSize size = [UIScreen mainScreen].bounds.size;
        CGFloat longValue = MAX(size.width, size.height);
        CGFloat shortValue = MIN(size.width, size.height);
        
        _window = [[UIWindow alloc] initWithFrame:CGRectMake(30, 30, shortValue - 60, longValue - 60)];
        _window.backgroundColor = [UIColor lightGrayColor];
        _window.windowLevel = UIWindowLevelAlert + 1;
        _window.layer.cornerRadius = 4;
        _window.layer.masksToBounds = YES;
        _window.layer.borderWidth = 1;
        _window.layer.borderColor = [[UIColor blackColor] CGColor];
//        [_window makeKeyAndVisible]; //关键语句,显示window
        _window.hidden = NO;
    }
    return _window;
}
@end
