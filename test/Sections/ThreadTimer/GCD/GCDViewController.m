//
//  GCDViewController.m
//  test
//
//  Created by li’Pro on 2018/6/29.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"GCD";
}

- (IBAction)btnSource:(id)sender {
    NSLog(@"%s", __func__);
    
    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0, 0, dispatch_get_main_queue());
    
    dispatch_source_set_event_handler(source, ^{
        NSLog(@"handle:%@", [NSThread currentThread]);
//        self.view.backgroundColor = [UIColor orangeColor];
    });
    
    dispatch_resume(source);

    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globalQueue, ^{
        for (int i = 1; i< 5; i++) {
            NSLog(@"~~~~~~~~~~~~~~%d", i);
            dispatch_source_merge_data(source, i);
        }
    });

//    dispatch_apply(10, globalQueue, ^(size_t t) {
//        dispatch_source_merge_data(source, t);
//    });
}

- (IBAction)btnSourceTest2 {
    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0, 0, dispatch_get_main_queue());
    
    //事件触发后执行的句柄
    dispatch_source_set_event_handler(source,^{
        
        NSLog(@"监听函数：%lu",dispatch_source_get_data(source));
        
    });
    
    //开启source
    dispatch_resume(source);
    
    dispatch_queue_t myqueue =dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
