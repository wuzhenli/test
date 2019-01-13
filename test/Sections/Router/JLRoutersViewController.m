//
//  JLRoutersViewController.m
//  test
//
//  Created by li’Pro on 2019/1/3.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "JLRoutersViewController.h"
#import "TargetViewController.h"

@interface JLRoutersViewController ()

@end

@implementation JLRoutersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // 调试使用：查看注册的 url
//    NSLog(@"allRouters:%@", [JLRoutes allRoutes]);
//    NSLog(@"toutes:%@", [[JLRoutes globalRoutes] routes]);
}

- (IBAction)btnUserIdClicked:(id)sender {
    NSURL *viewUserurl = [NSURL URLWithString:@"BBS://user/view/joeldev"];
    [JLRoutes routeURL:viewUserurl];
}

- (IBAction)btn1Clicked:(id)sender {
    NSURL *url =  [NSURL URLWithString:@"thing://global"];
    [JLRoutes routeURL:url];
}

- (IBAction)btn2Clicked:(id)sender {
    NSURL *url = [NSURL URLWithString:@"BBS://wildcard/jok/jj"];
    [JLRoutes routeURL:url];
}

- (IBAction)btn3Clicked:(id)sender {
    
    [JLRoutes routeURL:[NSURL URLWithString:@"/some/route"]];
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
