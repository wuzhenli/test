//
//  NSRunLoop+Hook.m
//  test
//
//  Created by li’Pro on 2018/12/25.
//  Copyright © 2018 wzl. All rights reserved.
//  https://juejin.im/entry/595f832c6fb9a06bc23a9d70

#import "NSRunLoop+Hook.h"
#import <objc/runtime.h>


@implementation NSRunLoop (Hook)

//
//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        [self _swizzleImpWithOrigin:@selector(runMode:beforeDate:) swizzle:@selector(xd_runMode:beforeDate:)];
//    });
//}
//
//+ (void)_swizzleImpWithOrigin:(SEL)originSelector swizzle:(SEL)swizzleSelector {
//    
//    Class _class = [self class];
//    Method originMethod = class_getInstanceMethod(_class, originSelector);
//    Method swizzleMethod = class_getInstanceMethod(_class, swizzleSelector);
//    
//    IMP originIMP = method_getImplementation(originMethod);
//    IMP swizzleIMP = method_getImplementation(swizzleMethod);
//    
//    BOOL add = class_addMethod(_class, originSelector, swizzleIMP, method_getTypeEncoding(swizzleMethod));
//    
//    if (add) {
//        class_addMethod(_class, swizzleSelector, originIMP, method_getTypeEncoding(originMethod));
//    } else {
//        method_exchangeImplementations(originMethod, swizzleMethod);
//    }
//}
//
//- (BOOL)xd_runMode:(NSRunLoopMode)mode beforeDate:(NSDate *)limitDate {
//    
//    NSThread *thread = [NSThread currentThread];
//    
//    // 这里我们只对自己创建的线程runloop的`runMode:beforeDate:`方法进行修改.
//    if ([thread.name isEqualToString:@"com.xindong.thread"]) {
//        NSLog(@"runloop+hook: com.xindong.thread线程\n\n");
//        return YES; //如果这里返回`NO`, runloop会立刻退出, 故要返回`YES`进行验证.
//    }
//    
//    NSLog(@"runloop+hook: 其他可能未知的线程%@\n\n", thread.name);
//    return [self xd_runMode:mode beforeDate:limitDate];
//}


@end
