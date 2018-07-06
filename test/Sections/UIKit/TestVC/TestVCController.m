//
//  TestVCController.m
//  test
//
//  Created by li’s Air on 2018/7/6.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "TestVCController.h"

@interface TestVCController ()

@end

@implementation TestVCController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self testView];
}



- (void)testView {
    //    typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
    //        UIViewAutoresizingNone                 = 0,
    //        UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,   1
    //        UIViewAutoresizingFlexibleWidth        = 1 << 1,   2
    //        UIViewAutoresizingFlexibleRightMargin  = 1 << 2,   4
    //        UIViewAutoresizingFlexibleTopMargin    = 1 << 3,   8
    //        UIViewAutoresizingFlexibleHeight       = 1 << 4,   16
    //        UIViewAutoresizingFlexibleBottomMargin = 1 << 5
    //    };
    UIView *sp = self.view.superview;
    NSLog(@"self.view:%@   %ld" , self.view, self.view.autoresizingMask);
    NSLog(@"self.view.superview:%@", self.view.superview);
    NSLog(@"%@", self.view.constraints);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
