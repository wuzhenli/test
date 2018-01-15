//
//  Person.m
//  test
//
//  Created by li’Pro on 2018/1/11.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "Person.h"

@implementation Person
- (NSString *)description {
    return [NSString stringWithFormat:@"%@  %@", self.name, self.lastName];
}
@end
