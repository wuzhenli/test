//
//  Tool.m
//  testCPlus
//
//  Created by li’Pro on 2019/3/15.
//  Copyright © 2019 JL. All rights reserved.
//

#import "Tool.h"

@implementation Tool

+ (void)testCount:(NSInteger)count {
    NSInteger a = 0;
    for (NSInteger i = 0; i < count; i++) {
        [self getCountWith:a];
    }
}

+ (NSInteger)getCountWith:(NSInteger)c {
    if (c) {
        return 1;
    } else {
        return 23;
    }
}

@end
