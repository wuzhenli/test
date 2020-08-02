//
//  InitObject.m
//  test
//
//  Created by li’Pro on 2020/8/2.
//  Copyright © 2020 wzl. All rights reserved.
//

#import "InitObject.h"

@implementation InitObject // : NSObject

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        _name = name.copy;
    }
    return self;
}

// 变成便利构造器
- (instancetype)init {
    if (self = [self initWithName:@"default name"]) {
        ;
    }
    return self;
}

@end
