//
//  CALayer+animation.h
//  test
//
//  Created by li’Pro on 2019/4/18.
//  Copyright © 2019 wzl. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, EnumTransitionSubtype) {
    EnumTransitionSubtypeFromRight,
    EnumTransitionSubtypeFromLeft,
    EnumTransitionSubtypeFromTop,
    EnumTransitionSubtypeFromBottom
};

typedef NS_ENUM(NSUInteger, EnumTransitionTimingFunction) {
    EnumTransitionTimingFunctionLinear,
    EnumTransitionTimingFunctionEaseIn,
    EnumTransitionTimingFunctionEaseOut,
    EnumTransitionTimingFunctionEaseInEaseOut,
    EnumTransitionTimingFunctionDefault
};


///** Timing function names. **/
//
//CA_EXTERN CAMediaTimingFunctionName const kCAMediaTimingFunctionLinear
//API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
//CA_EXTERN CAMediaTimingFunctionName const kCAMediaTimingFunctionEaseIn
//API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
//CA_EXTERN CAMediaTimingFunctionName const kCAMediaTimingFunctionEaseOut
//API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
//CA_EXTERN CAMediaTimingFunctionName const kCAMediaTimingFunctionEaseInEaseOut
//API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
//CA_EXTERN CAMediaTimingFunctionName const kCAMediaTimingFunctionDefault
//API_AVAILABLE(macos(10.6), ios(3.0), watchos(2.0), tvos(9.0));


@interface CALayer (animation)

/**
 旋转晃动 3 下 
 */
- (void)ani_rotateShake ;

/**
 左右晃动 3 下
 */
- (void)ani_leftRightShake ;


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
                       subType:(EnumTransitionSubtype)subtype 
                      duration:(CFTimeInterval)duration 
                timingFunction:(EnumTransitionTimingFunction)timingFunction ; 

@end

NS_ASSUME_NONNULL_END
