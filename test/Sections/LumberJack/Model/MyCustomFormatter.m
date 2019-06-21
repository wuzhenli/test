//
//  MyCustomFormatter.m
//  test
//
//  Created by 吴贞利 on 2019/6/21.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "MyCustomFormatter.h"


@interface MyCustomFormatter () {
    DDAtomicCounter *atomicLoggerCounter;
    NSDateFormatter *threadUnsafeDateFormatter;
}

@end


@implementation MyCustomFormatter

- (NSString *)stringFromDate:(NSDate *)date {
    NSString *dateFormatString = @"yyyy/MM/dd HH:mm:ss:SSS";
    int32_t loggerCount = [atomicLoggerCounter value];
    
    if (loggerCount <= 1) {
        // Single-threaded mode.
        
        if (threadUnsafeDateFormatter == nil) {
            threadUnsafeDateFormatter = [[NSDateFormatter alloc] init];
            [threadUnsafeDateFormatter setDateFormat:dateFormatString];
        }
        
        return [threadUnsafeDateFormatter stringFromDate:date];
    } else {
        // Multi-threaded mode.
        // NSDateFormatter is NOT thread-safe.
        
        NSString *key = @"MyCustomFormatter_NSDateFormatter";
        
        NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
        NSDateFormatter *dateFormatter = [threadDictionary objectForKey:key];
        
        if (dateFormatter == nil) {
            dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:dateFormatString];
            
            [threadDictionary setObject:dateFormatter forKey:key];
        }
        
        return [dateFormatter stringFromDate:date];
    }
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSString *logLevel;
    switch (logMessage->_flag) {
        case DDLogFlagError    : logLevel = @"E"; break;
        case DDLogFlagWarning  : logLevel = @"W"; break;
        case DDLogFlagInfo     : logLevel = @"I"; break;
        case DDLogFlagDebug    : logLevel = @"D"; break;
        default                : logLevel = @"V"; break;
    }
    
    NSString *dateAndTime = [self stringFromDate:(logMessage.timestamp)];
    NSString *logMsg = logMessage->_message;
    
    return [NSString stringWithFormat:@"%@ %@ | %@", logLevel, dateAndTime, logMsg];
}

- (void)didAddToLogger:(id <DDLogger>)logger {
    [atomicLoggerCounter increment];
}

- (void)willRemoveFromLogger:(id <DDLogger>)logger {
    [atomicLoggerCounter decrement];
}

@end
