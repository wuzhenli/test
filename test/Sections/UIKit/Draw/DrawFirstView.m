//
//  DrawFirstView.m
//  test
//
//  Created by li’Pro on 2018/11/28.
//  Copyright © 2018 wzl. All rights reserved.
//

#import "DrawFirstView.h"

@implementation DrawFirstView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self CG_drawTest];
}

#pragma -mark CoreGraphics

- (void)CG_drawTest {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctx, 10, 10);
    CGContextAddLineToPoint(ctx, 100, 20);
    CGContextAddLineToPoint(ctx, 100, 90);
    CGContextAddLineToPoint(ctx, 20, 80);
    CGContextSetLineWidth(ctx, 6);
//     CGContextSetLineCap(ctx, kCGLineCapRound); // 开头、结尾样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound); // 转折点
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, 50, 10);
    CGContextAddLineToPoint(ctx, 80, 80);
    CGContextAddLineToPoint(ctx, 20, 90);
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    CGContextSetLineWidth(ctx, 10);
    CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextStrokePath(ctx);
}

- (void)cg_drawRect {
    CGRect rect = CGRectMake(10, 10, 90, 90);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // green background color
    CGContextAddRect(ctx, rect);
    CGContextSetFillColorWithColor(ctx, [UIColor greenColor].CGColor);
    CGContextFillPath(ctx);
    
    // red border
    CGContextAddRect(ctx, rect);
    CGContextSetLineWidth(ctx, 2);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokePath(ctx);
}

#pragma -mark UIBezierPath

- (void)simpleDrawRect {
    [[UIColor redColor] setFill];
    UIRectFill(CGRectMake(0, 0, 12, 90));
}

- (void)drawCornerRect {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(10, 10)];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinBevel;
    
    [[UIColor greenColor] setFill];
    [path fill];
    
    // 同时设置以下代码才有路径描边
    path.lineWidth = 1;
    [[UIColor redColor] setStroke];
    [path stroke];
}

- (void)drawMultiBorderShape {
    UIColor *color = [UIColor orangeColor];
    [color set]; // equal setStroke & setFill
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 2;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapSquare;
    
    [path moveToPoint:CGPointMake(10, 10)];
    [path addLineToPoint:CGPointMake(50, 10)];
    [path addLineToPoint:CGPointMake(100, 60)];
    [path addLineToPoint:CGPointMake(70, 89)];
    [path addLineToPoint:CGPointMake(40, 90)];
    [path addLineToPoint:CGPointMake(5, 60)];
    [path closePath];
    
    [path stroke];
//    [path fill];
}

@end
