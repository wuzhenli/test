//
//  MyCustomFormatter.m
//  test
//
//  Created by 吴贞利 on 2019/6/21.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "MyCustomFormatter.h"

@implementation MyCustomFormatter

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSString *logLevel;
    switch (logMessage->_flag) {
        case DDLogFlagError    : logLevel = @"E"; break;
        case DDLogFlagWarning  : logLevel = @"W"; break;
        case DDLogFlagInfo     : logLevel = @"I"; break;
        case DDLogFlagDebug    : logLevel = @"D"; break;
        default                : logLevel = @"V"; break;
    }
    
    return [NSString stringWithFormat:@"%@ | %@", logLevel, logMessage->_message];
}


@end
