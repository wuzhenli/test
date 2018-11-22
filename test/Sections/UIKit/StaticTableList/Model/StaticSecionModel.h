//
//  StaticSecionModel.h
//  test
//
//  Created by li’Pro on 2018/11/22.
//  Copyright © 2018 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StaticRowModel.h"
#import "StaticHeaderFooterView.h"

NS_ASSUME_NONNULL_BEGIN

@interface StaticSecionModel : NSObject

@property (strong, nonatomic) NSMutableArray<StaticRowModel *> *arrRowModel;

@property (copy, nonatomic) NSString *headerString;
@property (copy, nonatomic) NSString *footerString;

@property (assign, nonatomic) CGFloat minimumHeaderHeight;
@property (assign, nonatomic) CGFloat minimumFooterHeight;

@property (assign, nonatomic, readonly) CGFloat headerHeight;
@property (assign, nonatomic, readonly) CGFloat footerHeight;

@property (strong, nonatomic, nullable) StaticHeaderFooterView *headerView;
@property (strong, nonatomic, nullable) StaticHeaderFooterView *footerView;

@end

NS_ASSUME_NONNULL_END
