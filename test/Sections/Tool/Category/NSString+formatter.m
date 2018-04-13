//
//  NSString+formatter.m
//  test
//
//  Created by li’Pro on 2018/4/13.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "NSString+formatter.h"
#import "NSDate+compare.h"

@implementation NSString (formatter)

// 本日显示：hh：mm   本日之前显示：MM-DD   跨年显示：YYYY-MM-DD
- (NSString *)bbs_formatterText {
    NSDate *cur = [NSDate date];
    NSDate *date1 = [NSDate c_dateWithString:self];
    
    NSString *formatter = @"yyyy-MM-dd"; // @"yyyy-MM-dd HH:mm:ss";
    
    if ([cur isSameDay:date1]) { // 本日显示：hh：mm
        formatter = @"HH:mm";
    } else if ([cur isSameYear:date1]) { // 同年 ：01/01 --- 昨天
        formatter = @"MM-dd";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    
    return [dateFormatter stringFromDate:date1];
}


@end


















