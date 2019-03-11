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
@property (assign, nonatomic) CFRunLoopObserverRef observerRef;

@end

@implementation ThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"ThreadVC:%p", self);
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
    
    
    [self addRunloopObserverWithCreate:CFRunLoopGetCurrent()];
    [self observerRunloop:CFRunLoopGetCurrent()];
    
    NSRunLoop *theRL = [NSRunLoop currentRunLoop];
    [theRL runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    NSLog(@" 停止了 runloop end");
}

- (void)observerRunloop:(CFRunLoopRef)runloopRef {
    // 创建Observer
    /*
     第1个参数: 指定如何给observer分配存储空间
     第2个参数: 需要监听的状态类型/ kCFRunLoopAllActivities监听所有状态
     第3个参数: 是否每次都需要监听
     第4个参数: 优先级, 数字低的先调用
     第5个参数: 监听到状态改变之后的回调
     CF_EXPORT CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(
     CFAllocatorRef allocator, 
     CFOptionFlags activities, 
     Boolean repeats, 
     CFIndex order, 
     void (^block) (CFRunLoopObserverRef observer, CFRunLoopActivity activity)) API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0));

     */
    CFRunLoopObserverRef  observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"即将进入runloop");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"即将处理timer");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"即将处理source");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"即将进入睡眠");
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"刚从睡眠中唤醒");
                break;
            case kCFRunLoopExit:
                NSLog(@"即将退出");
                break;
            default:
                break;
        }
    });
    // 给主线程的RunLoop添加一个观察者
    /*
     第1个参数: 需要给哪个RunLoop添加观察者
     第2个参数: 需要添加的Observer对象
     第3个参数: 在哪种模式下可以可以监听
     */
    CFRunLoopAddObserver(runloopRef, observer, kCFRunLoopDefaultMode);
    
    // 释放对象
    CFRelease(observer);
}

- (void)addRunloopObserverWithCreate:(CFRunLoopRef)runloopRef {
    CFRunLoopObserverContext ctx = {
        0,
        (__bridge void *)self, // runloop 回调函数 的 info 参数
        &CFRetain,
        &CFRelease,
        NULL
    };
    static CFRunLoopObserverRef defaultModeObse = NULL;
    defaultModeObse = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopBeforeWaiting, true, 1, &__runloopCallback, &ctx);
    CFRunLoopAddObserver(runloopRef, defaultModeObse, kCFRunLoopDefaultMode);
    CFRelease(defaultModeObse);
}

static void __runloopCallback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    NSLog(@"------ 自己监听runloop :%p", info);
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
