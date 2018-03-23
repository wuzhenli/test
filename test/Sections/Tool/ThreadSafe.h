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



#endif /* ThreadSafe_h */
