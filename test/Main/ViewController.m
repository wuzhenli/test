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

#define Dispatch_Safe_Main(block) \
if ([NSThread isMainThread]) { \
block(); \
} else { \
dispatch_async(dispatch_get_main_queue(), block); \
}

#define Method(a, b) - (void)m ## a ## b
@interface ViewController ()

@property (weak, nonatomic) IBOutlet JLGradientButton *btnGradient;
@property (weak, nonatomic) IBOutlet UILabel *lblTest;
@property (weak, nonatomic) IBOutlet UIView *viewRed;


@property (strong, nonatomic) IMBoard *imBoard;
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.viewRed.frame = CGRectMake(0, 0, 100, 100);
    self.viewRed.layer.delegate = nil;
    
    [self mAddNum];
}

Method(Add, Num) {
    
    NSLog(@"mAddNum");
}

- (void)testGCDApply {
    NSMutableArray<NSString *> *arr = [NSMutableArray array];
    for (int i = 0; i<10; i++) {
        [arr addObject:@(i).stringValue];
    }
    
    NSLog(@"--- before apply");
    dispatch_apply(arr.count, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t t) {
        NSLog(@"%@ %@", arr[t], [NSThread currentThread]);
    });
    NSLog(@"--- after apply");
    
}
- (void)testGradient {
}

- (IBAction)viewRedTaped:(id)sender {
    NSLog(@"%s", __func__);
}


/*
 iPhone 6s
 2017-11-10 10:30:49.604782+0800 test[8176:97697] nativeBounds:{{0, 0}, {750, 1334}}
 2017-11-10 10:30:49.605277+0800 test[8176:97697] nativeScale:2.000000   scale:2.000000
 2017-11-10 10:30:49.605412+0800 test[8176:97697] bounds:{{0, 0}, {375, 667}}
 iPhone 6s Plus
 2017-11-10 10:31:30.123601+0800 test[8407:102365] nativeBounds:{{0, 0}, {1242, 2208}}
 2017-11-10 10:31:30.123857+0800 test[8407:102365] nativeScale:3.000000   scale:3.000000
 2017-11-10 10:31:30.124060+0800 test[8407:102365] bounds:{{0, 0}, {414, 736}}

 */
- (IBAction)btnClicked_1:(JLGradientButton *)sender {
    self.viewRed.transform = CGAffineTransformMakeScale(2, 2);
}

- (IBAction)btnClicked_2:(id)sender {
    self.viewRed.transform = CGAffineTransformIdentity;
}

- (IBAction)btnClicked_3:(UIButton *)sender {
    NSLog(@"frame:%@", NSStringFromCGRect(self.viewRed.frame));
    NSLog(@"bounds:%@", NSStringFromCGRect(self.viewRed.bounds));
}
- (void)test {

}
#pragma -mark 
#pragma -mark goto VC
- (void)gotoPhotoKitVC {
    Class c = NSClassFromString(@"PhotoKitViewController");
    UIViewController *vc = [[c alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)gotoAPIVC {
    APIViewController *vc = [[APIViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma -mark 
#pragma -mark getter


- (IMBoard *)imBoard {
    if (!_imBoard) {
        _imBoard = [IMBoard new];
    }
    return _imBoard;
}

@end

























