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

@property (strong, nonatomic) NSMutableArray<NSString *> *arrClassName;
@property (strong, nonatomic) NSMutableArray<NSString *> *arrDescribe;
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrClassName.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testProjectVC_Cell_ID"];
    cell.textLabel.text = self.arrDescribe[indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = self.arrClassName[indexPath.row];
    
    UIViewController *vc = [self.sb instantiateViewControllerWithIdentifier:className];
    [self.navigationController pushViewController:vc animated:YES];
}


- (NSMutableArray<NSString *> *)arrClassName {
    if (!_arrClassName) {
        _arrClassName = @[@"TVViewController"].mutableCopy;
    }
    return _arrClassName;
}

- (NSMutableArray<NSString *> *)arrDescribe {
    if (!_arrDescribe) {
        _arrDescribe = @[@"测试tableView"].mutableCopy;
    }
    return _arrDescribe;
}

@end

























