//
//  NSString+formatter.h
//  test
//
//  Created by li’Pro on 2018/4/13.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (formatter)

// 本日显示：hh：mm   本日之前显示：MM-DD   跨年显示：YYYY-MM-DD
- (NSString *)bbs_formatterText ;

@end
