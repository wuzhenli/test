//
//  PrivateAPIViewController.m
//  test
//
//  Created by li’Pro on 2019/1/28.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "PrivateAPIViewController.h"
#import <dlfcn.h>


@interface PrivateAPIViewController ()

@end

@implementation PrivateAPIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self testUnPublicAPI];
    [self testPrivateAPI];
}

- (void)testUnPublicAPI {
    Class LSApplicationWorkspace_Class = NSClassFromString(@"LSApplicationWorkspace");
    NSObject *workspace = [LSApplicationWorkspace_Class performSelector:NSSelectorFromString(@"defaultWorkspace")];
    
    NSArray *appList = [workspace performSelector:NSSelectorFromString(@"allApplications")];
    for (id app in appList) {
        NSLog(@"%@", [app performSelector:NSSelectorFromString(@"applicationIdentifier")]);
    }
}

- (void)testPrivateAPI {

    
    //加载FTServices.framework
    void * FTServicesHandle = dlopen("/System/Library/PrivateFrameworks/FTServices.framework/FTServices", RTLD_LAZY);
    Class NetworkSupport = NSClassFromString(@"FTNetworkSupport");
    id networkSupport = [NetworkSupport performSelector:NSSelectorFromString(@"sharedInstance")];
    [networkSupport performSelector:NSSelectorFromString(@"dataActiveAndReachable")];
    //卸载FTServices.framework
    dlclose(FTServicesHandle);
    
    
    
}

@end
