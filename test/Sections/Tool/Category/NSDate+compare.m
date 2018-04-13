//
//  NSDate+compare.m
//  test
//
//  Created by li’Pro on 2018/4/13.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "NSDate+compare.h"

static NSString *const kFormatter = @"yyyy-MM-dd HH:mm:ss";

@implementation NSDate (compare)
+ (NSDate *)c_dateWithString:(NSString *)str {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = kFormatter;
    return [formatter dateFromString:str];
}


/**
*  是否为同一天
*/
- (BOOL)isSameDay:(NSDate*)date
{
    NSDate *dateCur = self;
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents* compCur = [calendar components:unitFlags fromDate:dateCur];
    NSDateComponents* compDate = [calendar components:unitFlags fromDate:date];
    
    return [compCur day]   == [compDate day] &&
        [compCur month] == [compDate month] &&
        [compCur year]  == [compDate year];
}
/**
 *  是否为同一月
 */
- (BOOL)isSameMonth:(NSDate*)date
{
    NSDate *dateCur = self;
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents* compCur = [calendar components:unitFlags fromDate:dateCur];
    NSDateComponents* compDate = [calendar components:unitFlags fromDate:date];
    
    return [compCur month] == [compDate month] &&
    [compCur year]  == [compDate year];
}
//
/**
 *  是否为同一年
 */
- (BOOL)isSameYear:(NSDate*)date
{
    NSDate *dateCur = self;
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unitFlags = NSCalendarUnitYear;
    NSDateComponents* compCur = [calendar components:unitFlags fromDate:dateCur];
    NSDateComponents* compDate = [calendar components:unitFlags fromDate:date];
    
    return [compCur year]  == [compDate year];
}
@end
