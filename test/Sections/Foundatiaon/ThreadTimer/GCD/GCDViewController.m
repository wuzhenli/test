//
//  GCDViewController.m
//  test
//
//  Created by li’Pro on 2018/6/29.
//  Copyright © 2018年 wzl. All rights reserved.
//  dispatch source : // https://www.jianshu.com/p/880c2f9301b6

#import "GCDViewController.h"
#import "SafeMuDictionary.h"
#import "SafeArray.h"

@interface GCDViewController ()

@property (strong, nonatomic) dispatch_source_t source;

@end


@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"GCD";
    
    
    UIButton *btn = ({
        UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
        b.backgroundColor = [UIColor lightGrayColor];
        [b setTitle:@"btnSource" forState:UIControlStateNormal];
        [b addTarget:self action:@selector(btnSource) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:b];
        b;
    });
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.lblTip);
        make.height.mas_equalTo(40);
        make.top.equalTo(self.lblTip.mas_bottom).offset(15);
    }];
    
    
    
//    for (NSInteger i = 0; i<10; i++) {
//        NSLog(@"globalQueue:%p", dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
//    }
    
}



#pragma -mark override

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self testSetTarget];
}


#pragma -mark private

- (void)testSetTarget {
    /*
     dispatch_set_target_queue除了能用来设置队列的优先级之外，还能够创建队列的层次体系，当我们想让不同队列中的任务同步的执行时，我们可以创建一个串行队列，然后将这些队列的target指向新创建的队列即可，比如

     2019-01-13 14:53:12.773739+0800 test[3220:47280] queue 1  - 1
     2019-01-13 14:53:13.779439+0800 test[3220:47280] queue 1  - 2
     2019-01-13 14:53:13.779823+0800 test[3220:47280] queue 2  - 1
     2019-01-13 14:53:14.785059+0800 test[3220:47280] queue 2  - 2
     2019-01-13 14:53:14.785293+0800 test[3220:47280] queue 3  - 1
     2019-01-13 14:53:15.790104+0800 test[3220:47280] queue 3  - 2
     */
    dispatch_queue_t targetQueue = dispatch_queue_create("com.jaly.www.queue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_queue_t queue1 = dispatch_queue_create("com.jaly.www.1", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("com.jaly.www.2", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue3 = dispatch_queue_create("com.jaly.www.3", DISPATCH_QUEUE_SERIAL);
    
    dispatch_set_target_queue(queue1, targetQueue);
    dispatch_set_target_queue(queue2, targetQueue);
    dispatch_set_target_queue(queue3, targetQueue);
    
    dispatch_async(queue1, ^{
        NSLog(@"queue 1  - 1");
        [NSThread sleepForTimeInterval:1];
        NSLog(@"queue 1  - 2");
    });
    dispatch_async(queue2, ^{
        NSLog(@"queue 2  - 1");
        [NSThread sleepForTimeInterval:1];
        NSLog(@"queue 2  - 2");
    });
    dispatch_async(queue3, ^{
        NSLog(@"queue 3  - 1");
        [NSThread sleepForTimeInterval:1];
        NSLog(@"queue 3  - 2");
    });
}



#pragma -mark event response


- (void)btnSource {
    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0, 0, dispatch_get_main_queue());
    self.source = source;
    
    dispatch_source_set_event_handler(source, ^{
        self.lblTip.text = @(time(NULL)).stringValue;
    });
    dispatch_resume(source);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 1; i<5; i++) {
            dispatch_source_merge_data(source, i);
        }
    });
}

- (IBAction)btnSourceTest2 { 
    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0, 0, dispatch_get_main_queue());
    
    //事件触发后执行的句柄
    dispatch_source_set_event_handler(source,^{
        NSLog(@"监听函数：%lu",dispatch_source_get_data(source)); 
    });
    
    //开启source
    dispatch_resume(source);
    
    dispatch_queue_t myqueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(myqueue, ^ {
        for(int i = 1; i <= 4; i ++){
            
            NSLog(@"~~~~~~~~~~~~~~%d", i);
            
            //触发事件，向source发送事件，这里i不能为0，否则触发不了事件
            dispatch_source_merge_data(source,i);
            //当Interval的事件越长，则每次的句柄都会触发
            //[NSThread sleepForTimeInterval:0.0001];
        }
    });
}

- (IBAction)btnTimerClicked:(id)sender {
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, globalQueue);
    dispatch_source_set_timer(source, dispatch_walltime(NULL, 0), 1 * NSEC_PER_SEC, 0);
    
    __block int count = 4;
    dispatch_source_set_event_handler(source, ^{
        if (count <= 0) {
            NSLog(@"cancel");
            dispatch_source_cancel(source);
        } else {
            NSLog(@"count:%d", count--);
        }
    });
    
    dispatch_resume(source);
}

- (IBAction)btnSuspendClicked:(id)sender {
    dispatch_queue_t queue1 = dispatch_queue_create("com.6rooms.www.gcd", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("com.6rooms.www.gcd", DISPATCH_QUEUE_SERIAL);
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_async(queue1, ^{
        NSLog(@"task 1: queue 1...");
        sleep(1);
        NSLog(@":white_check_mark:完成任务 1");
    });
    
    dispatch_async(queue2, ^{
        NSLog(@"task 2 : queue 2...");
        sleep(1);
        NSLog(@":white_check_mark: 完成任务 2");
    });
    
    
    dispatch_group_async(group, queue1, ^{
        NSLog(@"正在暂停任务 queue 1");
        dispatch_suspend(queue1);
    });
    dispatch_group_async(group, queue2, ^{
        NSLog(@"正在暂停任务 queue 2");
        dispatch_suspend(queue2);
    });
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@" group task finish ====");
    
    dispatch_async(queue1, ^{
        NSLog(@"task 2 : queue 1");
    });
    dispatch_async(queue2, ^{
        NSLog(@"task 2 : queue 2");
    });
    
    dispatch_resume(queue1);
    dispatch_resume(queue2);
}

- (IBAction)btnFiveClicked:(id)sender {
    
}

- (IBAction)testDispatchBarrierSync:(id)sender {
    dispatch_queue_t queue = dispatch_queue_create("test.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    
    for (NSUInteger i = 0; i<10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"before index:%ld", i);
        });
    }
    
    for (NSUInteger i = 0; i<100; i++) {
        dispatch_barrier_sync(queue, ^{
            if (i == 100 - 1) {
                NSLog(@"barrier index:%ld", i);
                NSLog(@"currentThread:%@", [NSThread currentThread]);
            }
        });
    }
    
    NSLog(@"this is main Thread");
    
    for (NSUInteger i = 10; i<20; i++) {
        dispatch_async(queue, ^{
            NSLog(@"after index:%ld", i);
        });
    }
}


- (IBAction)testDispatchBarrierAsync:(id)sender {
    dispatch_queue_t queue = dispatch_queue_create("test.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    
    for (NSUInteger i = 0; i<10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"before index:%ld", i);
        });
    }
    
    for (NSUInteger i = 0; i<100; i++) {
        dispatch_barrier_async(queue, ^{
            if (i == 100 - 1) {
                NSLog(@"barrier index:%ld", i);
                NSLog(@"currentThread:%@", [NSThread currentThread]);
            }
        });
    }
    
    NSLog(@"this is main Thread");
    
    for (NSUInteger i = 10; i<20; i++) {
        dispatch_async(queue, ^{
            NSLog(@"after index:%ld", i);
        });
    }
}
- (IBAction)testDictionarySafe:(id)sender {
    /* will crash
    NSMutableDictionary *dic = [NSMutableDictionary new];
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    // dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    for (NSUInteger i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            for (NSUInteger i = 0; i < 1000; i++) {
                dic[@(i)] = @(i);
            }
        });
    } */
    
    SafeMuDictionary *dic = [SafeMuDictionary new];
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    // dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    dispatch_group_t group = dispatch_group_create();
    
    for (NSUInteger j = 0; j < 10; j++) {
        dispatch_group_enter(group);
        
        dispatch_async(queue, ^{
            for (NSUInteger i = 0; i < 1000; i++) {
                [dic setObject:@(i) forKey:@(i) block:^(SafeMuDictionary * _Nonnull dic, id  _Nonnull obj, id  _Nonnull aKey) {
                    if (i == 1000 - 1) {
                        dispatch_group_leave(group);
                        NSLog(@"leave:%ld", j);
                    }
                }];
            }
        });
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"%@", [dic getDictionary]);
    });
    
    /*
    dispatch_async(queue, ^{
        for (NSUInteger i = 0; i < 1000; i++) {
            dic[@(i)] = @(i);
        }
        dispatch_semaphore_signal(semaphore);
    });
    dispatch_async(queue, ^{
        for (NSUInteger i = 0; i < 1000; i++) {
            dic[@(i)] = @(i);
        }
        dispatch_semaphore_signal(semaphore);
    });
    
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"%@", dic);
    */
}

- (IBAction)testArraySafe:(id)sender {
    
    SafeArray *arr = [SafeArray new];
     dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
     
     for (NSUInteger i = 0; i < 10; i++) {
         dispatch_async(queue, ^{
             for (NSUInteger j = 0; j < 1000; j++) {
                 [arr addObject:@(j) block:^(SafeArray * _Nonnull array, id  _Nonnull obj, NSInteger index) {
                     ;
                 }];
             }
         });
     }
}

@end
