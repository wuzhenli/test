//
//  AppDelegate.m
//  test
//
//  Created by li’Pro on 2017/9/26.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import "AppDelegate.h"
/// VC
#import "TargetViewController.h"
/// models
#import "MyCustomFormatter.h"

#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel ddLogLevel = DDLogLevelWarning;
#endif


@interface AppDelegate ()

@end


@implementation AppDelegate

void test() {
    dispatch_queue_t queue = dispatch_queue_create("q", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        sleep(1);
    });
    dispatch_async(queue, ^{
        sleep(1);
    });
    dispatch_sync(queue, ^{
        sleep(1);
    });
}

// -application:handleEventsForBackgroundURLSession:completionHandler:
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
#if DEBUG
    [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];
#endif
    
    test();
    
    
    
    
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    [[NSUserDefaults standardUserDefaults] setObject:version
                                              forKey:@"version_preference"];
    
    NSString *build = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    [[NSUserDefaults standardUserDefaults] setObject:build
                                              forKey:@"build_preference"];
    
    NSString *githash = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"GITHash"];
    [[NSUserDefaults standardUserDefaults] setObject:githash
                                              forKey:@"githash_preference"];
    
    // 日志输出到 Console
    [DDLog addLogger:[DDOSLogger sharedInstance]];
    [DDOSLogger sharedInstance].logFormatter = [[MyCustomFormatter alloc] init];
    
    // 日志保存到沙盒
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger withLevel:DDLogLevelError]; // 日志打印级别
    
    {   // 日志保存到沙盒
        DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
        fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
        [DDLog addLogger:fileLogger withLevel:DDLogLevelWarning]; // 日志打印级别
    }
    
    //
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    // To this:
    DDLogError(@"Broken sprocket detected!");
    DDLogVerbose(@"User selected file:%@ withSize:%u", @"/user/li/pagh", 1090);
    DDLogError(@"%@", NSHomeDirectory());
    DDLogWarn(@"This is warning statement");
    
    
    
    

    [self registerJLRouter];
    
    return YES;
}

#pragma -mark private

//- (void)testLumberjack {
//    [DDLog addLogger:[DDOSLogger sharedInstance]];
//
//    DDFileLogger *filelogger = [[DDFileLogger alloc] init];
//    filelogger.rollingFrequency = 60 * 60 * 24;
//    filelogger.logFileManager.maximumNumberOfLogFiles = 7;
//    [DDLog addLogger:filelogger];
//    // The above code tells the application to keep a week's worth of log files on the system.
//
//    [DDLog allLoggersWithLevel];
//}

- (void)registerJLRouter {
    JLRoutes *routes = [JLRoutes globalRoutes];
    
    [[JLRoutes routesForScheme:@"thing"] addRoute:@"/global" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) { // 只匹配 scheme 是 thing  的 url
        NSLog(@"thing://global");
        return YES;
    }];
    
    
    id block = [JLRRouteHandler handlerBlockForTargetClass:[TargetViewController class] completion:^ BOOL(id<JLRRouteHandlerTarget> viewController) {
        UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (rootVC.presentedViewController) {
            rootVC = rootVC.presentedViewController;
        }
        if ([rootVC isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nav = (UINavigationController *)rootVC;
            [nav pushViewController:(TargetViewController  *)viewController animated:YES];
            return YES;
        }
        return NO;
    }];
    [[JLRoutes  globalRoutes] addRoute:@"/some/route" handler:block];
    
//    [routes addRoute:@"/global" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
//        NSLog(@"/global : %@", parameters[@"JLRouteURL"]); // 不管 scheme 是什么 都有机会匹配
//        return YES;
//    }];
    
//    [JLRoutes routesForScheme:@"thing"].shouldFallbackToGlobalRoutes = NO;
    
    [routes addRoute:@"/wildcard/*" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        NSArray *pathComponents = parameters[JLRouteWildcardComponentsKey];
        if (pathComponents.count > 0 && [pathComponents[0] isEqualToString:@"joker"]) {
            return YES;
        }
        return NO;
    }];
    
    /*
     {
         JLRoutePattern = "user/view/:userID";
         JLRouteScheme = JLRoutesGlobalRoutesScheme;
         JLRouteURL = "BBS://user/view/joeldev";
         userID = joeldev;
     }
     */
//    [routes addRoute:@"user/view/:userID:userName" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
//        NSLog(@"user/view/:userID:userName  param:%@", parameters);
//        return YES;
//    }];
    // 多种匹配
//    [routes addRoute:@"/:object/:action/:primaryKey" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
//        NSLog(@"/:object/:action/:primaryKey: param:%@", parameters);
//        return YES;
//    }];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return [JLRoutes routeURL:url];
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
