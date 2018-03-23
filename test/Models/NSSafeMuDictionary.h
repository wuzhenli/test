//
//  NSSafeMuDictionary.h
//  test
//
//  Created by li’Pro on 2018/3/23.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SafeDictionaryBlock)(NSMutableDictionary *dic, id key, id object);

@interface NSSafeMuDictionary<KeyType, ObjectType> : NSObject

- (void)objectForKey:(KeyType)aKey block:(SafeDictionaryBlock)block ;

- (void)setObject:(id)anObject forKey:(KeyType)aKey block:(SafeDictionaryBlock)block ;

- (void)removeObjectForKey:(KeyType)aKey block:(SafeDictionaryBlock)block ;





@end























