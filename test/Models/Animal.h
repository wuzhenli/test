//
//  Animal.h
//  test
//
//  Created by li’Pro on 2017/12/22.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject
@property (copy, nonatomic) NSString *name;
- (instancetype)initWithName:(NSString *)name ;

@end
