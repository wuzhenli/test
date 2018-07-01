//
//  ThreadSafe.h
//  test
//
//  Created by li’Pro on 2018/3/23.
//  Copyright © 2018年 wzl. All rights reserved.
//

#ifndef ThreadSafe_h
#define ThreadSafe_h



#define SafeBarrier(queue, block)  \
__weak typeof(self) ws = self;  \
dispatch_barrier_async(queue, ^{   \
    typeof(ws) strongSelf = ws;   \
    if (strongSelf) {   \
        if (block) block(strongSelf);   \
    }   \
});

#define SafeContainerAsyncInMain(queue, block)  \
__weak typeof(self) ws = self;      \
dispatch_async(queue, ^{        \
typeof(ws) strongSelf = ws;    \
if (strongSelf && block) {        \
dispatch_async(dispatch_get_main_queue(), ^{  \
if (strongSelf) {  \
block(strongSelf);  \
}   \
});  \
}         \
});



#define SafeMainThreadBlock(block) \
if ([NSThread isMainThread]) { \
block(); \
} else { \
dispatch_async(dispatch_get_main_queue(), block); \
}


#endif /* ThreadSafe_h */
