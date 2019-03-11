//
//  KVOPerson.h
//  test
//
//  Created by li’Pro on 2018/8/6.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVOPerson : NSObject

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) NSUInteger age;

- (void)printInfo ;

@end
