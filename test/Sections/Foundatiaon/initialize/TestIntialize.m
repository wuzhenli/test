//
//  TestIntialize.m
//  test
//
//  Created by li’Pro on 2020/8/2.
//  Copyright © 2020 wzl. All rights reserved.
//

#import "TestIntialize.h"
#import "InitObject.h"
#import "CircleViewController.h"
#import "HotFeedsViewController.h"

@implementation TestIntialize

- (void)test {
    InitObject *o = [[InitObject alloc] initWithName:@"name"];
    NSLog(@"%@", o);
    
    CircleViewController *circleVC = [[CircleViewController alloc] init];
    NSLog(@"%@ %@", circleVC, [[HotFeedsViewController alloc] initWithCommunityId:@"12"]);
}

@end
