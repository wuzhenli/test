//
//  SafeMuDictionary.m
//  test
//
//  Created by li’s Air on 2019/3/4.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "SafeMuDictionary.h"

@interface SafeMuDictionary ()

@property (strong, nonatomic) dispatch_queue_t queue;
@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@implementation SafeMuDictionary

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.queue = dispatch_queue_create("safe.mutable.dictionary", DISPATCH_QUEUE_CONCURRENT);
        _dictionary = [NSMutableDictionary new];
    }
    return self;
}

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey block:(SafeDictionaryBlock)block {
    __weak typeof(self) ws = self;
    dispatch_barrier_async(_queue, ^{
        typeof(self) strongSelf = ws;
        if (!strongSelf) return;
        
        [self.dictionary setObject:anObject forKey:aKey];
        !block ? : block(self, anObject, aKey);
    });
}

- (void)objectForKey:(id)aKey block:(SafeDictionaryBlock)block {
    __weak typeof(self) ws = self;
    dispatch_async(_queue, ^{
        typeof(self) strongSelf = ws;
        if (!strongSelf) return;
        
        !block ? : block(self, [self.dictionary objectForKey:aKey], aKey);
    });
}

- (NSDictionary *)getDictionary {
    return [self.dictionary copy];
}

@end
