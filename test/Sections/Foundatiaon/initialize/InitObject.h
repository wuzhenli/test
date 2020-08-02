//
//  InitObject.h
//  test
//
//  Created by li’Pro on 2020/8/2.
//  Copyright © 2020 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InitObject : NSObject

@property (copy, nonatomic, readonly) NSString *name;

- (instancetype)initWithName:(NSString *)name NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
