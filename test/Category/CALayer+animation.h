//
//  CALayer+animation.h
//  test
//
//  Created by li’Pro on 2019/4/18.
//  Copyright © 2019 wzl. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (animation)

/**
 旋转晃动 3 下 
 */
- (void)ani_rotateShake ;

/**
 左右晃动 3 下
 */
- (void)ani_leftRightShake ;

@end

NS_ASSUME_NONNULL_END
