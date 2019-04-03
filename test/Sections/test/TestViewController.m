//
//  TestViewController.m
//  test
//
//  Created by li’Pro on 2017/9/27.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import "TestViewController.h"

#define TEST_ARGS(...)  NSLog(@"--- before"); \
__VA_ARGS__ \
NSLog(@"--- after");

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", [NSThread callStackSymbols]);
    TEST_ARGS(NSLog(@"anything"););
}


@end
