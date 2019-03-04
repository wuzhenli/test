//
//  SafeArray.m
//  test
//
//  Created by li’s Air on 2019/3/4.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "SafeArray.h"

@interface SafeArray ()

@property (strong, nonatomic) dispatch_queue_t queue;
@property (strong, nonatomic) NSMutableArray *array;

@end


@implementation SafeArray

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.queue = dispatch_queue_create("test.array.thread.safe", DISPATCH_QUEUE_CONCURRENT);
        _array = [NSMutableArray new];
    }
    return self;
}

- (void)addObject:(id)anObject block:(SafeArrayBlock)block {
    __weak typeof(self) ws = self;
    
    dispatch_barrier_async(self.queue, ^{
        SafeArray *strongSelf = ws;
        if (!strongSelf) return;
        
        [self.array addObject:anObject];
        !block ? : block(strongSelf, anObject, NSNotFound);
    });
}

- (void)removeObjectAtIndex:(NSUInteger)index block:(SafeArrayBlock)block {
    __weak typeof(self) ws = self;
    
    dispatch_barrier_async(self.queue, ^{
        SafeArray *strongSelf = ws;
        if (!strongSelf) return;
        
        [self.array removeObjectAtIndex:index];
        !block ? : block(strongSelf, nil, index);
    });
}

@end
