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

#define Dispatch_Safe_Main(block) \
if ([NSThread isMainThread]) { \
block(); \
} else { \
dispatch_async(dispatch_get_main_queue(), block); \
}


@interface ViewController ()

@property (weak, nonatomic) IBOutlet JLGradientButton *btnGradient;
@property (weak, nonatomic) IBOutlet UILabel *lblTest;
@property (weak, nonatomic) IBOutlet UIView *viewRed;

@property (strong, nonatomic) DBTool *dbTool;
@property (strong, nonatomic) SafeArrayTool *arrTool;

@property (strong, nonatomic) IMBoard *imBoard;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.viewRed.frame = CGRectMake(0, 0, 100, 100);
    self.viewRed.layer.delegate = nil;
   
    
    {
        self.arrTool = [SafeArrayTool new];
        
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        dispatch_queue_t globalQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(globalQ, ^{
            dispatch_semaphore_signal(sema);
            for (int i = 0; i<100; i++) {
                NSString *key =  [NSString stringWithFormat:@"%d",  i + 10000];
                [self.arrTool addObject:key];
            }
        });
        dispatch_async(globalQ, ^{
            dispatch_semaphore_signal(sema);
            for (int i = 0; i<100; i++) {
                NSString *key =  [NSString stringWithFormat:@"%d",  i ];
                [self.arrTool addObject:key];
            }
        });
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        
        NSLog(@"%@", self.arrTool.allValue);
    }
    
//    {
//        self.dbTool = [DBTool new];
//        
//        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
//        dispatch_queue_t globalQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//        dispatch_async(globalQ, ^{
//            dispatch_semaphore_signal(sema);
//            for (int i = 0; i<100; i++) {
//                NSString *value =  [NSString stringWithFormat:@"%d-%d", i, i];
//                NSString *key =  [NSString stringWithFormat:@"%d",  i + 10000];
//                [self.dbTool addObj:value key:key];
//            }
//        });
//        dispatch_async(globalQ, ^{
//            dispatch_semaphore_signal(sema);
//            for (int i = 0; i<100; i++) {
//                NSString *value =  [NSString stringWithFormat:@"%d===%d", i, i];
//                NSString *key =  [NSString stringWithFormat:@"%d", i];
//                [self.dbTool addObj:value key:key];
//            }
//        });
//        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
//        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
//        
//        NSLog(@"%@", self.dbTool.allValue);
//    }
    
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
//    dispatch_queue_t globalQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(globalQ, ^{
//        for (int i = 0; i<1000; i++) {
//            NSString *value =  [NSString stringWithFormat:@"%d-%d", i, i];
//            NSString *key =  [NSString stringWithFormat:@"%d", i];
//            [dic setObject:value forKey:key];
//        }
//        dispatch_semaphore_signal(sema);
//    });
//    dispatch_async(globalQ, ^{
//        for (int i = 0; i<1000; i++) {
//            NSString *value =  [NSString stringWithFormat:@"%d-%d", i, i];
//            NSString *key =  [NSString stringWithFormat:@"%d", i];
//            [dic setObject:value forKey:key];
//        }
//        dispatch_semaphore_signal(sema);
//    });
//    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
//    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
//    
//    NSLog(@"%@", dic);

}

- (void)testGradient {
}

- (IBAction)viewRedTaped:(id)sender {
 
    [self.arrTool show];
    
   
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

























