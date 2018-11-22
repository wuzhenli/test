//
//  StaticSecionModel.m
//  test
//
//  Created by li’Pro on 2018/11/22.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "StaticSecionModel.h"

@implementation StaticSecionModel


- (NSMutableArray<StaticRowModel *> *)arrRowModel {
    if (!_arrRowModel) {
        _arrRowModel = @[].mutableCopy;
    }
    return _arrRowModel;
}

@end
