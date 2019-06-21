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

- (IBAction)btnDispatchClicked:(UIButton *)sender {
    DDDispatchQueueLogFormatter *formatter = [[DDDispatchQueueLogFormatter alloc] init];
    formatter.minQueueLength = 4;
    formatter.maxQueueLength = 0;
    
    [formatter setReplacementString:@"downloading" forQueueLabel:@"queue.downloading"];
    [formatter setReplacementString:@"parsing" forQueueLabel:@"queue.parsing"];
    [[DDTTYLogger sharedInstance] setLogFormatter:formatter];
    
//    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    DDLogVerbose(@"start queue");
    
    dispatch_queue_t downloadQueue = dispatch_queue_create("queue.downloading", NULL);
    dispatch_queue_t parsingQueue = dispatch_queue_create("queue.parsing", NULL);
    
    dispatch_async(downloadQueue, ^{
        DDLogVerbose(@"SomeLog in download queue");
    });
    
    dispatch_async(parsingQueue, ^{
        DDLogVerbose(@"Some task in parsing queue");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        DDLogVerbose(@"Task in global queue");
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        DDLogVerbose(@"Task in main Queue");
    });
}


@end
