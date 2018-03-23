//
//  DBTool.m
//  test
//
//  Created by li’Pro on 2018/3/22.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "DBTool.h"
#import "NSSafeMuDictionary.h"
#import "ThreadSafe.h"
//#define SafeBarrier(queue, block)  \
//    if (block) block(self);


@interface DBTool () 
@property (strong, nonatomic) NSMutableDictionary<NSString *, NSString *> *dic;
@property (strong, nonatomic) dispatch_queue_t queueSafe;
@end

@implementation DBTool
- (instancetype)init
{
    self = [super init];
    if (self) {
        _dic = [NSMutableDictionary new];
        self.queueSafe = dispatch_queue_create("com.bbs.www.safeMuDictionary", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}
- (void)addObj:(NSString *)obj key:(NSString *)key {
//    __weak typeof(self) ws = self;
//    dispatch_barrier_async(self.queueSafe, ^{
//        typeof(ws) strongSelf = ws;
//        if (strongSelf) {
//            [strongSelf.dic setObject:obj forKey:key];
//        }
//    });
    
    SafeBarrier(self.queueSafe, ^(DBTool *strongSelf){
        [strongSelf.dic setObject:obj forKey:key];
    });
}
- (void)removeObj:(NSString *)obj key:(NSString *)key {
//    __weak typeof(self) ws = self;
//    dispatch_barrier_async(self.queueSafe, ^{
//        typeof(ws) strongSelf = ws;
//        if (strongSelf) {
//            [strongSelf.dic removeObjectForKey:key];
//        }
//    });
    
    SafeBarrier(self.queueSafe, ^(DBTool *strongSelf){
        [strongSelf.dic removeObjectForKey:key];
    });
}
- (NSMutableDictionary *)allValue {
    return self.dic;
}
- (void)show {
    
    NSArray *arr = [[self.dic allKeys] sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return obj1.integerValue < obj2.integerValue;
    }];
    NSLog(@"%@", arr);
}
@end














