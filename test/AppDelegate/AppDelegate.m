//
//  AppDelegate.m
//  test
//
//  Created by li’Pro on 2017/9/26.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

// -application:handleEventsForBackgroundURLSession:completionHandler:
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    LoggerSetupBonjourForBuildUser();
//    LoggerSetOptions(NULL,                  
//                     kLoggerOption_BufferLogsUntilConnection |
//                     kLoggerOption_UseSSL |
//                     kLoggerOption_CaptureSystemConsole|
//                     kLoggerOption_BrowseBonjour|
//                     kLoggerOption_BrowseOnlyLocalDomain);
//    LoggerSetViewerHost(NULL, (__bridge CFStringRef)@"192.168.20.193", (UInt32)50000);
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"%s", __func__);
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%s", __func__);
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%s", __func__);
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%s", __func__);
}


- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%s", __func__);
}


@end
