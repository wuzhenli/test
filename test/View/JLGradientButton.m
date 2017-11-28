//
//  JLGradientButton.m
//  test
//
//  Created by li’Pro on 2017/10/24.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import "JLGradientButton.h"

@interface JLGradientButton()
@property (strong, nonatomic) CAGradientLayer *gradientLayer;

@end

@implementation JLGradientButton


- (void)layoutSubviews {
    [super layoutSubviews];
    
    // add gradient layer for reward button
    [CATransaction begin];
    [CATransaction setDisableActions:YES];    
    
    self.gradientLayer.frame = self.bounds;
    [self.layer insertSublayer:self.gradientLayer atIndex:0];
    
    [CATransaction commit];
}

#pragma -mark 
#pragma -mark setter
- (void)setGradientLayerHidden:(BOOL)isHidden {
    self.gradientLayer.hidden = isHidden;
}

- (void)setColors:(NSArray *)colors {
    self.gradientLayer.colors = colors;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
-(void)setLocations:(NSArray<NSNumber *> *)locations {
    self.gradientLayer.locations = locations;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
- (void)setStartPoint:(CGPoint)startPoint {
    self.gradientLayer.startPoint = startPoint;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setEndPoint:(CGPoint)endPoint {
    self.gradientLayer.endPoint = endPoint;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

// Writable atomic property cannot pair a synthesized getter with a user defined setter

- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        CAGradientLayer *layer = [CAGradientLayer layer];
        NSValue *colorLeft = (__bridge id)[UIColor colorWithRed:237/255.f green:107/255.f blue:82/255.f alpha:1].CGColor;
        NSValue *colorRight = (__bridge id)[UIColor colorWithRed:235/255.f green:75/255.f blue:65/255.f alpha:1].CGColor;
        layer.colors = @[colorLeft, colorRight];
        
        layer.startPoint = CGPointMake(0, 0.5);
        layer.endPoint = CGPointMake(1, 0.5);        
        layer.cornerRadius = 0;
        _gradientLayer = layer;
    }
    return _gradientLayer;
}
@end


























