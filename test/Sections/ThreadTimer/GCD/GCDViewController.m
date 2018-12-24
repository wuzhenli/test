//
//  GCDViewController.m
//  test
//
//  Created by li’Pro on 2018/6/29.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "GCDViewController.h"

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
    
    
}

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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
