//
//  AniLayer.m
//  test
//
//  Created by li’Pro on 2019/4/18.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "AniLayer.h"

@implementation AniLayer
@dynamic thickness;

+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([@"thickness" isEqualToString:key]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)ctx {
    CGRect r = CGRectInset(self.bounds, 5, 10);
    
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextFillRect(ctx, r);
    CGContextSetLineWidth(ctx, self.thickness);
    CGContextStrokeRect(ctx, r);
}

@end
