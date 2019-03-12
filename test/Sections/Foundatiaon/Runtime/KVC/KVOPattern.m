//
//  KVOPattern.m
//  test
//
//  Created by li’Pro on 2019/3/12.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "KVOPattern.h"

@implementation KVOPattern

//@dynamic books;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _books = @[].mutableCopy;
    }
    return self;
}


//// insertObject:atIndex
//- (void)insertObject:(id)object inBooksAtIndex:(NSInteger)index {
//    NSLog(@"%s", __func__);
//    [self.books insertObject:object atIndex:index];
//}
//- (void)removeObjectFromBooksAtIndex:(NSInteger)index {
//    NSLog(@"%s", __func__);
//    [self.books removeObjectAtIndex:index];
//}

- (void)setBooks:(NSMutableArray<NSString *> *)books {
    _books = books;
}

+ (BOOL)accessInstanceVariablesDirectly {
    NSLog(@"%s", __func__);
    return YES;
}



//- (NSMutableArray<NSString *> *)books {
//    if (!_books) {
//        _books = @[].mutableCopy;
//    }
//    return _books;
//}

@end
