//
//  KVOPattern.h
//  test
//
//  Created by li’Pro on 2019/3/12.
//  Copyright © 2019 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KVOPattern : NSObject {
    NSMutableArray<NSString *> *_books;
}

@property (strong, nonatomic) NSMutableArray<NSString *> *books;

@end

NS_ASSUME_NONNULL_END
