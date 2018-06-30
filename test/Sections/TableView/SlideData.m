//
//  SlideData.m
//  test
//
//  Created by li’s Air on 2018/6/30.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "SlideData.h"

@implementation SlideData


+ (NSArray<SlideData *> *)defaultSlideData {
    NSMutableArray <SlideData *> *arr = @[].mutableCopy;
    for (NSUInteger i = 0; i<10; i++) {
        SlideData *data = [SlideData new];
        data.transition = i % 5;
        
        switch (data.transition) {
            case MGSwipeTransitionBorder: {
                data.title = @"MGSwipeTransitionBorder";
                break;
            }
            case MGSwipeTransitionStatic: {
                data.title = @"MGSwipeTransitionStatic";
                break;
            }
            case MGSwipeTransitionDrag: {
                data.title = @"MGSwipeTransitionDrag";
                break;
            }
            case MGSwipeTransitionClipCenter: {
                data.title = @"MGSwipeTransitionClipCenter";
                break;
            }
            case MGSwipeTransitionRotate3D: {
                data.title = @"MGSwipeTransitionRotate3D";
                break;
            }
        }
//        typedef NS_ENUM(NSInteger, MGSwipeTransition) {
//            MGSwipeTransitionBorder = 0,
//            MGSwipeTransitionStatic,
//            MGSwipeTransitionDrag,
//            MGSwipeTransitionClipCenter,
//            MGSwipeTransitionRotate3D
//        };
        [arr addObject:data];
    }
    return arr;
}
@end
