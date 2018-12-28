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
    
    [self registerJLRouter];
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

- (void)registerJLRouter {
    JLRoutes *routes = [JLRoutes globalRoutes];
    [routes addRoute:@"BBS:userId" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        return YES;
    }];
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


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    //获取共享的UserDefaults
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.www.jaly.www.test"];
    if ([userDefaults boolForKey:@"has-new-share"])
    {
        NSLog(@"新的分享 : %@", [userDefaults valueForKey:@"share-url"]);
        
        //重置分享标识
        [userDefaults setBool:NO forKey:@"has-new-share"];
    }
}


- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%s", __func__);
}


@end
