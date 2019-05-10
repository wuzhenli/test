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


/**
 添加过渡动画

 @param type 字符串
     CA_EXTERN CATransitionType const kCATransitionFade 渐变
     API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
     CA_EXTERN CATransitionType const kCATransitionMoveIn 新UUI 从其他方向移动过来
     API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
     CA_EXTERN CATransitionType const kCATransitionPush 新UUI 从其他方向移动过来，原UI 移走
     API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
     CA_EXTERN CATransitionType const kCATransitionReveal 从上面抽走
     .用字符串表示
     pageCurl            向下翻一页
     pageUnCurl          向上翻一页
     rippleEffect        滴水效果
     suckEffect          收缩效果，如一块布被抽走
     cube                立方体效果
     oglFlip             上下翻转效果
 @param subtype 枚举
 @param duration 动画时间
 @param timingFunction 动画速度方式
 */
- (void)ani_transitionWithType:(NSString *)type 
                       subtype:(EnumTransitionSubtype)subtype 
                      duration:(CFTimeInterval)duration 
                timingFunction:(EnumTransitionTimingFunction)timingFunction {
    
    CATransition *transition = [CATransition animation];
    transition.duration = duration;
    transition.type = type;
    transition.subtype = [self subTypeWith:subtype];
    transition.timingFunction = [self timingFunctionWith:timingFunction];
    
    
    [self addAnimation:transition forKey:nil];
}

#pragma -mark private

- (NSString *)subTypeWith:(EnumTransitionSubtype)subtype {
    NSString *subtypeValue = kCATransitionFromRight;
    switch (subtype) {
        case EnumTransitionSubtypeFromRight:
            subtypeValue = kCATransitionFromRight;
            break;
        case EnumTransitionSubtypeFromLeft:
            subtypeValue = kCATransitionFromLeft;
            break;
        case EnumTransitionSubtypeFromBottom:
            subtypeValue = kCATransitionFromBottom;
            break;
        case EnumTransitionSubtypeFromTop:
            subtypeValue = kCATransitionFromTop;
            break;
    }
    return subtypeValue;
}

- (CAMediaTimingFunction *)timingFunctionWith:(EnumTransitionTimingFunction)timingFunction {
    CAMediaTimingFunctionName functionName = kCAMediaTimingFunctionDefault;
    switch (timingFunction) {
        case EnumTransitionTimingFunctionLinear:
            functionName = kCAMediaTimingFunctionLinear;
            break;
        case EnumTransitionTimingFunctionEaseIn:
            functionName = kCAMediaTimingFunctionEaseIn;
            break;
        case EnumTransitionTimingFunctionEaseOut:
            functionName = kCAMediaTimingFunctionEaseOut;
            break;
        case EnumTransitionTimingFunctionEaseInEaseOut:
            functionName = kCAMediaTimingFunctionEaseInEaseOut;
            break;
        default:
            break;
    }
    return [CAMediaTimingFunction functionWithName:functionName];
}

@end
