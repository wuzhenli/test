//
//  Singleton.h
//  test
//
//  Created by li’s Air on 2018/3/20.
//  Copyright © 2018年 wzl. All rights reserved.
//

#ifndef Singleton_h
#define Singleton_h

#define singletonInterface(name) + (instancetype)share ## name

#define singletonImplementation(name, Class) \
+ (instancetype)share ## name { \
static Class *_ins = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_ins = [[Class alloc] init]; \
}); \
return _ins; \
}


#endif /* Singleton_h */
