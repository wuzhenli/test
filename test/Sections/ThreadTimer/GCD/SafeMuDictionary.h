//
//  SafeMuDictionary.h
//  test
//
//  Created by li’s Air on 2019/3/4.
//  Copyright © 2019 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SafeMuDictionary;

NS_ASSUME_NONNULL_BEGIN

typedef void(^SafeDictionaryBlock)(SafeMuDictionary *dic, id obj, id aKey);

@interface SafeMuDictionary : NSMutableDictionary

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey block:(SafeDictionaryBlock)block ;

- (void)objectForKey:(id)aKey block:(SafeDictionaryBlock)block ;

- (NSDictionary *)getDictionary ;

@end

NS_ASSUME_NONNULL_END
