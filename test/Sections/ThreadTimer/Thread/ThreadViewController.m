//
//  ThreadViewController.m
//  test
//
//  Created by li’Pro on 2018/12/25.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "ThreadViewController.h"

@interface ThreadViewController ()

@property (strong, nonatomic) NSThread *thread;
@property (strong, nonatomic) NSRunLoop *runloop;
@property (strong, nonatomic) NSMachPort *port;
@property (weak, nonatomic) NSTimer *timer;

@end

@implementation ThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(subThreadFunction) object:nil];
    thread.name = @"test.subThread";
    [thread start];
    self.thread = thread;
}



- (void)dealloc {
    NSLog(@"%s", __func__);
}

BOOL shouldKeepRunning = YES; // global

- (void)subThreadFunction {
    NSLog(@"%s  :  %@", __func__, [NSThread currentThread]);
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerEvent) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
    self.runloop = [NSRunLoop currentRunLoop];
    
    
    NSRunLoop *theRL = [NSRunLoop currentRunLoop];
    [theRL runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];

    
    NSLog(@" 停止了 runloop end");
}

- (void)timerEvent {
    NSLog(@"%s  %@", __func__, [NSThread currentThread]);
}

- (IBAction)btnExistClicked:(id)sender {
    [self performSelector:@selector(quitRunloop) onThread:self.thread withObject:nil waitUntilDone:NO];
}
- (void)quitRunloop {
    CFRunLoopStop(CFRunLoopGetCurrent());
    [[NSThread currentThread] cancel];
}

@end
