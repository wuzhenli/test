//
//  UIView+Corner.m
//  test
//
//  Created by li’Pro on 2018/6/21.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import "UIView+Corner.h"

@implementation UIView (Corner)
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}
@end
