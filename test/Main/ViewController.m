//
//  ViewController.m
//  test
//
//  Created by li’Pro on 2017/9/26.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import "ViewController.h"
#import "KeyWinViewController.h"
#import "JLGradientButton.h"
#import "IMBoard.h"
#import "GestureViewController.h"
#import "APIViewController.h"
#import "SlideViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import <math.h>
#import "DBTool.h"
#import "SafeArrayTool.h"
#import "JLPresentAnimation.h"
#import "JLAnimationPresentationController.h"
#import "PlayerViewController.h"
#import "BBSDrawView.h"
#import "UIView+Corner.h"
#import "TVViewController.h"

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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试 Demo";
    self.tableView.tableFooterView = [UIView new];
    
    self.sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
       style:UIBarButtonItemStylePlain target:self action:nil];

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

- (NSMutableArray<NSString *> *)arrClassNameXib {
    if (!_arrClassNameXib) {
        _arrClassNameXib = @[@"GestureViewController", @"SlideTableViewController"].mutableCopy;
    }
    return _arrClassNameXib;
}

- (NSMutableArray<NSString *> *)arrClassNameSB {
    if (!_arrClassNameSB) {
        _arrClassNameSB = @[@"TVViewController", @"TimerViewController", @"GCDViewController"].mutableCopy;
    }
    return _arrClassNameSB;
}

- (NSMutableArray<NSString *> *)arrDescribeSB {
    if (!_arrDescribeSB) {
        _arrDescribeSB = @[@"测试tableView", @"timer", @"GCDViewController"].mutableCopy;
    }
    return _arrDescribeSB;
}

@end

























