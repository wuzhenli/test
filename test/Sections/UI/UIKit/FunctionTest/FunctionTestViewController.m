//
//  FunctionTestViewController.m
//  test
//
//  Created by li’Pro on 2018/12/19.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "FunctionTestViewController.h"

@interface FunctionTestViewController ()

@end

@implementation FunctionTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btnSystemShareClicked:(id)sender {
    NSMutableArray *items = @[].mutableCopy;
    [items addObject:@"My title"]; // title
    [items addObject:[NSURL URLWithString:@"http://www.6.cn"]];
    
    
    UIActivityViewController * activityCtl = [[UIActivityViewController alloc]initWithActivityItems:items applicationActivities:nil];
    activityCtl.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
        NSLog(@"%@", [UIPasteboard generalPasteboard].string);
    };
    [self presentViewController:activityCtl animated:YES completion:nil];
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
