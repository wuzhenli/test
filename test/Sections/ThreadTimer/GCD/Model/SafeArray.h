//
//  SafeArray.h
//  test
//
//  Created by li’s Air on 2019/3/4.
//  Copyright © 2019 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SafeArray;

NS_ASSUME_NONNULL_BEGIN

typedef void(^SafeArrayBlock)(SafeArray *array, id _Nonnull obj, NSInteger index);


@interface SafeArray : NSMutableArray

- (void)addObject:(id)anObject block:(SafeArrayBlock)block ;

- (void)removeObjectAtIndex:(NSUInteger)index block:(SafeArrayBlock)block ;

@end

NS_ASSUME_NONNULL_END
