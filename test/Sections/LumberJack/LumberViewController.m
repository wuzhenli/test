//
//  LumberViewController.m
//  test
//
//  Created by li’Pro on 2019/1/30.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "LumberViewController.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

static const DDLogLevel ddLogLevel = DDLogLevelDebug;

@interface LumberViewController ()

@end

@implementation LumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self someMehtod];
    
}

- (void)someMehtod {
    DDLogVerbose(@"this is someMethod : verbose");
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
