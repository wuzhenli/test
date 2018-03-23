//
//  SafeArrayTool.m
//  test
//
//  Created by li’Pro on 2018/3/23.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "SafeArrayTool.h"
#import "ThreadSafe.h"


@interface SafeArrayTool ()
@property (strong, nonatomic) NSMutableArray<NSString *> *arr;
@property (strong, nonatomic) dispatch_queue_t queueSafe;
@end

@implementation SafeArrayTool
- (instancetype)init
{
    self = [super init];
    if (self) {
        _arr = [NSMutableArray new];
        self.queueSafe = dispatch_queue_create("com.bbs.www.safeMuArray", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (void)addObject:(NSString *)obj {
    SafeBarrier(self.queueSafe, ^(SafeArrayTool *strongSelf){
        [strongSelf.arr addObject:obj];
    });
    
}
- (void)removeObject:(NSString *)obj {
    SafeBarrier(self.queueSafe, ^(SafeArrayTool *strongSelf){
        [strongSelf.arr removeObject:obj];
    });
}
- (NSMutableArray *)allValue {
    return _arr;
}
- (void)show {
    NSArray *arr = [self.arr sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return obj1.integerValue < obj2.integerValue;
    }];
    NSLog(@"%@", arr);
}


@end
















