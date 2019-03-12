//
//  KVOPattern.m
//  test
//
//  Created by li’Pro on 2019/3/12.
//  Copyright © 2019 wzl. All rights reserved.
//
/* mutableArrayValueForKey： 流程
 1、查看是否实现 insertObject:in<Key>AtIndex: and removeObjectFrom<Key>AtIndex: 方法
        如果实现了 mutableArrayValueForKey 直接调用修改本类中数组的值
 2、没有实现可变数组方法， 查看是否实现了 <key> 的getter、setter 方法
        如果实现了，调用此方法修改 key 的 setter 方法，调用后 key 的指针会发生变化
 3、没有实现可变数组方法，和  <key> 的getter、setter 方法，调用 accessInstanceVariablesDirectly
        如果返回 YES，直接访问实例变量修改，实例变量的值，调用后 key 的指针会发生变化
 4、accessInstanceVariablesDirectly 返回 NO， 则抛出异常
 */

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
//    [_books insertObject:object atIndex:index];
//}
//- (void)removeObjectFromBooksAtIndex:(NSInteger)index {
//    NSLog(@"%s", __func__);
//    [_books removeObjectAtIndex:index];
//}

//- (void)setBooks:(NSMutableArray<NSString *> *)books {
//    _books = books;
//}

+ (BOOL)accessInstanceVariablesDirectly {
    NSLog(@"%s", __func__);
    return YES;
}


#pragma -mark ***** contact

/// 外界调用 valueForKey:@"contacts" 将返回下面2个方法返回的数组，组成数组返回
- (NSInteger)countOfContacts {
    return 4;
}
- (id)objectInContactsAtIndex:(NSUInteger)index {
    return @(index).stringValue;
}


//- (NSMutableArray<NSString *> *)books {
//    if (!_books) {
//        _books = @[].mutableCopy;
//    }
//    return _books;
//}

@end
