//
//  CALayer+animation.m
//  test
//
//  Created by li’Pro on 2019/4/18.
//  Copyright © 2019 wzl. All rights reserved.
//

#import "CALayer+animation.h"

@implementation CALayer (animation)

- (void)ani_rotateShake {
    // Apple 不推荐使用 transform.rotation.z ，超过 1 次旋转这会使计算量复杂。
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
    anim.duration = 0.05;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    anim.repeatCount = 3;
    anim.autoreverses = YES;
    anim.additive = YES;
    
    anim.valueFunction = [CAValueFunction functionWithName:kCAValueFunctionRotateZ];
    anim.fromValue = @(M_PI / 40.);
    anim.toValue = @(-M_PI / 40.);
    
    [self addAnimation:anim forKey:nil];
    
//    CATransform3D nowValue = self.transform;
//    CATransform3D startValue = CATransform3DRotate(nowValue, M_PI/40., 0, 0, 1);
//    CATransform3D endValue = CATransform3DRotate(nowValue, -M_PI/40., 0, 0, 1);
//
//    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
//    anim.duration = 0.05;
//    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//
//    anim.repeatCount = 3;
//    anim.autoreverses = YES;
//    anim.fromValue = [NSValue valueWithCATransform3D:startValue];
//    anim.toValue = [NSValue valueWithCATransform3D:endValue];
//
//    [self addAnimation:anim forKey:nil];
     
}

- (void)ani_leftRightShake {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    anim.fromValue = @(-10);
    anim.toValue = @10;
    anim.valueFunction = [CAValueFunction functionWithName:kCAValueFunctionTranslateX];
    
    anim.duration = 0.05;
    anim.repeatCount = 3;
    anim.autoreverses = YES;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [self addAnimation:anim forKey:nil];
}

@end
