//
//  LumberViewController.m
//  test
//
//  Created by li’Pro on 2019/1/30.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "LumberViewController.h"


@interface LumberViewController ()

@end

@implementation LumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [self someMehtod];
    
    
}

- (void)someMehtod {
//    DDLogVerbose(@"this is someMethod : verbose");
    [DDLog addLogger:[DDOSLogger sharedInstance]]; // Uses os_log
    
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; // File Logger
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
    
    
    
    DDLogVerbose(@"Verbose");
    DDLogDebug(@"Debug");
    DDLogInfo(@"Info");
    DDLogWarn(@"Warn");
    DDLogError(@"Error");
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
