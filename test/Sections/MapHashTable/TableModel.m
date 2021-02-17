//
//  TableModel.m
//  test
//
//  Created by li’Pro on 2020/12/6.
//  Copyright © 2020 wzl. All rights reserved.
//

#import "TableModel.h"

@implementation TableModel

+ (instancetype)modelWithId:(NSUInteger)ID {
    TableModel *m = [TableModel new];
    m.ID = ID;
    return m;
}

- (NSUInteger)hash {
    NSLog(@" -- hash:%lu", self.ID);
    return self.ID;
}

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[TableModel class]]) {
        NSLog(@" -- isEqual:%lu ! isKindOfClass", self.ID);
        return NO;
    }
    TableModel *obj = (TableModel *)object;
    NSLog(@" -- isEqual:%lu  -  %lu", self.ID, obj.ID);
    return obj.ID == self.ID;
}

@end
