//
//  TargetViewController.m
//  test
//
//  Created by li’Pro on 2019/1/4.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "TargetViewController.h"


@interface TargetViewController ()<JLRRouteHandlerTarget>

@property (copy, nonatomic) NSDictionary <NSString *, id> *parameters;

@end


@implementation TargetViewController

#pragma -mark JLRRouteHandlerTarget
/**
 Initialize an instance of the conforming class by passing matched route parameters from a JLRoutes route.
 
 @param parameters The match parameters passed to use when initializing the object. These are passed from a JLRoutes handler block.
 @returns An initialized instance of the conforming class.
 */
- (instancetype)initWithRouteParameters:(NSDictionary <NSString *, id> *)parameters {
    self = [super init];
    _parameters = parameters;
    return self;
}

/**
 Called for a successful route match.
 @param parameters The match parameters passed to the handler block.
 @returns YES if the route was handled, NO if matching a different route should be attempted.
 */
//- (BOOL)handleRouteWithParameters:(NSDictionary<NSString *, id> *)parameters {
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
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
