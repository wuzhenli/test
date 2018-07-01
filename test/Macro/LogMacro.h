//
//  LogMacro.h
//  test
//
//  Created by li’s Air on 2018/7/1.
//  Copyright © 2018年 wzl. All rights reserved.
//

#ifndef LogMacro_h
#define LogMacro_h

/** 自定义 log */
#define SOCKET_Log 0

#ifdef DEBUG
    #define DLog(...) NSLog(__VA_ARGS__);
#else
    #define DLog(...)
#endif

#ifdef DEBUG
    #define HYLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
    #define HYLog(...)
#endif

#if SOCKET_Log
# define SKLog(fmt, ...) NSLog((@"-- socket --" fmt), ##__VA_ARGS__);
#else
# define SKLog(...)
#endif




#endif /* LogMacro_h */







