//
//  JLGradientButton.h
//  test
//
//  Created by li’Pro on 2017/10/24.
//  Copyright © 2017年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLGradientButton : UIButton

/* The array of CGColorRef objects defining the color of each gradient
 * stop. Defaults to [(237, 107, 82),(235, 75, 65)]. Animatable. */
- (void)setColors:(NSArray *)colors ;

/* An optional array of NSNumber objects defining the location of each
 * gradient stop as a value in the range [0,1]. The values must be
 * monotonically increasing. If a nil array is given, the stops are
 * assumed to spread uniformly across the [0,1] range. When rendered,
 * the colors are mapped to the output colorspace before being
 * interpolated. Defaults to nil. Animatable. */
-(void)setLocations:(NSArray<NSNumber *> *)locations ;

/* The start and end points of the gradient when drawn into the layer's
 * coordinate space. The start point corresponds to the first gradient
 * stop, the end point to the last gradient stop. Both points are
 * defined in a unit coordinate space that is then mapped to the
 * layer's bounds rectangle when drawn. (I.e. [0,0] is the bottom-left
 * corner of the layer, [1,1] is the top-right corner.) The default values
 * are [0,.5] and [1,.5] respectively. Both are animatable. */
- (void)setStartPoint:(CGPoint)startPoint ;
- (void)setEndPoint:(CGPoint)endPoint ;

@end
