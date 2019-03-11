//
//  Person+category.m
//  test
//
//  Created by li’s Air on 2018/8/19.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "LIPerson+category.h"

@implementation LIPerson (category)

+ (void)load {
    NSLog(@"%s", __func__);
}

+ (void)initialize {
    NSLog(@"%s", __func__);
}

@end
