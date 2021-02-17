//
//  TableModel.h
//  test
//
//  Created by li’Pro on 2020/12/6.
//  Copyright © 2020 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableModel : NSObject

@property (assign, nonatomic) NSUInteger ID;

+ (instancetype)modelWithId:(NSUInteger)ID;

@end

NS_ASSUME_NONNULL_END
