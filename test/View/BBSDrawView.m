//
//  BBSDrawView.m
//  test
//
//  Created by li’Pro on 2018/6/20.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "BBSDrawView.h"

@implementation BBSDrawView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
/*
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIRectCorner corner = UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerTopRight;
    
//    UIRectCornerTopLeft     = 1 << 0,
//    UIRectCornerTopRight    = 1 << 1,
//    UIRectCornerBottomLeft  = 1 << 2,
//    UIRectCornerBottomRight = 1 << 3,
    CGFloat width = 0.5;
    rect.origin.x = width ;
    rect.origin.y = width;
    rect.size.width -= width * 2;
    rect.size.height -= width * 2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:CGSizeMake(10, 10)];
    [[UIColor redColor] setStroke];
    [[UIColor blackColor] setFill];
    [path fill];
    path.lineWidth = width;
    [path stroke];
}
*/
@end

















