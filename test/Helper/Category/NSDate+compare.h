//
//  NSDate+compare.h
//  test
//
//  Created by li’Pro on 2018/4/13.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (compare)
/**
 根据字符串获取 时间 NSDate
 */
+ (NSDate *)c_dateWithString:(NSString *)str ;
/**
 *  是否为同一天
 */
- (BOOL)isSameDay:(NSDate*)date ;
/**
 *  是否为同一月
 */
- (BOOL)isSameMonth:(NSDate*)date ;
/**
 *  是否为同一年
 */
- (BOOL)isSameYear:(NSDate*)date ;

@end
