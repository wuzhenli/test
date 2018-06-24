//
//  UIView+Corner.h
//  test
//
//  Created by li’Pro on 2018/6/21.
//  Copyright © 2018年 wzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Corner)
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect ;
@end
