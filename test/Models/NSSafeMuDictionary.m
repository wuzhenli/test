//
//  NSSafeMuDictionary.m
//  test
//
//  Created by li’Pro on 2018/3/23.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "NSSafeMuDictionary.h"

@interface NSSafeMuDictionary ()
@property (strong, nonatomic) dispatch_queue_t queueSafe;
@property (strong, nonatomic) NSMutableDictionary *dic;

@end

@implementation NSSafeMuDictionary

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.queueSafe = dispatch_queue_create("com.bbs.www.safeMuDictionary", DISPATCH_QUEUE_CONCURRENT);
        self.dic = [NSMutableDictionary new];
    }
    return self;
}


- (void)objectForKey:(id)aKey block:(SafeDictionaryBlock)block {
    __weak typeof(self) ws = self;
    dispatch_async(self.queueSafe, ^{
        typeof(ws) strongSelf = ws;
        if (strongSelf) {
            id obj = [strongSelf.dic objectForKey:aKey];
            if (block) {
                block(strongSelf.dic, aKey, obj);
            }
        }
    });
}

- (void)setObject:(id)anObject forKey:(id)aKey block:(SafeDictionaryBlock)block {
    __weak typeof(self) ws = self;
    dispatch_barrier_async(self.queueSafe, ^{
        typeof(ws) strongSelf = ws;
        if (strongSelf) {
            [strongSelf.dic setObject:anObject forKey:aKey];
            
            if (block) {
                block(strongSelf.dic, aKey, anObject);
            }
        }
    });
}

- (void)removeObjectForKey:(id)aKey block:(SafeDictionaryBlock)block {
    __weak typeof(self) ws = self;
    dispatch_barrier_async(self.queueSafe, ^{
        typeof(ws) strongSelf = ws;
        if (strongSelf) {
            [strongSelf.dic removeObjectForKey:aKey];
            
            if (block) {
                block(strongSelf.dic, aKey, nil);
            }
        }
    });
}

@end






















