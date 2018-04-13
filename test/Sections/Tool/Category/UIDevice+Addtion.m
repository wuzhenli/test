//
//  UIDevice+Addtion.m
//  test
//
//  Created by li’s Air on 2018/3/28.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "UIDevice+Addtion.h"

@implementation UIDevice (Addtion)
+ (BOOL)ad_lessThenVersion:(NSString *)version {
    NSString *curV = [[self currentDevice] systemVersion];
    NSComparisonResult result = [curV compare:version options:NSNumericSearch];
    return NSOrderedAscending == result;
}
@end
