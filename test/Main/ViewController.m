//
//  ViewController.m
//  test
//
//  Created by li’Pro on 2017/9/26.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+DLIntrospection.h"
#import <objc/runtime.h>
#import "BBSAcitvity.h"

#define Dispatch_Safe_Main(block) \
if ([NSThread isMainThread]) { \
block(); \
} else { \
dispatch_async(dispatch_get_main_queue(), block); \
}


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray<NSString *> *arrClassNameSB;
@property (strong, nonatomic) NSMutableArray<NSString *> *arrDescribeSB;

@property (strong, nonatomic) NSMutableArray<NSString *> *arrClassNameXib;
@property (strong, nonatomic) UIStoryboard *sb;
@end

@implementation ViewController

- (NSMutableArray<NSString *> *)arrClassNameXib {
    if (!_arrClassNameXib) {
        _arrClassNameXib = @[ @"KVCViewController", @"PrivateAPIViewController",  @"StructSizeViewController",
                              @"LumberViewController", 
                              @"JLRoutersViewController",@"TestHeightTableViewController",@"ThreadViewController", 
                              @"GCDViewController", @"BlockBaseViewController",
                             @"FunctionTestViewController",@"StaticTableViewController",
                             @"SwipeCellKitCollectionViewController",
                             @"TestAnimationViewController", @"DrawViewController",
                             @"GestureViewController", @"DefinePanGestureViewController", @"PhotoKitViewController", @"SlideTableViewController", @"KeyboardViewController", @"WebViewController", @"ScrollViewController", @"TestVCController", @"MenuCtlViewController", @"TestViewController"].mutableCopy;
    }
    return _arrClassNameXib;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试 Demo";
    self.tableView.tableFooterView = [UIView new];
    
    self.sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"More"
       style:UIBarButtonItemStylePlain target:self action:@selector(showActivityController)];
    
}

- (void)testPlus {
    int i = 3;
    int j = ++i + ++i + ++i;
    NSLog(@"j=%d", j);
}


- (void)showActivityController {
    NSMutableArray *items = @[].mutableCopy;
    [items addObject:@"六间房直播"]; // title
    
    NSString *webUrl = @"https://www.6.cn";  // url
    if (webUrl) [items addObject:[NSURL URLWithString:webUrl]];
    
    BBSAcitvity *activity = [[BBSAcitvity alloc] init];
    
    UIActivityViewController * activityCtl = [[UIActivityViewController alloc]initWithActivityItems:items applicationActivities:@[activity]];
    activityCtl.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
        if (UIActivityTypeCopyToPasteboard == activityType) {
            [UIPasteboard generalPasteboard].string = webUrl;
        }
    };
    [self presentViewController:activityCtl animated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return self.arrClassNameSB.count;
    }
    return self.arrClassNameXib.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testProjectVC_Cell_ID"];
    if (0 == indexPath.section) {
        cell.textLabel.text = self.arrDescribeSB[indexPath.row];
    } else {
        cell.textLabel.text = self.arrClassNameXib[indexPath.row];
    }
    cell.layoutMargins;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = nil;
    if (0 == indexPath.section) {
        NSString *className = self.arrClassNameSB[indexPath.row];
        vc = [self.sb instantiateViewControllerWithIdentifier:className];
    } else {
        NSString *className = self.arrClassNameXib[indexPath.row];
        vc = [[NSClassFromString(className) alloc] init];
    }
    [self.navigationController pushViewController:vc animated:YES];
}


- (NSMutableArray<NSString *> *)arrClassNameSB {
    if (!_arrClassNameSB) {
        _arrClassNameSB = @[@"TVViewController", @"TimerViewController"].mutableCopy;
    }
    return _arrClassNameSB;
}

- (NSMutableArray<NSString *> *)arrDescribeSB {
    if (!_arrDescribeSB) {
        _arrDescribeSB = @[@"测试tableView", @"timer"].mutableCopy;
    }
    return _arrDescribeSB;
}

@end

























