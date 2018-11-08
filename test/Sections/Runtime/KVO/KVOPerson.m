//
//  KVOPerson.m
//  test
//
//  Created by li’Pro on 2018/8/6.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "KVOPerson.h"
#import <objc/message.h>

@implementation KVOPerson

- (void)printInfo {
    NSLog(@"isa:%@, supper class:%@", NSStringFromClass(object_getClass(self)),
          class_getSuperclass(object_getClass(self)));
    
    NSLog(@"self:%@, [self superclass]:%@", self, [self superclass]);
    
    NSLog(@"age setter function pointer:%p", class_getMethodImplementation(object_getClass(self), @selector(setAge:)));
    
    NSLog(@"name setter function pointer:%p", class_getMethodImplementation(object_getClass(self), @selector(setName:)));
    NSLog(@"printInfo function pointer:%p", class_getMethodImplementation(object_getClass(self), @selector(printInfo)));
    
    NSLog(@"--- end ---\n");
}
- (void)testMehtod {
//    objc_allocateClassPair(<#Class  _Nullable __unsafe_unretained superclass#>, <#const char * _Nonnull name#>, <#size_t extraBytes#>)
}

@end
