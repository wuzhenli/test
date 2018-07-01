//
//  SlideData.h
//  test
//
//  Created by li’s Air on 2018/6/30.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MGSwipeTableCell.h"

@interface SlideData : NSObject
@property (assign, nonatomic) MGSwipeTransition transition;
@property (copy, nonatomic) NSString *title;

+ (NSArray<SlideData *> *)defaultSlideData ;

@end
