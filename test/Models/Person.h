//
//  Person.h
//  test
//
//  Created by li’Pro on 2018/1/11.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSNumber *age;
@end
